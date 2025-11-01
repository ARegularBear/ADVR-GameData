function ADVR.onLoad()
	-- configure the speechbubble
	bubble.npcName = "The Alchemist"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if dialogID == "unlockRunPart" then
		game.specialEventsGraph.GetEntryById(1021).Complete()
		bubble.transform.parent.gameObject.GetComponent_Animator_().SetTrigger("dissappear")
	elseif dialogID == "cradle_talk" then
		game.EndRunFadeout()
	end
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
	bubble.ClearBubble()

	if game.IN_CHALLENGE_RUN then
		if game.currentFloor == dungeonFloor.OVERGROWN_GATEHOUSE then
			bubble.AddDialog("og_part1", "The idea began as a passing thought, but ended as a nearly unshakable impulse. I desperately wanted–and did not want–to venture deeper, to…meet something.", "og_part2")
			bubble.AddDialog("og_part2", "My mind was being assaulted, and I defended myself as best I could. I brewed potions to fortify my mind, gulping them down without regard to possible dangers.", "og_part3")
			bubble.AddDialog("og_part3", "I was…successful? My magical “cocktail” quelled the dreadful impulse, but it also drove me quite insane. Owing to that, I cannot recall the exact circumstances of my death.", nil)
		elseif game.currentFloor == dungeonFloor.FORGOTTEN_LIBRARY then
			bubble.AddDialog("fl_part1", "Perhaps the Grand Library had cause to discourage and condemn my alchemical pursuits. Had previous members been similarly doomed by their creations?", "fl_part2")
			bubble.AddDialog("fl_part2", "In all, it is better that I died within the Ancient Dungeon than above. May my work be forever buried and undisturbed.", "fl_part3")
			bubble.AddDialog("fl_part3", "You, though, if you happen to come across one of my dreadful concoctions, take heed of my warning and let it be.", nil)
		elseif game.currentFloor == dungeonFloor.THE_CRADLE then
			bubble.AddDialog("tc_part1", "As has ever been said, men concern themselves too often with what they can do rather than what they should do. May you be spared such folly.", "tc_part2")
			bubble.AddDialog("tc_part2", "Now then–my heart is lightened and my mind is clear. I will proceed as befits the dead.", "cradle_talk")
			bubble.AddDialog("cradle_talk", "Whatever your aims in this terrible place are, I wish you the best, adventurer", nil)
		end
	else
		bubble.AddDialog("unlockRunPart", "<i>The ghost's face is an expression of barely-contained glee, save for when a violent twitch occasionally warps it into a terrifying rictus.</i>", nil)
	end
	bubble.firstDialog = bubble.GetFirstPage().id
end