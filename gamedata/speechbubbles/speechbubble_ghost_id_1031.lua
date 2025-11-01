function ADVR.onLoad()
	-- configure the speechbubble
	bubble.npcName = "The Ascetic"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if dialogID == "unlockRunPart" then
		game.specialEventsGraph.GetEntryById(1031).Complete()
		bubble.transform.parent.gameObject.GetComponent_Animator_().SetTrigger("dissappear")
	elseif dialogID == "cradle_talk" then
		game.EndRunFadeout()
	end
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
	bubble.ClearBubble()

	if game.IN_CHALLENGE_RUN then
		if game.currentFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
			bubble.AddDialog("og_part1", "I lived within the Ancient Dungeon for nearly thirty-two years before dying peacefully in my sleep. I stayed there, not because I was lost, but because I was happy.", "og_part2")
			bubble.AddDialog("og_part2", "The solitude, the simplicity of my existence with the dungeon delighted me beyond words, and I could not bring myself to leave.", "og_part3")
			bubble.AddDialog("og_part3", "True, I would be viewed as a failure by the world without…but such concerns are also excess.", nil)
		elseif game.currentFloor == dungeonFloor.FORGOTTEN_LIBRARY then
			bubble.AddDialog("fl_part1", "Why do I wander still? Why am I not at rest? Long have I pondered that question, adventurer.", "fl_part2")
			bubble.AddDialog("fl_part2", "Ah…no matter…it is an unexpected delight to converse a bit. I did not realize until now that I missed it.", "fl_part3")
			bubble.AddDialog("fl_part3", "Apologies, I ramble. I am…unused to considering another’s concerns…", nil)
		elseif game.currentFloor == dungeonFloor.THE_CRADLE then
			bubble.AddDialog("tc_part1", "Hello adventurer, and thank you. With your help, I have discovered what has kept me from a true rest.", "tc_part2")
			bubble.AddDialog("tc_part2", "It was guilt. I abandoned humanity when I chose to reside here, and so denied it the opportunity to learn my ways. I am ashamed.", "cradle_talk")
			bubble.AddDialog("cradle_talk", "You have listened to me, though, and, perhaps, learned from me. That is enough, and enough is plenty.", nil)
		end
	else
		bubble.AddDialog("unlockRunPart", "<i>The ghost silently considers you, expressionless, but you somehow feel as though you are being judged.</i>", nil)
	end
	bubble.firstDialog = bubble.GetFirstPage().id
end