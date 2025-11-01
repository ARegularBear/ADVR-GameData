function ADVR.onLoad()
	RefreshBubble()
end

function RefreshBubble()
	bubble.ClearBubble()

	if game.homeBaseStoryHandler.currentEventAcolyte == "introduction" then
		bubble.AddDialog("introduction_dialog1", "Greetings! You are the very first adventurer to arrive! Excited?", "introduction_choice1")
		bubble.AddChoice("introduction_choice1", "Very.", "introduction_dialog2")
			
		bubble.AddDialog("introduction_dialog2", "As am I, excited indeed to observe your attempt...er..success, I mean.", "introduction_choice2")
		bubble.AddChoice("introduction_choice2", "You’re going to watch?", "introduction_end")
	
		bubble.AddDialog("introduction_end", "Yes, using the scrying glass here. I will be making copious notes in order to advance the research of The Grand Library. BUT ENOUGH! Less talk, more questionable life choices! In you go! Good luck!", nil)
	elseif game.homeBaseStoryHandler.currentEventAcolyte == "insightshop" then
		bubble.AddDialog("insightshop_dialog1", "You! You look decisive. If you could spare a moment, I would be grateful.", "insightshop_choice1")
		bubble.AddChoice("insightshop_choice1", "Uh...sure...", "insightshop_dialog2")
			
		bubble.AddDialog("insightshop_dialog2", "Wonderful, the problem is this: due to the mountain of data provided by other adventurers like yourself, I find myself afflicted with *ahem* ANALYSIS PARALYSIS!", "insightshop_choice2")
		bubble.AddChoice("insightshop_choice2", "Gross.", "insightshop_dialog3")

		bubble.AddDialog("insightshop_dialog3", "Don’t be vulgar. And LISTEN! I cannot decide which research to search, every option is equally delectable! Please, PLEASE, choose for me!", "insightshop_choice3")
		bubble.AddChoice("insightshop_choice3", "...sure…", "insightshop_end")
	
		bubble.AddDialog("insightshop_end", "THANK YOU! Just select a topic on the board to my right, quick as you can. I am BRIMMING with academic energies that must be spent!", nil)
	elseif game.homeBaseStoryHandler.currentEventAcolyte == "hardmode" then
		bubble.AddDialog("hardmode_dialog1", "You! You look...TOUGH! Too tough, in fact; the dungeon will be nothing more than a stroll for you! Care to...make it interesting?", "hardmode_choice1")
		bubble.AddChoice("hardmode_choice1", "...yes?", "hardmode_dialog2")
			
		bubble.AddDialog("hardmode_dialog2", "YES! Now listen: I’ve discovered a certain scent that is irresistible to creatures within the dungeon. If you were to give yourself a bit of a spritz...well, a true “adventure” would be guaranteed!", "hardmode_choice2")
		bubble.AddChoice("hardmode_choice2", "I love adventure!", "hardmode_end")

		bubble.AddDialog("hardmode_end", "Of course you do! Well, get to it then! I left a bottle near the entrance, spritz with WILD ABANDON!", nil)
	elseif game.homeBaseStoryHandler.currentEventAcolyte == "arena" then
		bubble.AddDialog("arena_dialog1", "Adventurer! You’re here just in time for AMAZING news!", "arena_choice1")
		bubble.AddChoice("arena_choice1", "Early bird gets the worm, I guess?", "arena_dialog2")
		bubble.AddDialog("arena_dialog2", "Exactly! Listen, a brand new, shiny, exciting, HOLE has appeared!!", "arena_choice2")
		bubble.AddChoice("arena_choice2", "Wow!", "arena_dialog3")
		bubble.AddDialog("arena_dialog3", "Go! Hurry! Jump in! Be the first! Best of luck on not dying!", nil)
	else
		local randDiag = math.random(0, 9)
		if randDiag == 0 then
			bubble.AddDialog("rand_0", "Little known fact: it was I who discovered this entrance. All it took was perseverance, research, and getting very, very lost on a hike.", nil)
		elseif randDiag == 1 then
			bubble.AddDialog("rand_1", "The Grand Library can be a harsh master, but it’s worth it! After only four years of grueling labor and a decade of exorbitant payments, I’m a shoe-in for middle management!", nil)
		elseif randDiag == 2 then
			bubble.AddDialog("rand_2", "Hey, if you find yourself in mortal danger with no way out down there, please consider throwing yourself into a pit. No one has done that yet.", nil)
		elseif randDiag == 3 then
			bubble.AddDialog("rand_3", "Which do you like better, “slime” or “jelly”? I’m leaning towards “jelly”, but that may be because it’s time for my snack.", nil)
		elseif randDiag == 4 then
			bubble.AddDialog("rand_4", "You adventurers always seem to arrive at night, why is that? Skin condition? Night owl? Vampire?! (You know you have to tell me if you’re a vampire, right?)", nil)
		elseif randDiag == 5 then
			bubble.AddDialog("rand_5", "I think I may finally be winning the blacksmith over! This morning--and I swear this is true--he grunted at me when I said “good morning”! Progress!", nil)
		elseif randDiag == 6 then
			bubble.AddDialog("rand_6", "Don’t look at me with those “come-hither” eyes! I am wed to Lady Knowledge and shall never be unfaithful! Now shoo!", nil)
		elseif randDiag == 7 then
			bubble.AddDialog("rand_7", "I asked the blacksmith to critique a bit of my work and he called my handwriting “chicken-scratch”! CHICKEN SCRATCH! We’re no longer on speaking terms.", nil)
		elseif randDiag == 8 then
			bubble.AddDialog("rand_8", "Don’t tell anyone, but sometimes I switch between blue ink and black ink! The Grand Library would be scandalized, but what’s life without a bit of excitement?", nil)
		elseif randDiag == 9 then
			bubble.AddDialog("rand_9", "I can’t keep this secret anymore, the guilt is too much! I draw horizontal rules on my parchment before writing in ink, and then erase the pencil! My impeccable penmanship is a lie! A dirty, dirty lie!", nil)
		end
	end
	
	-- configure the speechbubble
	bubble.firstDialog = bubble.GetFirstPage().id
	bubble.npcName = "The Acolyte"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
	RefreshBubble()
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if dialogID == "introduction_end" then
		game.SaveBool("story_introduction", true)
		game.homeBaseStoryHandler.acolyteForceDialogueCollider.SetActive(false)
	elseif dialogID == "insightshop_end" then
		game.homeBaseStoryHandler.insightShopUI.transform.localScale = vector3.__new(1,1,1)
		game.playerController.networkHasUnlockedInsightShop = base.ToNetworkBool(true)
		game.SaveBool("story_insightshop", true)
		game.ShowMessageInWorld(game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("acolyte_unlocked_insight_shop"), 4.0)
		game.homeBaseStoryHandler.acolyteForceDialogueCollider.SetActive(false)
	elseif dialogID == "hardmode_end" then
		game.SaveBool("story_hardmode", true)
		game.ShowMessageInWorld(game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("acolyte_unlocked_hardmode"), 4.0)
		game.homeBaseStoryHandler.acolyteForceDialogueCollider.SetActive(false)
	elseif dialogID == "arena_dialog3" then
		game.SaveBool("story_arena", true)
		game.ShowMessageInWorld(game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("acolyte_unlocked_arena"), 4.0)
		game.homeBaseStoryHandler.acolyteForceDialogueCollider.SetActive(false)
	end
end