-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Weighted Pommel"
	progress.desc = "Your sword strikes deal a small amount of damage to all nearby enemies."
	progress.price = 3
	progress.predecessor = progresses.PROGRESS_FOLD_OF_ABBERATION
end

-- gets called when the player buys this item
function ADVR.ProgressEvents.onBuy()
end

function ADVR.onPrimaryHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	if infos.entity.IsEnemy() then
		local enemies = game.GetEnemiesInRadius(4, player.transform.position, true)
		for livingBase in enemies do
			if livingBase ~= nil and livingBase.gameObject ~= infos.entity.gameObject and livingBase.isDead == false and livingBase.networkObject ~= nil and livingBase.networkObject.isValid then
				livingBase.DoEffectHit(1, damageType.BASE_DEFAULT)
			end
		end
	end

	return infos.damage
end