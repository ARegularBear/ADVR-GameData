function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Day the Third of the Fourth Season, Year 1265

The strength of my ability seems to vary both according to my “focus” and, oddly, my location.

Concerning focus, I have observed my flame grows and shrinks in accordance with my vigor. Early morning and midday is ideal.

Concerning location...I am uncertain. The third larder seems best, producing a flame both large and bright, but I see no reason why. Further study is needed.]]

    journal.journalId = 2004 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 4"
end

function ADVR.JournalEvents.onPageCollected()
end