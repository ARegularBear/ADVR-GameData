function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[The debasement of our lowly flesh is the greatest display of a man’s devotion to the divine. Though others of my order suck at their teeth when contemplating the practice, I embraced it whole-heartedly from an early age. Thrice daily I rent the flesh of my back, until the pain of it faded to nearly nothing, entirely overshadowed by the divine joy the practice imparted to me. My devotion did not go unnoticed, and I ascended the ranks of the Divine Order quickly.]]

    journal.journalId = 23 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 1"
end

function ADVR.JournalEvents.onPageCollected()
end