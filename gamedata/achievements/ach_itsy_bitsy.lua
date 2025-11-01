function ADVR.onLoad()
    achievement.name = "Itsy Bitsy"
	achievement.desc = "Use a Contracting Orb to shrink yourself."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_BEE_STINGER
	achievement.insightReward = 3
end

function ADVR.onPlayerValueChanged(valueId)
	if valueId == playerValues.PLAYER_SCALE then
		if player.GetPlayerScale() < 0.75 then
			achievement.Unlock()
		end
	end
end