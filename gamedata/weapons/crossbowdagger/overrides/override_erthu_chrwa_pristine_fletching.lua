function ADVR.onLoad()
	pickup.name = "Pristine Fletching"
	pickup.desc = "Your crossbow bolt speed is massively increased and critical chance is slightly increased."
	
    -- Variables
end

function ADVR.onPickup()
	pickup.RegisterItem()
    
    player.PrimaryCritChance.RegisterAddend(pickup.id, 0.05)
    
    local shootSpeedMultiplier = 3
    game.inventory.currentPrimaryWeapon.AsCrossbowBase().shootSpeed = game.inventory.currentPrimaryWeapon.AsCrossbowBase().shootSpeed * shootSpeedMultiplier 
end
