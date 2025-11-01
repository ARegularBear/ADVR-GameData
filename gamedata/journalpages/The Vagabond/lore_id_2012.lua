function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Just stares and scribbles, all day, for weeks now.

At nothing! Stares at nothing! Maybe the rich man is a crazy man…or maybe he sees something I don’t.

I want that book he scribbles in, all full and bursting with magics, I bet. But he keeps it close, sleeps with it under all his silks and velvets.

Need him to trust me, and know just the way. Play a fool, play a dolt, ‘til he thinks I’m simple as a babe, not like to understand a thing.]]

    journal.journalId = 2012 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 2"
end

function ADVR.JournalEvents.onPageCollected()
end