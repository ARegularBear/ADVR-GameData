function ADVR.onLoad()
	pickup.name = "Tress of Silken Hair"
	pickup.desc = "You have a chance to gain some protection after destroying an enemy"
	pickup.weight = 50
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 50
	pickup.tier = 3
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onEntityDeath(living, source)
	if living.IsEnemy() and player.etherealHealth < 2 and source == player.LocalPlayerRef then
		if helperMethods.IsValidWithLuck(0, 0.033 * pickup.AmountActiveLocal(), 0.025 * pickup.AmountActiveLocal()) then
			player.Heal(1, player.GetBaseEtherealHeartType())
			audio.PlaySoundLocal("sfx_silken_tress", player.transform.position)
		end
	end
end