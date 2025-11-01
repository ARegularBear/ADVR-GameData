function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I took big risks, mad risks, to hear others tell it. I lived like a king one day, a pauper the next. I loved it, every day could be anything, and I knew every poor bit of luck would just make the next taste of good fortune that much sweeter. So, when I heard that the Ancient Dungeon had popped up again, you bet I set out for it that very day. I was off to risk it all, and I could barely hold my bones still for all the excitement of it.]]

    journal.journalId = 10 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 2"
end

function ADVR.JournalEvents.onPageCollected()
end