function ADVR.onLoad()
	pickup.name = "Rabid Bearskin"
	pickup.desc = "Gain a brief period of invulnerability after destroying an enemy"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.supportedInMultiplayer = true
	pickup.isVanishItem = true
end

function ADVR.onPlayerDeath(playerLiving)
	pickup.UnregisterItem()
end

function ADVR.onPickup()
	pickup.RegisterItem()
	InvincibilityQueue = 0
end

function ADVR.onEntityDeath(living, source)
	if living.IsEnemy() and source == player.LocalPlayerRef then
		InvincibilityQueue = InvincibilityQueue + 1
		player.networkedInvincible = base.ToNetworkBool(true)
		pickup.CallFunctionIn("RemoveInvincibility", 2)
	end
end

function RemoveInvincibility()
	InvincibilityQueue = InvincibilityQueue - 1

	if InvincibilityQueue == 0 then
		player.networkedInvincible = base.ToNetworkBool(false)
	end
end