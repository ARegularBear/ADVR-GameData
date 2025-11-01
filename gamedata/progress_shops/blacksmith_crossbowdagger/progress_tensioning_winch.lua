function ADVR.onLoad()
	progress.name = "Tensioning Winch"
	progress.desc = "The longer the crossbow is loaded, the more damage it will do (up to 30% more damage after 12 seconds)"
	progress.price = 3
	progress.predecessor = progresses.PROGRESS_TETHERED_BOLT
	LastTimeLoaded = 0
	TensionValue = 0
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onRangedHitEntity(infos)
	if infos.entity == nil then
		return infos.damage
	end

	return infos.damage * (1 + TensionValue * 0.25)
end

function ADVR.onKnifeThrow()
	-- tension value goes from 0 to 1 over 10 seconds loading time
	TensionValue = math.min(time.time - LastTimeLoaded, 12) * 0.08333
end

function ADVR.onKnifeInHand()
	LastTimeLoaded = time.time
end