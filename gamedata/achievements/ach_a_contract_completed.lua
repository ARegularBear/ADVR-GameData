function ADVR.onLoad()
    achievement.name = "A Contract Completed"
	achievement.desc = "Damage The Beast with the Assassin's Armament."
	achievement.hideDescription = true
	achievement.unlocksItem = relics.ERTHU_CHRWA_TIGHT_BREECHES
	achievement.insightReward = 5
end

function ADVR.onRunComplete()
	if game.GetPlayerWeaponCombo().id == "crossbowdagger" then
		achievement.Unlock()
	end
end