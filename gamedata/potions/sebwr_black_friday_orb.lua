function ADVR.onLoad()
	potion.name = "Black Friday Orb"
	potion.desc = "Throw to teleport back to the area merchant (disappears when entering boss rooms)"
	potion.weight = 0
	potion.effectTime = 0
	potion.price = 25
	potion.spawnsIn = {relicPool.SHOP}
	potion.color = colors.Create(1.0, 0.843, 0.0, 1.0)
	potion.contactDamage = false
	potion.createEffectInstance = false
	potion.supportedInMultiplayer = true
end

function ADVR.PotionEvents.onPotionRunOut(effectInstance)
end

function ADVR.PotionEvents.onPotionBreak(potionObject, effectInstance, stateAuthority)
	logging.Log(vector3.Distance(potionObject.transform.position, player.transform.position))
	if vector3.Distance(potionObject.transform.position, player.transform.position) > 2.0 then
		return
	end

	local allRooms = game.currentWorldGenerator.GetAllRoomsInWorldAsList()

	local room = game.currentWorldGenerator.GetRoomAtRealPos(player.transform.position)
	if room == nil then
		return
	end

	if room.type == roomTypes.BOSS or room.type == roomTypes.AFTERBOSS_START or room.type == roomTypes.CHALLENGE then
		audio.PlaySoundLocal(sounds.ERROR, player.transform.position)
		return
	end

	for room in allRooms do
		if room.type == roomTypes.SHOP and room.visited then
			local tilesOfShop = room.baseTiles
			for _, tile in ipairs(tilesOfShop) do
				if tile.isDoor then
					local doorPos = tile.pos
					game.playerController.useGravity = false
					player.playerHitEffect.FadeScreen(true, 2.0)
					local teleportTargetPos = room.GetWorldPosBase() + vector3.__new(0,1,0) + vector3.__new(doorPos.x * 4, 0, doorPos.y * 4)
					potion.CallFunctionIn("TeleportPlayer", 0.5, teleportTargetPos, room.rotation)
				end
			end
			return
		end
	end
end

function TeleportPlayer(pos, rot)
	game.TeleportTo(pos, true)
	game.FaceInDir(360 - rot)
	potion.CallFunctionIn("AfterTeleport", 2.0)
end

function AfterTeleport()
	player.playerHitEffect.FadeScreen(false)
	game.playerController.useGravity = true
end

