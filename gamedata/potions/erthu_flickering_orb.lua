function ADVR.onLoad()
	potion.name = "Flickering Orb"
	potion.desc = "Throw at your feet to temporarily increase your movement speed."
	potion.weight = 100
	potion.effectTime = 20
	potion.price = 15
	potion.spawnsIn = {relicPool.GOLDEN_CHEST, relicPool.SHOP}
	potion.color = colors.Create(3.0/255.0, 227.0/255.0, 252.0/255.0, 1.0)

    potion.affectsPlayer = true
	potion.affectsEnemies = false
	potion.affectsLiving = false
	potion.breakEffectDistance = 2
	potion.showActiveVignette = true
	potion.createEffectInstance = true
	potion.supportedInMultiplayer = true
end

function ADVR.PotionEvents.onPotionBreak(tmpPotion, effectInstance)
    if effectInstance.affectedPlayer ~= nil then
        player.MoveSpeed.RegisterAddend("erthu_flickering_orb", 0.8)
    end
end

function ADVR.PotionEvents.onPotionRunOut(effectInstance)
    if effectInstance.affectedPlayer ~= nil then
        player.MoveSpeed.RemoveAddendAt("erthu_flickering_orb", 0)
    end
end