function ADVR.onLoad()
	pickup.name = "Pristine Fletching"
	pickup.desc = "Your orbs speed is massively increased and critical chance is slightly increased."
end

function ADVR.onPickup()
	pickup.RegisterItem()
    
    player.PrimaryCritChance.RegisterAddend(pickup.id, 0.05)
    
    local shootSpeedMultiplier = 2.5
    game.inventory.currentPrimaryWeapon.AsMagicOrbBase().maxOrbTravelSpeed = game.inventory.currentPrimaryWeapon.AsMagicOrbBase().maxOrbTravelSpeed * shootSpeedMultiplier
    game.inventory.currentPrimaryWeapon.AsMagicOrbBase().throwMultiplier = shootSpeedMultiplier
    game.inventory.currentPrimaryWeapon.AsMagicOrbBase().maxOrbTravelSpeed = game.inventory.currentPrimaryWeapon.AsMagicOrbBase().maxOrbTravelSpeed * shootSpeedMultiplier
end
