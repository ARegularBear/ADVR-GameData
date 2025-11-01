function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[After scrabbling fruitlessly at the earthen walls for a few moments, I decided to explore further into the cave. Led only by touch, I felt earth turn to worked stone, and realized my situation with jarring clarity: I had been ensnared by the Ancient Dungeon. Despite its long absence, the dungeon’s existence was uncontested by the historians of the Grand Library. There was only one great labyrinth known to be churning below the earth, and I was in it.]]

    journal.journalId = 30 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 2"
end

function ADVR.JournalEvents.onPageCollected()
end