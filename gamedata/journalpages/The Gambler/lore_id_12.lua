function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Now, I was no great warrior, but I took big swings. I tore through every hall I wandered into, giving as good as I got (and I got quite a bit). The journey was rough, but I was nearly mad with excitement! Gold coins lay about like rubbish, and magical treasures let me do things I couldn't believe. The further I went, the more likely my escape seemed. Big mistake, that. I should have known better. The universe is a fickle sort of thing.]]

    journal.journalId = 12 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 3"
end

function ADVR.JournalEvents.onPageCollected()
end