function ADVR.onLoad()
	pickup.name = "Door Chime"
	pickup.desc = "Summon a wisp when entering a room for the first time"
	pickup.weight = 40
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onRoomEntered(room)
    for i=1,pickup.AmountActiveLocal() do
        game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
	end
    audio.PlaySoundNetwork(sounds.SFX_DOOR_CHIME, player.transform.position)
end