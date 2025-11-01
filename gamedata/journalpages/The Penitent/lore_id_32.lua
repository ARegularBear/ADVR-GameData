function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[It was no surprise when I was selected to eradicate the unholy taint of the Ancient Dungeon. My military prowess was only narrowly surpassed by my faith; I was a formidable foe in battle. As I ventured within that heretical tomb of evil, I felt the thick bed of scars upon my back loosen and warm, as though the divines themselves had draped a blessed shroud upon me. My success was assured, I thought, and so I fought through the halls with zealous abandon.]]

    journal.journalId = 32 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 2"
end

function ADVR.JournalEvents.onPageCollected()
end