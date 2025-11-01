function ADVR.onLoad()
    achievement.name = "Big Spender"
	achievement.desc = "Acquire four items from shops during a single delve."
	achievement.hideDescription = false
	ItemsBoughtInRoom = 0
	achievement.unlocksItem = relics.ERTHU_CHRWA_INCENTIVES_FLYER
	achievement.insightReward = 2
end

function ADVR.onItemBought(item,pos)
	ItemsBoughtInRoom = ItemsBoughtInRoom + 1
	if ItemsBoughtInRoom == 4 then
		achievement.Unlock()
	end
end