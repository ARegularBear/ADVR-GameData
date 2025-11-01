function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Day the Second of the Second Season, Year 1269

Finally, home.

My first order of business on returning was to further secure my laboratory. The door has been replaced with a sturdy oak slab covered with iron locks. I make an awful clanging with the keys each morning, but the necessity is clear.

With some hesitation, I will attempt to apply what I learned abroad here. Caution will be paramount, but this locus must be strengthened if I am to progress my studies safely.]]

    journal.journalId = 2015 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 12"
end

function ADVR.JournalEvents.onPageCollected()
end