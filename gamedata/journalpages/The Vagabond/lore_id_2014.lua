function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Dead of night, rich man’s fast asleep, I probably shouldn’t write nothin’ (dumb folks can’t write), but I gotta gloat to somebody, even just myself.

I should be on a stage, sure as anything! Never thought I was much of an actor, but guess I was wrong. I scrape and gawp and look an absolute fool to anyone looking, for certain!

The rich man still keeps his secrets close, but I can see him loosening, like drawstrings on a cheap money pouch. Just a matter of time, now…]]

    journal.journalId = 2014 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 3"
end

function ADVR.JournalEvents.onPageCollected()
end