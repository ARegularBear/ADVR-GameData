function ADVR.onLoad()
	modifier.name = "Clumsy"
	modifier.desc = "Bosses are more difficult to destroy and deal double damage"
    modifier.modifierHint = "#"
    modifier.maxLevel = 1
    modifier.difficultyPerLevel = 0.25
end

function ADVR.ModifierEvents.getFinalValue()
    if modifier.CurrentLevel == 1 then
        return "On"
    else
        return "Off"
    end
end

function ADVR.onPlayerHit(damage)
	local room = game.currentWorldGenerator.GetRoomAtRealPos(player.transform.position, true)
	if room ~= nil and modifier.CurrentLevel == 1 then
		if room.type == roomTypes.BOSS then
			return damage + 1
		end
	end

	return damage
end