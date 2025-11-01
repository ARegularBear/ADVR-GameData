function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[A life of noble restraint had hardened my constitution and will to iron. The perils presented within the dungeon were nearly inconsequential to me, and I passed them by with a wisdom borne of a lengthy life of deprivation. Amazingly, I came upon food and water with greater ease than ever before, and I ate and drank so steadily I wondered if it were in excess. The creatures within regarded me mostly without interest, and those that pursued I easily evaded. My success seemed assured.]]

    journal.journalId = 41 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 3"
end

function ADVR.JournalEvents.onPageCollected()
end