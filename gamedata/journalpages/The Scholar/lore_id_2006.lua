function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Day the Fourth of the Second Season, Year 1266

After a great deal of effort on my (and my servants’) part, the entirety of my laboratory has been moved to the basement. I have arranged my instruments around the particular point in space where my flame is most brilliant.

And, truly, that is all. While I have bent my mind towards the working of other magics, a simple flame continues to be the height of my achievement. Certainly I lack some key insight.

Experimentation has yielded its fruit. Back to the books!]]

    journal.journalId = 2006 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 6"
end

function ADVR.JournalEvents.onPageCollected()
end