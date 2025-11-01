function ADVR.onLoad()
    achievement.name = "Black Friday"
	achievement.desc = "Raise your merchant discount to 60%."
	achievement.hideDescription = false
	achievement.unlocksItem = relics.ERTHU_CHRWA_GAPING_TOTEM
	achievement.insightReward = 4
	game.RegisterForRPCEvents(achievement)
end

function ADVR.onPlayerValueChanged(valueId)
	if valueId == playerValues.DISCOUNT then
		base.CallFunctionIn("Check", 1.0) -- bit of delay because of network variable sync
	end
end

function Check()
	if player.ShopDiscount.GetGroupValueFloat() >= 0.6 then
		achievement.SendRPCEvent(rpcType.TO_ALL)
	end
end

function ADVR.onRPCReceived()
	achievement.Unlock()
end