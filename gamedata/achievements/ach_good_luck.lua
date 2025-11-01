function ADVR.onLoad()
    achievement.name = "Good Luck!"
    achievement.desc = "Enter the Ancient Dungeon for the first time"
    achievement.unlocksItem = relics.ERTHU_CHRWA_JADE_TURTLESHELL
    achievement.insightReward = 1
end

function ADVR.onDungeonGenerated(worldGenerator)
    achievement.Unlock()
end