import { world, system, Player, BlockPermutation, Dimension, Vector3, StartupEvent } from "@minecraft/server";

const PORTAL_DIMENSION_ID = "three_realms:haunted";
const OVERWORLD_DIMENSION_ID = "minecraft:overworld";
const FRAME_ID = "three_realms:haunted_portal";
const CORE_ID = "three_realms:cursed_gate_core";
const IGNITER_ID = "three_realms:soul_igniter";
const RETURN_DATA_KEY = "three_realms:return_location";
const PORTAL_COOLDOWN_TICKS = 80;
const CHARGE_TICKS = 80;
const OPENING_TICKS = 30;
const ACTIVE_TICKS = 20 * 60 * 10;
const PORTAL_SCAN_RADIUS = 4;
const PORTAL_SCAN_VERTICAL = 5;
const PORTAL_PLAYER_RADIUS = 2.3;
const DESTINATION = { x: 0.5, y: 66, z: 0.5 };
const DESTINATION_PLATFORM_Y = 64;
const RETURN_FALLBACK = { x: 0.5, y: 80, z: 0.5 };
const RETURN_GATE_ORIGIN = { x: 0, y: 79, z: 0 };
const RETURN_GATE_AREA_ID = "three_realms:haunted_return_gate";

type PortalState = "INACTIVE" | "ACTIVATING" | "CHARGING" | "OPENING" | "ACTIVE";
interface PortalRecord { origin: Vector3; dimensionId: string; state: PortalState; changedAt: number; }
const portals = new Map<string, PortalRecord>();
const cooldowns = new Map<string, number>();
let customDimensionReady = false;
let returnGatePromise: Promise<void> | undefined;

function portalKey(dimensionId: string, origin: Vector3): string { return `${dimensionId}:${Math.floor(origin.x)},${Math.floor(origin.y)},${Math.floor(origin.z)}`; }
function isReturnGateOrigin(origin: Vector3): boolean { return origin.x === RETURN_GATE_ORIGIN.x && origin.y === RETURN_GATE_ORIGIN.y && origin.z === RETURN_GATE_ORIGIN.z; }
function coreLocation(origin: Vector3): Vector3 { return { x: origin.x + 2, y: origin.y + 2, z: origin.z }; }
function isFrameBlock(block: any): boolean { return block?.typeId === FRAME_ID; }
function isAirBlock(block: any): boolean { return !block || block.typeId === "minecraft:air" || block.typeId === "minecraft:cave_air" || block.typeId === "minecraft:void_air"; }

function framePositions(origin: Vector3): Vector3[] {
  const positions: Vector3[] = [];
  for (let x = 0; x < 5; x++) { positions.push({ x: origin.x + x, y: origin.y, z: origin.z }); positions.push({ x: origin.x + x, y: origin.y + 5, z: origin.z }); }
  for (let y = 1; y < 5; y++) { positions.push({ x: origin.x, y: origin.y + y, z: origin.z }); positions.push({ x: origin.x + 4, y: origin.y + y, z: origin.z }); }
  return positions;
}
function openingPositions(origin: Vector3): Vector3[] {
  const positions: Vector3[] = [];
  for (let x = 1; x <= 3; x++) for (let y = 1; y <= 4; y++) positions.push({ x: origin.x + x, y: origin.y + y, z: origin.z });
  return positions;
}
function isCompleteFrame(dimension: Dimension, origin: Vector3, requireEmptyOpening = true): boolean {
  if (!framePositions(origin).every((position) => isFrameBlock(dimension.getBlock(position)))) return false;
  return !requireEmptyOpening || openingPositions(origin).every((position) => isAirBlock(dimension.getBlock(position)));
}
function findPortalOrigin(dimension: Dimension, around: Vector3): Vector3 | undefined {
  const baseX = Math.floor(around.x); const baseY = Math.floor(around.y); const baseZ = Math.floor(around.z);
  for (let ox = baseX - PORTAL_SCAN_RADIUS; ox <= baseX + 1; ox++) for (let oy = baseY - PORTAL_SCAN_VERTICAL; oy <= baseY + 1; oy++) {
    const candidate = { x: ox, y: oy, z: baseZ }; if (isCompleteFrame(dimension, candidate, true)) return candidate;
  }
  return undefined;
}
function setPortalCore(dimension: Dimension, origin: Vector3, permutation: any): void { for (const position of openingPositions(origin)) dimension.getBlock(position)?.setPermutation(permutation); }
function setPortalState(dimension: Dimension, origin: Vector3, state: PortalState): void {
  portals.set(portalKey(dimension.id, origin), { origin: { ...origin }, dimensionId: dimension.id, state, changedAt: system.currentTick });
  setPortalCore(dimension, origin, BlockPermutation.resolve(state === "OPENING" || state === "ACTIVE" ? CORE_ID : "minecraft:air"));
}
function notify(player: Player, message: string): void { try { player.sendMessage(message); } catch (error) { console.warn(`[three_realms] message failed: ${String(error)}`); } }
function playSound(dimension: Dimension, soundId: string, location: Vector3, options: any): void { try { dimension.playSound(soundId, location, options); } catch (error) { console.warn(`[three_realms] sound ${soundId} failed: ${String(error)}`); } }
function spawnPortalParticle(dimension: Dimension, location: Vector3, state: PortalState): void {
  const effect = state === "ACTIVE" ? "minecraft:endrod" : "minecraft:basic_flame_particle";
  try { dimension.spawnParticle(effect, { x: location.x + (Math.random() - 0.5) * 2.5, y: location.y + Math.random() * 3.5 - 1.5, z: location.z + 0.15 }); }
  catch (error) { console.warn(`[three_realms] particle ${effect} failed: ${String(error)}`); }
}
function isInsideOpening(location: Vector3, origin: Vector3): boolean { return location.x > origin.x + 0.2 && location.x < origin.x + 3.8 && location.y > origin.y + 0.1 && location.y < origin.y + 4.9 && Math.abs(location.z - origin.z) < 0.8; }
function readReturnLocation(player: Player): Vector3 | undefined {
  try { const value = player.getDynamicProperty(RETURN_DATA_KEY); if (typeof value !== "string") return undefined; const parsed = JSON.parse(value); if (parsed && typeof parsed.x === "number" && typeof parsed.y === "number" && typeof parsed.z === "number") return parsed; }
  catch (error) { console.warn(`[three_realms] return location read failed: ${String(error)}`); }
  return undefined;
}
function writeReturnLocation(player: Player, location: Vector3): void { try { player.setDynamicProperty(RETURN_DATA_KEY, JSON.stringify({ x: location.x, y: location.y, z: location.z })); } catch (error) { console.warn(`[three_realms] return location write failed: ${String(error)}`); } }
function isSafeArrival(dimension: Dimension, location: Vector3): boolean {
  try { const feet = dimension.getBlock({ x: Math.floor(location.x), y: Math.floor(location.y), z: Math.floor(location.z) }); const head = dimension.getBlock({ x: Math.floor(location.x), y: Math.floor(location.y + 1), z: Math.floor(location.z) }); const below = dimension.getBlock({ x: Math.floor(location.x), y: Math.floor(location.y - 1), z: Math.floor(location.z) }); return isAirBlock(feet) && isAirBlock(head) && !isAirBlock(below); }
  catch (error) { console.warn(`[three_realms] safe-arrival check failed: ${String(error)}`); return false; }
}
function resolveReturnDestination(dimension: Dimension, remembered?: Vector3): Vector3 {
  if (remembered && isSafeArrival(dimension, remembered)) return remembered;
  if (isSafeArrival(dimension, RETURN_FALLBACK)) return RETURN_FALLBACK;
  try { const spawn = world.getDefaultSpawnLocation(); if (isSafeArrival(dimension, spawn)) return spawn; } catch (error) { console.warn(`[three_realms] default spawn lookup failed: ${String(error)}`); }
  return RETURN_FALLBACK;
}
function teleportThrough(player: Player): void {
  let now: number | undefined;
  try {
    now = system.currentTick; if (!player.isValid) return;
    const lastTeleport = cooldowns.get(player.id) ?? -PORTAL_COOLDOWN_TICKS; if (now - lastTeleport < PORTAL_COOLDOWN_TICKS) return;
    const enteringHaunted = player.dimension.id !== PORTAL_DIMENSION_ID; const target = world.getDimension(enteringHaunted ? PORTAL_DIMENSION_ID : OVERWORLD_DIMENSION_ID); const destination = enteringHaunted ? DESTINATION : resolveReturnDestination(target, readReturnLocation(player));
    if (enteringHaunted && !isSafeArrival(target, destination)) { notify(player, "§cThe Haunted destination is not ready yet."); return; }
    cooldowns.set(player.id, now); if (enteringHaunted) writeReturnLocation(player, { ...player.location });
    player.teleport(destination, { dimension: target, facingLocation: { x: destination.x, y: destination.y, z: destination.z + 1 } }); playSound(target, "three_realms.haunted_teleport", destination, { volume: 0.75, pitch: 1 });
  } catch (error) { console.warn(`[three_realms] teleport failed: ${String(error)}`); if (player.isValid) notify(player, "§cThe gate could not complete the teleport."); if (now !== undefined) cooldowns.delete(player.id); }
}
function activatePortal(player: Player, dimension: Dimension, origin: Vector3): void {
  const current = portals.get(portalKey(dimension.id, origin)); if (current && current.state !== "INACTIVE") { notify(player, "§bThe Haunted Gate is already awake."); return; }
  if (!isCompleteFrame(dimension, origin, true)) { notify(player, "§7The Haunted Gate frame is incomplete or obstructed."); return; }
  setPortalState(dimension, origin, "ACTIVATING"); notify(player, "§bThe Soul Igniter answers. The gate begins to breathe."); playSound(dimension, "three_realms.haunted_activate", coreLocation(origin), { volume: 0.8, pitch: 0.8 });
  system.runTimeout(() => { if (isCompleteFrame(dimension, origin, false)) setPortalState(dimension, origin, "CHARGING"); else setPortalState(dimension, origin, "INACTIVE"); }, 10);
  system.runTimeout(() => { if (portals.get(portalKey(dimension.id, origin))?.state === "CHARGING" && isCompleteFrame(dimension, origin, false)) setPortalState(dimension, origin, "OPENING"); }, CHARGE_TICKS);
  system.runTimeout(() => { if (portals.get(portalKey(dimension.id, origin))?.state === "OPENING" && isCompleteFrame(dimension, origin, false)) { setPortalState(dimension, origin, "ACTIVE"); notify(player, "§fHAUNTED GATE §7is open. Enter physically."); } else setPortalState(dimension, origin, "INACTIVE"); }, CHARGE_TICKS + OPENING_TICKS);
}
async function ensureReturnGate(): Promise<void> {
  if (!customDimensionReady || returnGatePromise) return returnGatePromise;
  returnGatePromise = (async () => {
    const dimension = world.getDimension(PORTAL_DIMENSION_ID);
    try {
      await world.tickingAreaManager.createTickingArea(RETURN_GATE_AREA_ID, { dimension, from: { x: -4, y: 63, z: -4 }, to: { x: 8, y: 86, z: 4 } });
      const floor = BlockPermutation.resolve("minecraft:obsidian"); for (let x = -2; x <= 6; x++) for (let z = -2; z <= 2; z++) dimension.getBlock({ x, y: DESTINATION_PLATFORM_Y, z })?.setPermutation(floor);
      const frame = BlockPermutation.resolve(FRAME_ID); for (const position of framePositions(RETURN_GATE_ORIGIN)) dimension.getBlock(position)?.setPermutation(frame);
      setPortalCore(dimension, RETURN_GATE_ORIGIN, BlockPermutation.resolve(CORE_ID)); portals.set(portalKey(dimension.id, RETURN_GATE_ORIGIN), { origin: { ...RETURN_GATE_ORIGIN }, dimensionId: dimension.id, state: "ACTIVE", changedAt: system.currentTick });
    } finally { try { world.tickingAreaManager.removeTickingArea(RETURN_GATE_AREA_ID); } catch (error) { console.warn(`[three_realms] return gate ticking-area cleanup failed: ${String(error)}`); } }
  })().catch((error) => { console.warn(`[three_realms] return gate setup failed: ${String(error)}`); returnGatePromise = undefined; });
  return returnGatePromise;
}

system.beforeEvents.startup.subscribe((event: StartupEvent) => { try { event.dimensionRegistry.registerCustomDimension(PORTAL_DIMENSION_ID); customDimensionReady = true; } catch (error) { console.warn(`[three_realms] custom dimension registration failed: ${String(error)}`); } });
world.afterEvents.worldLoad.subscribe(() => { if (customDimensionReady) void ensureReturnGate(); });
world.afterEvents.itemStartUseOn.subscribe((event) => { const player = event.source; const item = event.itemStack; if (!(player instanceof Player) || !item || item.typeId !== IGNITER_ID) return; const origin = findPortalOrigin(event.block.dimension, event.block.location); if (!origin) { notify(player, "§7The Soul Igniter needs a complete Haunted Gate frame nearby."); return; } activatePortal(player, event.block.dimension, origin); });

system.runInterval(() => {
  for (const [id, portal] of portals) {
    try {
      const dimension = world.getDimension(portal.dimensionId); const center = coreLocation(portal.origin); if (portal.state !== "INACTIVE") spawnPortalParticle(dimension, center, portal.state); if (portal.state !== "ACTIVE") continue;
      if (!isCompleteFrame(dimension, portal.origin, false)) { setPortalState(dimension, portal.origin, "INACTIVE"); continue; }
      for (const player of dimension.getPlayers({ location: center, maxDistance: PORTAL_PLAYER_RADIUS })) if (isInsideOpening(player.location, portal.origin)) teleportThrough(player);
      if (system.currentTick - portal.changedAt > ACTIVE_TICKS && !isReturnGateOrigin(portal.origin)) setPortalState(dimension, portal.origin, "INACTIVE");
    } catch (error) { console.warn(`[three_realms] portal tick ${id} failed: ${String(error)}`); portals.delete(id); }
  }
}, 10);
