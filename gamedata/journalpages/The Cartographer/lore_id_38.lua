function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[From then on I abandoned my academic pursuits and focused solely on survival. The risk I had taken would be worth less than nothing if I could not, at least, escape with my life. Though my map was useless, I hoped that the notes I had written concerning the many dangers of the Ancient Dungeon would have some value. I continued with great caution, moving slowly and carefully. Many more weeks passed, but I survived, creeping ever downward, until I finally met…the end.]]

    journal.journalId = 38 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 3"
end

function ADVR.JournalEvents.onPageCollected()
end