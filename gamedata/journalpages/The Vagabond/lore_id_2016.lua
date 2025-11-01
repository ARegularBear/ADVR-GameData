function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Thick stone and hearthfire in every corner! Can’t hardly believe it, how rich one man can be and how poor another.

No bother, though, here I am, cozy as can be. Rich man thinks me an idiot, lets only me down to his lab to serve him his tea and biscuits. Thinks I can’t sus a bit of what I see, but I do. Been writing down every scrap I can recall, see if I can’t make some magic myself!]]

    journal.journalId = 2016 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 4"
end

function ADVR.JournalEvents.onPageCollected()
end