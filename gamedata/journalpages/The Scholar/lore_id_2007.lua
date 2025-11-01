function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Day the Eleventh of the Third Season, Year 1266

How true it is that we all play the fool, both the mighty and the meager!

The rites and rituals I dismissed as theatrical nonsense early in my studies have proven to be key to working greater magics. In my new location, the movements and incantations specified have wrought a grand variety of wonders.

It occurs to me now that my records and references must be secured. My discoveries could readily be put to ill use.]]

    journal.journalId = 2007 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 7"
end

function ADVR.JournalEvents.onPageCollected()
end