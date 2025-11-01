function ADVR.onLoad()
	modifier.name = "Feeble"
	modifier.desc = "Enemies are more difficult to destroy"
    modifier.modifierHint = "+# HP"
    modifier.maxLevel = 5
    modifier.difficultyPerLevel = 0.05

end

function ADVR.onDungeonGenerated(worldGenerator)
    if helperMethods.IsInFirstDungeon(worldGenerator) or game.runSaveManager.isInLoadRoutine then
        local enemies = {}

        for i = 0, #game.enemyRegistry.enemyRegistryEntries - 1 do
            local registry = game.enemyRegistry.enemyRegistryEntries[i]

            for j = 0, #registry.possibilities - 1 do
                table.insert(enemies, registry.possibilities[j].objToSpawn)
            end
        end

        base.AddPostObjectSpawnListenersRuntimeByObjects(enemies)
    end
end

function ADVR.onPostObjectSpawn(prefab, gameObject)
    modifier.CallFunctionIn("GiveHealth", 1, gameObject)
end

function GiveHealth(gameObject)
    if gameObject ~= nil then
        local enemyBase = gameObject.GetComponent_EnemyBase_()
        if enemyBase ~= nil then
            enemyBase.MaxHealth = enemyBase.MaxHealth + modifier.CurrentLevel
            enemyBase.Health = enemyBase.MaxHealth
        end
    end
end

function ADVR.ModifierEvents.getFinalValue()
	return modifier.CurrentLevel
end