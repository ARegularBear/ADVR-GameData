function ADVR.onLoad()
	pickup.name = "Curse of the Horde"
	pickup.desc = "More enemies will appear at the same time"
	pickup.weight = 0
	pickup.maxAmount = 15
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
	AddEnemy()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	AddEnemy()
end

function AddEnemy()
	local arena = game.FindObjectByType(game.GetType("ArenaManager")) ---@type ArenaManager
	if arena ~= nil then
		arena.runtimeValues.maxConcurrentEnemies = arena.runtimeValues.maxConcurrentEnemies + 1
	end
end

function IsAllowedToSpawn()
	return true
end