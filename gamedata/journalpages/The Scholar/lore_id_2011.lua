function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Day the Twenty-Fifth of the Third Season, Year 1268

It is more than I hoped and worse than I feared.

The power of this place…is terrifying. I fear that if I were to conjure a breeze, a mountain might topple.

As such, I will only study this phenomenon. Nothing is apparent to the eyes, but I sense this locus with something keener, some ineffable organ I did not realize I possessed.

I wonder, do all great men fear their discoveries as I do?]]

    journal.journalId = 2011 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 10"
end

function ADVR.JournalEvents.onPageCollected()
end