function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I lay the fault of my death at the feet of the Grand Library. After being ousted and vilified for my research by the masters, I was forced to live as an exile in the woods, living on small game and whatever pittance desperate villagers would trade for my “sacrilegious” potions. Such sacrilege was hard work, though, and so it was that, as I scraped moss from a random cavern’s wall, daylight suddenly disappeared with a great cracking noise and I was lost in darkness.]]

    journal.journalId = 11 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 1"
end

function ADVR.JournalEvents.onPageCollected()
end