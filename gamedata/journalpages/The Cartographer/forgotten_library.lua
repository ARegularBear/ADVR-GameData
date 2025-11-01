function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I write these words surrounded by lost knowledge, endless books on endless shelves. For the first time, I wonder if mankind has forgotten more than we have retained.

I cannot carry more than one or two books with me. Hopefully, my map will lead a greater contingent here in the future.

Concerning the map...it has grown complex, and...contradictory? It is impossible, but it seems this place is moving.

]]

    journal.journalId = 3002
    journal.journalTitle = "Forgotten Library"
end

function ADVR.JournalEvents.onPageCollected()
    game.specialEventsGraph.SetEventFound(journal.journalId)
end