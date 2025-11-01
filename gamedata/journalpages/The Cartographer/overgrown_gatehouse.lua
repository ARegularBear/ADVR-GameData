function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[It is the end of my first day within the Ancient Dungeon, and I am wildly optimistic.

Despite my surroundings being a bit less than “dungeon-like”, they are untouched. In a world less and less unknown to mankind, it is truly thrilling to be within such a mystery.

I have begun my map. With perseverance, it is sure to be the greatest achievement of my life.

]]

    journal.journalId = 3000
    journal.journalTitle = "Overgrown Gatehouse"
end

function ADVR.JournalEvents.onPageCollected()
    game.specialEventsGraph.SetEventFound(journal.journalId)
end