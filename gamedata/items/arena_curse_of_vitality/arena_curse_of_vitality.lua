function ADVR.onLoad()
	pickup.name = "Curse of Vitality"
	pickup.desc = "Enemies have 20% more health"
	pickup.weight = 0
	pickup.maxAmount = 50
	pickup.amountUses = -1
	pickup.price = 30
	pickup.tier = 1
	pickup.isCurse = true
	pickup.spawnsIn = {}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
	AddHealth()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	AddHealth()
end

function AddHealth()
	local arena = game.FindObjectByType(game.GetType("ArenaManager")) ---@type ArenaManager
	if arena ~= nil then
		arena.runtimeValues.enemyHealthMultiplier = arena.runtimeValues.enemyHealthMultiplier + 0.2 * pickup.AmountActiveLocal()
	end
end

function IsAllowedToSpawn()
	return true
end