function ADVR.onLoad()
    achievement.name = "Have A Nice Trip, See You Next Fall"
	achievement.desc = "Fall into a pit in each floor and win the run."
	achievement.insightReward = 5
	achievement.unlocksItem = "cosmetic:16" -- Propeller Hat
	DidVisitPitOnCurrentFloor = false
	DidVisitPitOnEveryFloor = true
end

function ADVR.onRunComplete()
	if DidVisitPitOnEveryFloor then
		achievement.Unlock()
	end
end

function ADVR.onAfterBossAreaGenerated(worldGenerator)
	if not DidVisitPitOnCurrentFloor then
		DidVisitPitOnEveryFloor = false
	end
end

function ADVR.onPlayerHit(damage, source, lastDamageType)
	if lastDamageType == damageType.PIT then
		DidVisitPitOnCurrentFloor = true
	end
	return damage
end