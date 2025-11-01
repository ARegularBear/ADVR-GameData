function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I suffered a thousand-thousand wounds as I progressed, but such ravages were small things to me. I fought and bled for hours, then days, and with each passing moment grew more assured of the divines’ blessing upon me. My fervor was such that I did not notice the gradually slowing of my pace, the softening of my blows…or my increasingly shallow breaths. Even so, I continued to slay until my very last moment, eventually collapsing into a motionless heap, a terrible ghoul freshly skewered by my sword.]]

    journal.journalId = 39 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 3"
end

function ADVR.JournalEvents.onPageCollected()
end