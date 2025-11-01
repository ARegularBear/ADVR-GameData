function ADVR.onLoad()
	pickup.name = "Knight's Mark"
	pickup.desc = "Once charged, use to gain a period of invulnerability"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = 24
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP}
	pickup.isActivateItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterUsable()
end

function ADVR.onPickupActivate()
	player.SetInvincible(true)
	pickup.CallFunctionIn("RemoveInvincibility", 6)
	player.playerHitEffect.EnableActiveEffect(colors.Create(0.888,0.888,0.999,1))
end

function RemoveInvincibility()
	player.SetInvincible(false)
	player.playerHitEffect.DisableActiveEffect()
end