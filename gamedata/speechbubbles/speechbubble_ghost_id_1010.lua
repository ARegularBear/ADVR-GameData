function ADVR.onLoad()
	-- configure the speechbubble
	bubble.npcName = "The Biologist"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if dialogID == "unlockRunPart" then
		game.specialEventsGraph.GetEntryById(1010).Complete()
		bubble.transform.parent.gameObject.GetComponent_Animator_().SetTrigger("dissappear")
	elseif dialogID == "cradle_talk" then
		game.EndRunFadeout()
	end
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
	bubble.ClearBubble()

	if game.IN_CHALLENGE_RUN then
		if game.currentFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
			bubble.AddDialog("og_part1", "I really think every negative interaction is the result of poor communication. I prided myself on understanding what animals tried to communicate, but…sometimes I was wrong.", "og_part2")
			bubble.AddDialog("og_part2", "I was wrong with Clarence. Clarence wasn't cuddly, he was hungry. I went to sleep with him burbling in my hair one night…and, well, he burbled a hole right through it.", "og_part3")
			bubble.AddDialog("og_part3", "On the bright side, at least Clarence isn't hungry anymore. I really hope he gets to grow up and be big and strong like all his friends.", nil)
		elseif game.currentFloor == dungeonFloor.FORGOTTEN_LIBRARY then
			bubble.AddDialog("fl_part1", "It's my fault, really. Animals do things based on instinct, not on rational thought. I just forget that sometimes, what with them being so cute and amazing.", "fl_part2")
				bubble.AddDialog("fl_part2", "I mean, if Clarence had thought about how much we meant to each other, I'm sure he wouldn't have eaten a hole into my skull.", "fl_part3")
				bubble.AddDialog("fl_part3", "At least I know he doesn't feel guilty. He probably just feels…full, I guess.", nil)
		elseif game.currentFloor == dungeonFloor.THE_CRADLE then
			bubble.AddDialog("tc_part1", "Hey, thanks for hearing me out. In all honesty, I think I was feeling a bit…resentful towards Clarence. But he was just being him. Cute, amazing, and dangerously acidic.", "tc_part2")
			bubble.AddDialog("tc_part2", "Time for me to go. Do you think there are any animals on the other side? I hope so. If not, I suppose I could give “people” a chance.", "cradle_talk")
			bubble.AddDialog("cradle_talk", "Ew. That gave me a shiver. I'm sure there are animals. Dogs, at the very least.", nil)
		end
	else
		bubble.AddDialog("unlockRunPart", "<i>The ghost's eyes scan you up and down, drinking in every detail. You have a feeling it very much wants to poke you.</i>", nil)
	end
	bubble.firstDialog = bubble.GetFirstPage().id
end