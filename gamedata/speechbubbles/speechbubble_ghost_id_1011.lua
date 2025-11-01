function ADVR.onLoad()
	-- configure the speechbubble
	bubble.npcName = "The Hunter"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if dialogID == "unlockRunPart" then
		game.specialEventsGraph.GetEntryById(1011).Complete()
		bubble.transform.parent.gameObject.GetComponent_Animator_().SetTrigger("dissappear")
	elseif dialogID == "cradle_talk" then
		game.EndRunFadeout()
	end
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
	bubble.ClearBubble()


	if game.IN_CHALLENGE_RUN then
		if game.currentFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
			bubble.AddDialog("og_part1", "Oh…hey. Looks like one of you adventurers knocked my senses back into me. Weird…can't see how anyone could have beat me.", "og_part2")
			bubble.AddDialog("og_part2", "Well, I suppose if they were, like, the GREATEST adventurer ever, they might have beat me. That must be it…right?", "og_part3")
			bubble.AddDialog("og_part3", "Well…uh, good luck and all. Hope you survive. Being a ghost isn't much fun.", nil)
		elseif game.currentFloor == dungeonFloor.FORGOTTEN_LIBRARY then
			bubble.AddDialog("fl_part1", "I think I remember now. I didn't die from some murdery adventurer. I think it was a skeleton. A stupid skeleton.", "fl_part2")
			bubble.AddDialog("fl_part2", "I wasn't being careful. I figured nothing could touch me. Ya know…being The Hunter, and all. Kinda dumb of me.", "fl_part3")
			bubble.AddDialog("fl_part3", "Hey, you be careful, though! I wouldn't want what happened to me to happen to you.", nil)
		elseif game.currentFloor == dungeonFloor.THE_CRADLE then
			bubble.AddDialog("tc_part1", "Wow, that was great. Really awesome. If I hadn't been so big-headed, maybe I could've done something like that.", "tc_part2")
			bubble.AddDialog("tc_part2", "I feel better now. Ready to move on. I can't thank you enough.", "cradle_talk")
			bubble.AddDialog("cradle_talk", "And remember! Be careful, no matter what. A bit of fear can be a good thing, keeps you safe.", nil)
		end
	else
		bubble.AddDialog("unlockRunPart", "<i>A grimace is clearly evident on the ghost's vague features as it gazes at you, but the apparition remains still.</i>", nil)
	end
	bubble.firstDialog = bubble.GetFirstPage().id
end