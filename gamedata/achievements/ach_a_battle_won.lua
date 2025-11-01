function ADVR.onLoad()
    achievement.name = "A Battle Won"
	achievement.desc = "Damage The Beast with the Mercenary's Armament."
	achievement.unlocksItem = "cosmetic:19" -- Beast Mask
	achievement.hideDescription = true
	achievement.insightReward = 5
end

function ADVR.onRunComplete()
	if game.GetPlayerWeaponCombo().id == "swordknife" then
		achievement.Unlock()
	end
end