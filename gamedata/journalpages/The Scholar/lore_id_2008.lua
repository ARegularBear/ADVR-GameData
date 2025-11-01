function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Day the Fifteenth of the First Season, Year 1267

Nearly two seasons since my last entry, but it seems like a lifetime.

My mind has been set afire by all that I’ve learned. Where once I mimicked the activity of greater men, I now stand among them, able to create entirely new magics.

Sadly, I believe I have reached the limits of this particular locus. As such, I am preparing for travel. If “unnatural” phenomena are an earmark of such loci, there are many places to explore.]]

    journal.journalId = 2008 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 8"
end

function ADVR.JournalEvents.onPageCollected()
end