function ADVR.onLoad()
	if game.homeBaseStoryHandler.currentEventSeer == "seer_intro" then
		bubble.AddDialog("seer_intro_dialog1", "Peace and life's sweetness to you, brave one. May we speak for a moment?", "seer_intro_choice1")
		bubble.AddChoice("seer_intro_choice1", "About what?", "seer_intro_dialog2")

		bubble.AddDialog("seer_intro_dialog2", "About this place and the souls sealed within, the souls of adventurers long dead, tormented and trapped for ages.", "seer_intro_dialog3")
	
		bubble.AddDialog("seer_intro_dialog3", "Now that The Ancient Dungeon has been re-discovered, however, they can be freed and put to rest, with your help.", "seer_intro_choice2")

		bubble.AddChoice("seer_intro_choice2", "How?", "seer_intro_dialog4")

		bubble.AddDialog("seer_intro_dialog4", "Destroy their remains that lie within, then return here so that I may channel their spirit.", "seer_intro_introduction_end")

		bubble.AddDialog("seer_intro_introduction_end", "The spirit will guide you through the dungeon, retracing their final steps. If you can succeed where they failed, each may finally rest.", nil)
	else
		local randDiag = math.random(0, 1)
		if randDiag == 0 then
			bubble.AddDialog("random_1", "The cries of the restless spirits here often keep me awake at night. No rhythm to them.", nil)
		elseif randDiag == 1 then
			bubble.AddDialog("random_2", "Sometimes I resent them, but my moments of suffering are nothing compared to the centuries they have endured.", nil)
		end
	end

	-- configure the speechbubble
	bubble.firstDialog = bubble.GetFirstPage().id
	bubble.npcName = "The Seer"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if dialogID == "seer_intro_introduction_end" then
		game.SaveBool("story_seer_introduction", true)
		game.homeBaseStoryHandler.seerForceDialogueCollider.SetActive(false)
		game.seerUI.lockedBg.gameObject.SetActive(false)
	end
end