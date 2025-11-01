function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I fear I am at my end.

For all my desperate wandering, I believe I have only ventured deeper into this labyrinth, possibly to its very heart. I can feel a terrible presence here, pressing at the back of my mind, pressing me towards it.

I have resisted, but now the promise of rest seems a greater gift than life itself. The Child hungers, and must be fed.

To any who find these writings, I wish you a better fate than my own.]]

    journal.journalId = 3004
    journal.journalTitle = "Beast's Cradle"
end

function ADVR.JournalEvents.onPageCollected()
    game.specialEventsGraph.SetEventFound(journal.journalId)
end