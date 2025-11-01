function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Immediately, problems presented themselves. Not only did the dungeon contain numerous hostile creatures (all of whom I ran from rather than engage), but much worse, the corridors I mapped seemed to wrap and twist among each other like a mass of knotted rope. The further I went, the more inexplicable my map became. After weeks of desperate survival, I became certain of a terrifying truth: the dungeon was moving.]]

    journal.journalId = 31 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 2"
end

function ADVR.JournalEvents.onPageCollected()
end