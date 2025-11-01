function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[Day the Forty-Fourth of the Fourth Season, Year 1268

I will be returning to my home soon, with great haste.

The things I have learned…should not be discovered in such a painfully exposed setting. Though it is more than an impossibility that my company of guides and servants could grasp the merest shred of this place’s truth, the rumors they could spread may bring unwanted attention.

I will leave in two days with only a single servant. The man is older than I would prefer, but simple-minded enough that I need not fear his observations.]]

    journal.journalId = 2013 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 11"
end

function ADVR.JournalEvents.onPageCollected()
end