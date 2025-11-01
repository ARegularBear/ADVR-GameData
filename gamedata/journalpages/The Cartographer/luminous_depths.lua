function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[These caves…unbelievable. The air itself shimmers with magic and gigantic glowing crystals pierce the massive stone chambers from floor to ceiling. Small waterfalls cascade into pools of crystal clear water and scatter the soft light . A strange breed of ribbon-like grass sways in unseen winds. It is all terribly strange and beautiful.

Tch, tch…my words do no justice to this place, but I am happy to be here. I think I will finally sleep well tonight, perhaps even dream.

Maybe I’ll dream of home.

]]

    journal.journalId = 3006
    journal.journalTitle = "Luminous Depths"
end

function ADVR.JournalEvents.onPageCollected()
    game.specialEventsGraph.SetEventFound(journal.journalId)
end