function ADVR.onLoad()
	pickup.name = "Pristine Fletching"
	pickup.desc = "Your knife speed is massively increased and critical chance is slightly increased."

    -- Variables
end

function ADVR.onPickup()
	pickup.RegisterItem()
    
    player.SecondaryCritChance.RegisterAddend(pickup.id, 0.05)
    local shootSpeedMultiplier = 4
    local knifeRef = game.inventory.currentSecondaryWeapon.AsThrowingKnifeBase()
    knifeRef.throwStrength = knifeRef.throwStrength * shootSpeedMultiplier 
end
