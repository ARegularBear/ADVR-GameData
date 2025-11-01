function ADVR.onLoad()
	-- Add journal text 
    journal.journalText =  
[[On my very first day inside, I met Clarence. He was ADORABLE! He followed me around like a gooey little green puppy and he LOVED TO CUDDLE! Every time I turned around he had glommed onto me somewhere, making happy little burbling sounds. Sure, Clarence put some holes in my outfit, but he was just having fun. We made a great team! We spent days and days gathering notes about his friends, watching them, dissecting them…it's really sad it all ended so suddenly.]]

    journal.journalId = 24 -- order corresponds to id in lore pages
    journal.journalTitle = "Page 3"
end

function ADVR.JournalEvents.onPageCollected()
    
end