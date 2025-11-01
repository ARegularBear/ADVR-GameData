function ADVR.onLoad()
	pickup.name = "Cursed Knife"
	pickup.desc = "All future instances of the next enemy destroyed will be much weaker. This effect resets per floor."
	pickup.maxAmount = 1
	pickup.price = 60
	pickup.tier = 3
    pickup.weight = 70
	pickup.spawnsIn = {relicPool.SPECIAL}
	pickup.supportedInMultiplayer = false
	pickup.isSharedItem = false
    Already_deleted_enemy = false
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	Already_deleted_enemy = false
    base.ClearPostObjectSpawnListenersRuntime()
end

function ADVR.onEntityDeath(living, source)

    if Already_deleted_enemy then
        return
    end

	if living.IsEnemy() == false or living.IsBoss() or source ~= player.LocalPlayerRef then
		return
	end

    base.AddPostObjectSpawnListenersRuntimeByObjects({game.stringToObjectMapper.GetObject(living.livingId)})

    local enemies = game.GetEnemiesInRadius(100, game.playerHeadset.position)
    for i = 0, #enemies - 1 do
        local enemy = enemies[i]
        if enemy.livingId == living.livingId then
            ReduceHealth(enemy.gameObject)
            break
        end
    end

    Already_deleted_enemy = true

end

function ADVR.onPostObjectSpawn(prefab, gameObject)
	pickup.CallFunctionIn("ReduceHealth", 1, gameObject)
end


function ReduceHealth(gameObject)
    if gameObject ~= nil then
        local enemyBase = gameObject.GetComponent_EnemyBase_()
        if enemyBase ~= nil then
            enemyBase.MaxHealth = 1
            enemyBase.Health = 1
            enemyBase.hitFlashType = hitFlashType.NONE
        end

        local renderers = gameObject.GetComponentsInChildren(game.GetType("MeshRenderer"))
        for i = 0, renderers.Length - 1 do
            renderers[i].material.EnableKeyword("_EMISSION")
            renderers[i].material.SetColor("_EmissionColor", colors.Create(0.11, 0, 0, 1))
        end
    end
end