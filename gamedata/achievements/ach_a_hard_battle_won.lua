function ADVR.onLoad()
    achievement.name = "A Hard Battle Won"
	achievement.desc = "Damage The Beast with the Mercenary's Armament in hard mode (1.75x)."
	achievement.hideDescription = true
	achievement.insightReward = 10
end

function ADVR.onRunComplete()
	if game.GetPlayerWeaponCombo().id == "swordknife" and player.inHardMode == true and player.GetDifficultyMultiplier() >= 1.75 then
		achievement.Unlock()
	end
end