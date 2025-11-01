function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I feel like an unlucky miner, forever bashing at rock without uncovering the slightest gleam of metal.

For every bit of sense that I uncover a bucket of nonsense follows. It seems that, much like science, the practitioners of magic are composed of a few brilliant minds whose genius is drowned in a sea of foolish utterances. 

No matter. I will collect all the bits until the truth is plain.]]

    journal.journalId = 2002 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 2"
end

function ADVR.JournalEvents.onPageCollected()
end