function ADVR.onLoad()
    achievement.name = "Quick Like A Bunny"
	achievement.desc = "Escape the Ancient Dungeon in under twenty minutes."
	achievement.hideDescription = false
    achievement.worksOnLoadedRun = false
    achievement.unlocksItem = relics.ERTHU_CHRWA_CAGED_MATCH
    achievement.insightReward = 5
end

function ADVR.onRunComplete()
    if time.time - player.timeOfRunStart <= 60 * 20 then
        achievement.Unlock()
    end
end
