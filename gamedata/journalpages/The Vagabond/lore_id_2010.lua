function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[You made a mistake, rich man. Poor don’t mean stupid, no more than rich means smart.

I been all over, seen things, magic things, here and there. Been lookin’ for more, and up you pop, stinkin’ of magic and skulking about for more, just like me.

You can do it, though, I saw, when you thought no one was about. Gonna get your secrets, rich man, no matter what I gotta do.]]

    journal.journalId = 2010 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 1"
end

function ADVR.JournalEvents.onPageCollected()
end