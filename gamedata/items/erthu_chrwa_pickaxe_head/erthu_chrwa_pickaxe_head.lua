
function ADVR.onLoad()
	pickup.name = "Pickaxe Head"
	pickup.desc = "Striking the ground with your melee weapon produces a line of damaging spikes"
	pickup.weight = 50
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 50
	pickup.tier = 3
	pickup.supportedInMultiplayer = true
	pickup.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL}
end
