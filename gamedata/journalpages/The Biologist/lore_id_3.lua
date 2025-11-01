function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I've always loved animals. They're just SO MUCH BETTER than people! Some are cute and soft, others ugly and hard, but all of them are AMAZING! I've always spent as much time with animals as I could, sometimes just observing, but also hugging, and smooching, and cuddling them. Even better, when they die (old and happy, of course), you can take them apart and learn SO MUCH! I'll never forget my first dissection, it was magical.]]

    journal.journalId = 3 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 1"
end

function ADVR.JournalEvents.onPageCollected()
    
end