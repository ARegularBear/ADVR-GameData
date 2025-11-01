-- gets run when the game loads for setup
function ADVR.onLoad()
	progress.name = "Relic Hunter"
	progress.desc = "<i>Undiscovered relics have a greater chance of appearing</i>"
	progress.price = 50
	progress.predecessor = "progress_i_have_a_system"
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onPreDungeonGenerated(worldGenerator)
	-- increase probability of a few never found relics
	local amountRelicsToIncreaseProbability = 3
	local amountRelicsToIncreaseSpawnPool = 1
	for pick in game.itemInterpreter.pickupsOnDisk do
		if not pick.HasUnlockedItem() and not pick.HasFoundItem()  then
			if amountRelicsToIncreaseProbability > 0 then
				pick.weight = pick.weight * 3
				amountRelicsToIncreaseProbability = amountRelicsToIncreaseProbability - 1

				-- increase spawn pool for some of them
				if amountRelicsToIncreaseSpawnPool > 0 then
					pick.spawnsIn = {relicPool.SHOP, relicPool.SPECIAL, relicPool.BOSS, relicPool.PODEST, relicPool.SECRET}
					amountRelicsToIncreaseSpawnPool = amountRelicsToIncreaseSpawnPool - 1
				end
			end
		end
	end
end