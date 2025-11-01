function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[I got bigger and stronger and very good at fighting. The new people are my first friends. They give me food and presents. I have a big ax and a bear hat and a little dress. My friends say it is not a dress it is a killed. I did not kill it though because it is just a dress. I did kill the bad people and my friends like me more now. But once I killed one of my friends by mistake and I think that my friends did not like that.]]

    journal.journalId = 13 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 2"
end

function ADVR.JournalEvents.onPageCollected()
end