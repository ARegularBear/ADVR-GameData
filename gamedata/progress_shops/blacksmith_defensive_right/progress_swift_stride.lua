function ADVR.onLoad()
	progress.name = "Swift Stride"
	progress.desc = "Start with 10% increased movement speed."
	progress.price = 1
	progress.predecessor = nil
end

function ADVR.ProgressEvents.onBuy()
end

function ADVR.onDungeonGenerated()
    if helperMethods.IsInFirstDungeon() then
		player.MoveSpeed.RegisterAddend(progress.id, 0.1)
    end
end