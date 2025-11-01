function ADVR.onLoad()
	pickup.name = "Curse of Haste"
	pickup.desc = "Time between enemy spawns is reduced by 15%"
	pickup.weight = 0
	pickup.maxAmount = 10
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
	ReduceTimeBetweenSpawns()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
	ReduceTimeBetweenSpawns()
end

function ReduceTimeBetweenSpawns()
	local arena = game.FindObjectByType(game.GetType("ArenaManager")) ---@type ArenaManager
	if arena ~= nil then
		arena.runtimeValues.timeBetweenEnemySpawns = arena.runtimeValues.timeBetweenEnemySpawns * 0.85
	end
end

function IsAllowedToSpawn()
	return true
end