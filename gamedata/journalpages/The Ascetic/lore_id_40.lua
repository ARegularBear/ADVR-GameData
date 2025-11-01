function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[True, my appearance is meager, but the peace within me is grand. I could not convince others of the power of my way with mere words, so I sought to put it on display. One day I announced to all that I would venture into the Ancient Dungeon and emerge alive from it. The simple folk there laughed at me and mocked the frailty of my body, certain that I would be slaughtered. I bid them follow me, witness my entrance and, subsequently, my exit. Few followed, but it would have been enough.]]

    journal.journalId = 40 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 2"
end

function ADVR.JournalEvents.onPageCollected()
end