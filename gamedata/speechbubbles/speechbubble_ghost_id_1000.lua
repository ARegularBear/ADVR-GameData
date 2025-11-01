function ADVR.onLoad()
	-- configure the speechbubble
	bubble.npcName = "The Gambler"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if dialogID == "unlockRunPart" then
		game.specialEventsGraph.GetEntryById(1000).Complete()
		bubble.transform.parent.gameObject.GetComponent_Animator_().SetTrigger("dissappear")
	elseif dialogID == "cradle_talk" then
		game.EndRunFadeout()
	end
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
	bubble.ClearBubble()
	
	if game.IN_CHALLENGE_RUN then
		if game.currentFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
			bubble.AddDialog("og_part1", "So, I came across a big suit of armor lumbering around a room with a big sword. It was pretty slow, so I figured I could just, you know, “duck and weave” my way to destroying the thing.", "og_part2")
			bubble.AddDialog("og_part2", "I ducked. I wove. I hit it. It just refused to...die? Disanimate? Anyway, I was getting tired and it was too late to run away. My hits got weaker, my movements slower and...", "og_part3")
			bubble.AddDialog("og_part3", "Okay, I'll say it: it lopped my noggin clean off, despite my hair being extremely well-coiffed. Just plain bad luck, that.", nil)
		elseif game.currentFloor == dungeonFloor.FORGOTTEN_LIBRARY then
			bubble.AddDialog("fl_part1", "Sure, I could have practiced with my sword a bit more before going in. Sure, I could have packed some food. But would that have really made any difference?", "fl_part2")
			bubble.AddDialog("fl_part2", "Maybe. Maybe not. That's the problem with luck, good or bad: you never know exactly how much you'll get and how much you'll need. Even years of preparation might be one day too little.", "fl_part3")
			bubble.AddDialog("fl_part3", "I'm glad we got to talk, it helped me get a few things straight in my head. I had a bit of doubt in the back of my mind, and now it's gone. I feel lighter.", nil)
		elseif game.currentFloor == dungeonFloor.THE_CRADLE then
			bubble.AddDialog("tc_part1", "Wow, that was exhausting just to watch! You got a few lucky hits in, just enough, I'd wager. All the same, what a show", "tc_part2")
			bubble.AddDialog("tc_part2", "Sheesh, I really am tired! I can't remember ever being this tired. Lucky me, though, it looks like there's a nice, comfy bed over yonder, just past that light...", "cradle_talk")
			bubble.AddDialog("cradle_talk", "Good luck, adventurer…heck, great luck, the absolute best luck! Now... I'm off to take a nap.", nil)
		end
	else
		bubble.AddDialog("unlockRunPart", "<i>The ghost is clearly smirking, and gives you a knowing wink as you consider it.</i>", nil)
	end
	bubble.firstDialog = bubble.GetFirstPage().id
end