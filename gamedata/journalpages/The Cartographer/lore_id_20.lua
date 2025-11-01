function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I entered the Ancient Dungeon with great optimism and sense of purpose. I had worked hard among my peers, but had never found a chance by which to truly distinguish myself. Then it came: by great luck, another entrance into the Ancient Dungeon had been found within my lifetime. Immediately, I resolved to enter, and, for the first time in human history, map its interior. My life seemed a small thing to risk when weighed against such a tremendous endeavor.]]

journal.journalId = 20 -- order corresponds to id in lore pages
journal.journalTitle = "Page 1"
end

function ADVR.JournalEvents.onPageCollected()
end