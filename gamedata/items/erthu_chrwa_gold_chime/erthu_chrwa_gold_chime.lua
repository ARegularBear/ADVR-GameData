function ADVR.onLoad()
	pickup.name = "Gold Chime"
	pickup.desc = "When hit, summon a wisp"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.priority = -501
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.BOSS}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPlayerHit(damage, source, dmgType, hitPosition)
	if damage >= 1 then
		game.SpawnCompanionWisp(game.playerController.rightHand.transform.position)
		audio.PlaySoundNetwork(sounds.SFX_GOLD_CHIME, hitPosition)
	end
	return damage
end