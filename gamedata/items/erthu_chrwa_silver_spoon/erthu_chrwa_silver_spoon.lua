function ADVR.onLoad()
	pickup.name = "Silver Spoon"
	pickup.desc = "Marks have a chance to charge when coins are collected"
	pickup.weight = 100
	pickup.maxAmount = 1
	pickup.amountUses = -1
	pickup.price = 15
	pickup.tier = 1
	pickup.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	pickup.supportedInMultiplayer = true
	pickup.isSharedItem = true
end

function ADVR.onPickup()
	pickup.RegisterItem()
end

function ADVR.onPickupProxies(originalPlayerRef)
	pickup.RegisterItemNoSync()
end

function ADVR.onObjectCollect(obj)
	if obj == "coin" then
        if helperMethods.IsValidWithLuck(0, 0.25, 0.15) and game.itemInterpreter.currentUsable ~= nil then
			game.itemInterpreter.currentUsable.currentCharge = game.itemInterpreter.currentUsable.currentCharge + 1
			game.activePickupSlot.UpdateChargeDisplay()
			audio.PlaySoundLocal(sounds.SFX_SILVER_SPOON,  game.playerController.rightHand.transform.position) 
		end
    end
end