function ADVR.onLoad()
	progress.name = "Lethal Precision"
	progress.desc = "Start with 5% increased crit chance on all weapons"
	progress.price = 1
	progress.predecessor = nil
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onDungeonGenerated()
    if helperMethods.IsInFirstDungeon() then
		player.PrimaryCritChance.RegisterAddend(progress.id, 0.05)
		player.SecondaryCritChance.RegisterAddend(progress.id, 0.05)
    end
end