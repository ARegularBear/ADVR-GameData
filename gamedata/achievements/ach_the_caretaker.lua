function ADVR.onLoad()
    achievement.name = "The Caretaker"
	achievement.desc = "Traverse The Beast's Cradle without taking any damage."
	achievement.hideDescription = false
	achievement.priority = -10000
    achievement.unlocksItem = relics.ERTHU_CHRWA_FOUR_LEAF_CLOVER_NEW

    HasPlayerBeenDamaged = false
    achievement.insightReward = 7
end

function ADVR.onRunComplete()
    if HasPlayerBeenDamaged == false then
        achievement.Unlock()
    end
end

function ADVR.onEnteredNGPlus()
    HasPlayerBeenDamaged = false
end

function ADVR.onPlayerHit(damage)
    if game.currentFloor ~= dungeonFloor.THE_CRADLE then
        return damage
    end

	if damage > 0 then
		HasPlayerBeenDamaged = true
	end
	return damage
end
