function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I did not despair: I exulted. Despite all their machinations, the Grand Library could not keep me from great works! With some difficulty, I began gathering up every sprout, fungus, and weed I came across. All were steeped in the magic of the dungeon, and the potions I brewed with them were wondrous! Imbued beyond mortal boundaries, every danger of my new home was inconsequential. I walked the corridors of the Ancient Dungeon without fear, like a lord in his castle. In reality, I was an interloper, and my intrusion did not go unnoticed.]]

    journal.journalId = 33 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 3"
end

function ADVR.JournalEvents.onPageCollected()
end