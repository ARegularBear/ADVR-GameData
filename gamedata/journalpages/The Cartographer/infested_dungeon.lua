function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I believe my current location was an actual dungeon at some point. Iron-barred cells are common, and I have crushed a good number of bones under my clumsy feet.

Uncommon, however, is the red fungus that grows here. I have collected a sample to study, which, perhaps fortunately, has caused a cinnamon smell to pervade my pack.

The map is progressing, as best it can. This place resembles nothing so much as a mass of knotted rope.

]]

    journal.journalId = 3001
    journal.journalTitle = "Infested Dungeon"
end

function ADVR.JournalEvents.onPageCollected()
    game.specialEventsGraph.SetEventFound(journal.journalId)
end