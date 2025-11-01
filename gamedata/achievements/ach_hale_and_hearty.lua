function ADVR.onLoad()
    achievement.name = "Hale And Hearty"
	achievement.desc = "Acquire more than five full hearts of health."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_HEAVY_YOKE
	achievement.insightReward = 4
end

function ADVR.onPlayerValueChanged(val)
   	if val == playerValues.HEALTH then
		if player.networkObject.IsValid and player.MaxHealth >= 10 then
			achievement.Unlock()
		end
	end
end