function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[To state the obvious: this place stinks.

I admit, I gave no thought to the more…mechanical needs of the dungeon’s inhabitants, past or present. Whatever force incepted this place, we need not wonder about its pragmatism.

I believe I have made some peace with the likelihood that I will die here; the bare, base nature of my current surroundings demands humility. I will continue my work, as best I can, and be satisfied.

(I do hope to find another region of the dungeon soon, however, the smell really is awful.)

]]

    journal.journalId = 3005
    journal.journalTitle = "Noxious Sewers"
end

function ADVR.JournalEvents.onPageCollected()
    game.specialEventsGraph.SetEventFound(journal.journalId)
end