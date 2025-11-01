function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[This place does move. My map is a tangle and I am lost. I continue...forward? Backward? In any case, I have kept moving. I have abandoned all my aspirations now and only hope to survive.

Currently, I seem to be in a long-abandoned mine. Mine carts nearly crumbled to splinters and tracks half-uprooted by who-knows-what...hopefully a sturdy walking stick and some stern words are enough to fend them off!
]]

    journal.journalId = 3003
    journal.journalTitle = "Gloaming Mines"
end

function ADVR.JournalEvents.onPageCollected()
    game.specialEventsGraph.SetEventFound(journal.journalId)
end