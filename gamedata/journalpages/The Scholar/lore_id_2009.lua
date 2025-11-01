function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Day the Fifth of the Third Season, Year 1268

Finally! Months of grueling travel with naught to show for it save blisters, but finally success!

We have not yet arrived at the locus, but I can feel it, like a dry sponge in a sudden rain. I am aglow with the power of this place!

This evening, once my retinue is asleep, I will conjure a flame to confirm my feelings. This part of the world is rather simple, the locals’ reaction to my abilities could be…unpleasant. ]]

    journal.journalId = 2009 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 9"
end

function ADVR.JournalEvents.onPageCollected()
end