function ADVR.onLoad()
	-- configure the speechbubble
	bubble.npcName = "The Penitent"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if dialogID == "unlockRunPart" then
		game.specialEventsGraph.GetEntryById(1030).Complete()
		bubble.transform.parent.gameObject.GetComponent_Animator_().SetTrigger("dissappear")
	elseif dialogID == "cradle_talk" then
		game.EndRunFadeout()
	end
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
	bubble.ClearBubble()

	if game.IN_CHALLENGE_RUN then
		if game.currentFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
			bubble.AddDialog("og_part1", "I cannot understand the divine purpose of my death, but even now I acknowledge it as true and right.", "og_part2")
			bubble.AddDialog("og_part2", "The grand design is imperceptible to mortals, but even so, I do wish that I could contemplate that portion concerning my passing.", "og_part3")
			bubble.AddDialog("og_part3", "Is that why I remain? Have I kindled the flame of sin within myself by harboring such a desire?", nil)
		elseif game.currentFloor == dungeonFloor.FORGOTTEN_LIBRARY then
			bubble.AddDialog("fl_part1", "Yes…yes…it is pride. Imagine, to think one’s self so grand as to merit a glimpse at the divine plan!", "fl_part2")
			bubble.AddDialog("fl_part2", "I must repent, but with my flesh now gone, I am unpracticed in an appropriate ritual. Pain will purge me, but what sort?", "fl_part3")
			bubble.AddDialog("fl_part3", "I think…I will meditate on my folly. Hone the edge of that memory until the shame of it cuts as deeply as any blade.", nil)
		elseif game.currentFloor == dungeonFloor.THE_CRADLE then
			bubble.AddDialog("tc_part1", "Ah, pain! Ah, delight! Ah, redemption! Thank you, divines! I am enlightened, ascended!", "tc_part2")
			bubble.AddDialog("tc_part2", "My soul has been humbled just as my body once was, and I can feel the other side now open to me. I will depart.", "cradle_talk")
			bubble.AddDialog("cradle_talk", "Adventurer, I thank you for your company and conversation. Divines’ blessings be upon you.", nil)
		end
	else
		bubble.AddDialog("unlockRunPart", "<i>The ghost looks at you square in the eye for a few moments before giving a reluctant nod of acknowledgement.</i>", nil)
	end
	bubble.firstDialog = bubble.GetFirstPage().id
end