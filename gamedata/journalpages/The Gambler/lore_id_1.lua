function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I had it all figured out a long time ago. Other folks, they make big plans, shore up piles of wealth, all thinking it gives them some sort of control on their life.
Then those plans fall through, that wealth is snatched away, and they're no better than they started.
Not me, though, I saw the world for what it was: a big pile of random chance. No point in fighting it, better to roll right along with it, and enjoy the ride.
]]

    journal.journalId = 1 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 1"
end

function ADVR.JournalEvents.onPageCollected()
end