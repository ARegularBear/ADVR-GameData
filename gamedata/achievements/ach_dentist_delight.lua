function ADVR.onLoad()
    achievement.name = "Dentist's Delight"
    achievement.desc = "Consume a food item made of gold."
	achievement.hideDescription = false
    achievement.unlocksItem = relics.ERTHU_CHRWA_EXOTIC_SPICE
    achievement.insightReward = 5
end

function ADVR.onFoodEaten(foodInstance)
    if helperMethods.GetCustomData(foodInstance.gameObject, "is_golden") == true then
        achievement.Unlock()
    end
end
