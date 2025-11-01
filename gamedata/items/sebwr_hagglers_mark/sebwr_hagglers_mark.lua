function ADVR.onLoad()
	pickup.name = "Haggler's Mark"
	pickup.desc = "Once charged, use to teleport to the area merchant"
	pickup.weight = 75
	pickup.maxAmount = 1
	pickup.amountUses = 50
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isActivateItem = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function Recharge()
	pickup.currentCharge = 9999
	game.activePickupSlot.UpdateChargeDisplay()
end

function ADVR.onPickupActivate()
	local allRooms = game.currentWorldGenerator.GetAllRoomsInWorldAsList()

	local room = game.currentWorldGenerator.GetRoomAtRealPos(player.transform.position)
	if room == nil then
		pickup.CallFunctionIn("Recharge", 1)
		return
	end

	if room.type == roomTypes.BOSS or room.type == roomTypes.AFTERBOSS_START or room.type == roomTypes.START or room.type == roomTypes.CHALLENGE then
		audio.PlaySoundLocal(sounds.ERROR, player.transform.position)
		pickup.CallFunctionIn("Recharge", 1)
		return
	end

	for room in allRooms do
		if room.type == roomTypes.SHOP then
			local tilesOfShop = room.baseTiles
			for _, tile in ipairs(tilesOfShop) do
				if tile.isDoor then
					local doorPos = tile.pos
					game.playerController.useGravity = false
					player.playerHitEffect.FadeScreen(true, 2.0)
					local teleportTargetPos = room.GetWorldPosBase() + vector3.__new(0,1,0) + vector3.__new(doorPos.x * 4, 0, doorPos.y * 4)
					pickup.CallFunctionIn("TeleportPlayer", 0.5, teleportTargetPos, room.rotation)
				end
			end
			return
		end
	end
end

function TeleportPlayer(pos, rot)
	game.TeleportTo(pos, true)
	game.FaceInDir(360 - rot)
	pickup.CallFunctionIn("AfterTeleport", 2.0)
end

function AfterTeleport()
	player.playerHitEffect.FadeScreen(false)
	game.playerController.useGravity = true
end