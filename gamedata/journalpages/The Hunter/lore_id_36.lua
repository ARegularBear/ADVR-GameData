function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Dead sucks. Haunting sucks. It's not working. I've spooked at least a dozen murdery-looking adventurer types, and no beautiful, otherworldly light from above to walk into yet. And I…I don't know, it's getting harder to think lately. Makes me tired. If I don't figure this out soon, I'm afraid I'll end up like the other mindless ghosts around here, just floating about and beating on whoever comes along. Hah! I'll be fine. The Hunter always wins!]]

    journal.journalId = 36 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 3"
end

function ADVR.JournalEvents.onPageCollected()
end