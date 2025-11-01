
function ADVR.onLoad()
	pickup.name = "Slobbering Totem"
	pickup.desc = "Consumes all of your keys and coins, but increases weapon damage accordingly"
	pickup.weight = 20
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 2
	pickup.spawnsIn = {relicPool.SPECIAL, relicPool.PODEST}
	pickup.isSharedItem = true
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	if game.runSaveManager.isInLoadRoutine == false then
		CalculateValue()
		pickup.CallFunctionIn("SetToZero", 2.0)
	end
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	if game.runSaveManager.isInLoadRoutine == false then
		CalculateValue()
		pickup.CallFunctionIn("SetToZero", 2.0)
	end
end

function CalculateValue()
	local potentialValue = (player.SharedCashPool + player.SharedKeyPool * 6) / 18 + 4
	player.PrimaryDamage.RegisterAddend(pickup.id, potentialValue / 2)
	player.SecondaryDamage.RegisterAddend(pickup.id, potentialValue / 2)
end

function SetToZero()
	player.currentCash = 0
	player.currentKeys = 0
end