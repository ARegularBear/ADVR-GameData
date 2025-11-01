function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[An honest man, in taking stock of what is absolutely necessary for a good life, will find little. Enough food not to suffer hunger, enough shelter not to suffer the elements, enough water not to suffer thirst. The excesses most men indulge in weaken them, bind them up with a thousand “needs” that are truly “wants”. They toil endlessly after them, somehow blind to their utter uselessness. I have long tried to free men from such chains, but they only see a “madman” crying out in the town square. ]]

    journal.journalId = 37 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 1"
end

function ADVR.JournalEvents.onPageCollected()
end