function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I can't believe it, betrayed by a fellow adventurer. I mean, I understand the envy, it must be tough to meet someone so clearly your superior. But murder? Wow, just WOW. Now I suppose I'll need to haunt them or something before I can “move on”, unfinished business and such. Not sure what they look like, though…I guess I'll just look for an adventurer who looks “murdery”. Haunt them for a while, make them see the error of their ways, then off to…somewhere cool, I hope.]]

    journal.journalId = 35 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 2"
end

function ADVR.JournalEvents.onPageCollected()
end