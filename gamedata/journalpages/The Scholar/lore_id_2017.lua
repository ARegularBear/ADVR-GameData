function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Day the Thirty-Ninth of the Second Season, Year 1269

I have finally managed to strengthen my locus, though “strengthen” may not be the best word for it. “Widen” would be better, as I now believe it to be a “tear” in our reality, with some other reality beyond it.

Slowly, carefully, I have been plucking at its edges, widening it by almost imperceptible increments. I do perceive it, though, like a faint ray of sunlight on my skin. My power has grown.

A bit more, then I will stop. The process is intoxicating, but I shall not drink to satisfaction.]]

    journal.journalId = 2017 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 13"
end

function ADVR.JournalEvents.onPageCollected()
end