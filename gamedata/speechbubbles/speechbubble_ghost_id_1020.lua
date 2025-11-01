function ADVR.onLoad()
	-- configure the speechbubble
	bubble.npcName = "The Berserker"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if dialogID == "unlockRunPart" then
		game.specialEventsGraph.GetEntryById(1020).Complete()
		bubble.transform.parent.gameObject.GetComponent_Animator_().SetTrigger("dissappear")
	elseif dialogID == "cradle_talk" then
		game.EndRunFadeout()
	end
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
	bubble.ClearBubble()

	
	if game.IN_CHALLENGE_RUN then
		if game.currentFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
			bubble.AddDialog("og_part1", "I am awake now but my friends are gone and I am lost. The bad things don't hurt me now but I am still scared because I am alone.", "og_part2")
			bubble.AddDialog("og_part2", "Can you be my friend? I will not ask for food because I am not hungry anymore. I will try not to make a mistake.", "og_part3")
			bubble.AddDialog("og_part3", "I am angry at me because I made a mistake and killed my friend.", nil)
		elseif game.currentFloor == dungeonFloor.FORGOTTEN_LIBRARY then
			bubble.AddDialog("fl_part1", "I think that we are friends now. You are not mean to me like the town people so we are friends. Hello new friend.", "fl_part2")
			bubble.AddDialog("fl_part2", "I am happy. I was alone and very scared and very sad but now I have a new friend. You are strong like me but not big like me.", "fl_part3")
			bubble.AddDialog("fl_part3", "I promise I will not make a mistake and kill you.", nil)
		elseif game.currentFloor == dungeonFloor.THE_CRADLE then
			bubble.AddDialog("tc_part1", "That bad thing was big and scary but I was not scared because you are so strong. Thank you for killing the scary bad thing.", "tc_part2")
			bubble.AddDialog("tc_part2", "I am sleepy again. I can see a warm spot now and I think it will be a nice place to sleep so I am going to sleep.", "cradle_talk")
			bubble.AddDialog("cradle_talk", "Good night friend.", nil)
		end
	else
		bubble.AddDialog("unlockRunPart", "<i>The ghost has stopped attacking you, but with obvious difficulty. It lunges toward you every now and then, but manages to restrain itself.</i>", nil)
	end
	bubble.firstDialog = bubble.GetFirstPage().id
end