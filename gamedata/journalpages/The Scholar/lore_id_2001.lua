function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[The “sciences”, as defined by my peers and forebears, have been triumphed. The great discoveries have been made, so I turn my attention to those spheres of knowledge yet untouched.

“Magic”, to use the broadest term.

My work will surely be spurned by most scholars. Even so, I intend that it will not--cannot--be ignored.]]

    journal.journalId = 2001 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 1"
end

function ADVR.JournalEvents.onPageCollected()
end