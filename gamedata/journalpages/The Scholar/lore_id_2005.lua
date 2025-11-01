function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Day the Thirty-First of the First Season, Year 1266

A breakthrough! Today, after emerging from the larder, a kitchen servant asked, “You lookin’ for the ghost?”

It seems the servants have long regarded a section of the basement--directly below the larder--to be haunted. Upon investigating the previously unknown location, I found my power accentuated further.

I am relocating my studies to this area. Greatness awaits.]]

    journal.journalId = 2005 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 5"
end

function ADVR.JournalEvents.onPageCollected()
end