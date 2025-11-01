function ADVR.onLoad()
	pickup.name = "Whipping Toy"
	pickup.desc = "When hit by a boss the first time, you take no damage"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.priority = -1000 -- run late to be sure to set dmg to 0 when hit
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onPickup()
	pickup.RegisterItem()
	HasBeenHit = false
end

function ADVR.onPlayerHit(damage)
	local room = game.currentWorldGenerator.GetRoomAtRealPos(player.transform.position, true)
	if room ~= nil and room.type == roomTypes.BOSS and HasBeenHit == false then
		HasBeenHit = true
		return 0
	end

	return damage
end

function ADVR.onDungeonGenerated(worldGenerator)
	HasBeenHit = false
end