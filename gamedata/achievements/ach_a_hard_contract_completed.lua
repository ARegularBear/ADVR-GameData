function ADVR.onLoad()
    achievement.name = "A Hard Contract Completed"
	achievement.desc = "Damage The Beast with the Assassin's Armament in Hard Mode (1.75x)"
	achievement.hideDescription = true
	achievement.insightReward = 10
end

function ADVR.onRunComplete()
	if game.GetPlayerWeaponCombo().id == "crossbowdagger" and player.inHardMode == true and player.GetDifficultyMultiplier() >= 1.75 then
		achievement.Unlock()
	end
end