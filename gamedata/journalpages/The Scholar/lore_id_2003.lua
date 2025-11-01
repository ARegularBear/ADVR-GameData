function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Day the Seventy-Second of the Third Season, Year 1265

I have done it. I have worked magic.

A small thing, perhaps: A single tongue of flame, perched on the end of my fingertip, seemingly “summoned” from nothing.

I spoke no arcane words, nor drew complex symbols. Simply a singular will, a belief that it could happen...and suddenly it did.]]

    journal.journalId = 2003 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 3"
end

function ADVR.JournalEvents.onPageCollected()
end