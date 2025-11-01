function ADVR.onLoad()
	pickup.name = "Miasmic Toadskin"
	pickup.desc = "Poison a random enemy when entering a room for the first time"
	pickup.weight = 100
	pickup.maxAmount = 3
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.PODEST, relicPool.SHOP, relicPool.GOLDEN_CHEST}
	pickup.supportedInMultiplayer = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onRoomEntered(room)
	if (room.type == roomTypes.ENEMY or room.type == roomTypes.CORRIDOR or room.type == roomTypes.SECRET or room.type == roomTypes.ITEM) then
		-- Wait for enemies to spawn
		pickup.CallFunctionIn("PoisonRandomEnemyInRoom", 1.0, room)
	end
end


function PoisonRandomEnemyInRoom(room)
	local counterPoisendEnemies = 0
	local enemies = game.GetEnemiesInRadius(32, game.playerHeadset.position, true, true)
	if #enemies > 0 then
		for enemy in enemies do
			local roomOfEnemy = game.currentWorldGenerator.GetRoomAtRealPos(enemy.transform.position)
			if room == roomOfEnemy then
				enemy.applyEffect(damageType.POISON, player.PrimaryDamage.GetValueFloat() * 5)
				audio.PlaySoundLocal(sounds.SFX_MIASMIC_TOADSKIN, enemy.transform.position)
				counterPoisendEnemies = counterPoisendEnemies + 1
				if counterPoisendEnemies >= pickup.AmountActiveLocal() then
					return
				end
			end
		end
	end
end

