function ADVR.onLoad()
    achievement.name = "Feed The Friend"
    achievement.desc = "Throw a dragonfruit into a pit."
    achievement.entityDeathListeners = {"item_food_dragonfruit"}
	achievement.hideDescription = false
    achievement.unlocksItem = relics.ERTHU_CHRWA_PIT_FRIEND
    achievement.insightReward = 4
end

function ADVR.onEntityDeath(livingBaseReference, sourceReference, lastDamageType)
    if lastDamageType ~= damageType.PIT then
        return
    end

    achievement.Unlock()
end
