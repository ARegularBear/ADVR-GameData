function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I am not smart, but I am big. I was big when I was little and I was bigger when I was not little. Town people like me when I pick things up for them, but they don't like me when I am hungry. Town people made me leave and I was very hungry. I was alone for a long time but I found new people. The new people have swords and armor and they like to fight bad people. They gave me a sword and let me fight the bad people. I am big and strong and good at fighting.]]

    journal.journalId = 2 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 1"
end

function ADVR.JournalEvents.onPageCollected()
end