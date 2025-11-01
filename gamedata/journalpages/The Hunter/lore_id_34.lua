function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I died. I…I don't understand, how could I be dead? I'm the greatest hunter that ever lived! What happened? It's all fuzzy in my head. Okay, okay…just think. I remember digging back into the dungeon…talking to a few idiots who must have lucked their way out…then I got in…and…nothing. Just dead. Wait…WAIT! Did one of those idiots sneak up on me and kill me? That must be it. It's the only way any of this makes sense…]]

    journal.journalId = 34 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 1"
end

function ADVR.JournalEvents.onPageCollected()
end