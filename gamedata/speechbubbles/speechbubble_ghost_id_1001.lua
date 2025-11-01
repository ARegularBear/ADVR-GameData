function ADVR.onLoad()
	-- configure the speechbubble
	bubble.npcName = "The Cartographer"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if dialogID == "unlockRunPart" then
		game.specialEventsGraph.GetEntryById(1001).Complete()
		bubble.transform.parent.gameObject.GetComponent_Animator_().SetTrigger("dissappear")
	elseif dialogID == "cradle_talk" then
		game.EndRunFadeout()
	end
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
	bubble.ClearBubble()

	if game.IN_CHALLENGE_RUN then
		if game.currentFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
			bubble.AddDialog("og_part1", "After so much wandering, I was almost glad to find no way forward. I had lowered myself into a pit, a cliff on one side, an abyss on the other.", "og_part2")
			bubble.AddDialog("og_part2", "It was quiet, and dark, and still. I sat on the ledge and stared into that blackness for minutes on end…", "og_part3")
			bubble.AddDialog("og_part3", "…until something stared back.", nil)
		elseif game.currentFloor == dungeonFloor.FORGOTTEN_LIBRARY then
			bubble.AddDialog("fl_part1", "A gigantic yellow eye opened in front of me, glowing fiercely with an inward light that fully revealed its terrible form.", "fl_part2")
			bubble.AddDialog("fl_part2", "A massive, fleshy orb with a single eye and a toothy, gaping maw. Every bit of me wanted to run, but something more than just fear kept me still.", "fl_part3")
			bubble.AddDialog("fl_part3", "I could not scream when it bit into me. I could not weep for the loss of my simple, foolish life.", nil)
		elseif game.currentFloor == dungeonFloor.THE_CRADLE then
			bubble.AddDialog("tc_part1", "I died for a chance to make a mark on the world, on history. Now, I wonder about that choice. What's wrong with a small life, well-lived and unnoticed?", "tc_part2")
			bubble.AddDialog("tc_part2", "I was not the first to die in such a manner, and I won't be the last. It is a strange kind of madness.", "cradle_talk")
			bubble.AddDialog("cradle_talk", "All the same, I thank you, adventurer. I can finally rest.", nil)
		end
	else
		bubble.AddDialog("unlockRunPart", "<i>The ghost looks at you with a sad smile on its face, and gives a little wave in greeting.</i>", nil)
	end
	bubble.firstDialog = bubble.GetFirstPage().id
end