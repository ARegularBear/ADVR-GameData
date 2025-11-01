function ADVR.onLoad()
    achievement.name = "You Break It, You Buy It"
	achievement.desc = "Lower your merchant discount to -100%."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_SILVER_CHIME
	achievement.insightReward = 5
	game.RegisterForRPCEvents(achievement)
end


function ADVR.onPlayerValueChanged(valueId)
	if valueId == playerValues.DISCOUNT then
		base.CallFunctionIn("Check", 1.0) -- bit of delay because of network variable sync
	end
end

function Check()
	if player.ShopDiscount.GetGroupValueFloat() <= -1 then
		achievement.SendRPCEvent(rpcType.TO_ALL)
	end
end

function ADVR.onRPCReceived()
	achievement.Unlock()
end