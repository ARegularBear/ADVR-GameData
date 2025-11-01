function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[So, as you might imagine, when I heard about all the amazing beasties in the Ancient Dungeon…well, I couldn't resist. I made my way there with every instrument and tool I could handle. I planned to study each and every one of them and, if any were nice and soft and non-violent, hug the absolute bejeezus out of it!  The young blacksmith outside the dungeon said my plan was suicide, but that's “people” for you, always trying to put each other down.]]

    journal.journalId = 22 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 2"
end

function ADVR.JournalEvents.onPageCollected()
    
end