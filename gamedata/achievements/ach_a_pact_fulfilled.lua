function ADVR.onLoad()
    achievement.name = "A Pact Fulfilled"
	achievement.desc = "Damage The Beast with the Magicians's Armament."
	achievement.hideDescription = true
	achievement.insightReward = 5
end

function ADVR.onRunComplete()
	if game.GetPlayerWeaponCombo().id == "magicwand" then
		achievement.Unlock()
	end
end