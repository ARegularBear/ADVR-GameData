function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[My friends took me on a long trip to visit a cave. They said the bad people were inside the cave and said for me to go in. I went in the cave and it was dark and I got lost but I found the bad things and I killed the things. I killed for a long time but there were a lot of bad things. I got very tired and the bad things were hurting me. The bad things hurt me for a long time but then I got sleepy and I went to sleep.]]

    journal.journalId = 21 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 3"
end

function ADVR.JournalEvents.onPageCollected()
end