function ADVR.onLoad()
	RefreshBubble()
end

function RefreshBubble()
	bubble.ClearBubble()
		if game.homeBaseStoryHandler.currentEventBlacksmith == "introduction" then
		bubble.AddDialog("introduction_dialog1", "...", "introduction_choice1")
		bubble.AddChoice("introduction_choice1", "...hello?", "introduction_dialog2")
			
		bubble.AddDialog("introduction_dialog2", "Greetings. You intend to go inside, I take it?", "introduction_choice2")
		bubble.AddChoice("introduction_choice2", "I do.", "introduction_end")
	
		bubble.AddDialog("introduction_end", "So be it. I would warn you away, but I know there is no use in it. Instead, I bid you only to take care. The Ancient Dungeon is a dangerous place.", nil)
	elseif game.homeBaseStoryHandler.currentEventBlacksmith == "crossbow" then
		bubble.AddDialog("crossbow_dialog1", "I have something for you.", "crossbow_choice1")
		bubble.AddChoice("crossbow_choice1", "What is it?", "crossbow_dialog2")
			
		bubble.AddDialog("crossbow_dialog2", "A crossbow and dagger. They reappeared, as if by magic, on my workbench this morning.", "crossbow_choice2")
		bubble.AddChoice("crossbow_choice2", "Why give them to me?", "crossbow_dialog3")
	
		bubble.AddDialog("crossbow_dialog3", "You’ve proven yourself ready. These weapons have a purpose, and I believe you’re the one meant to wield them.", "crossbow_end")

		bubble.AddDialog("crossbow_end", "Take them, and may your aim be true. The dungeon has claimed enough lives—perhaps you’ll help put an end to that.", nil)

	elseif game.homeBaseStoryHandler.currentEventBlacksmith == "tome" then
		bubble.AddDialog("tome_dialog1", "There’s something new for you.", "tome_choice1")
		bubble.AddChoice("tome_choice1", "What is it?", "tome_dialog2")
		
		bubble.AddDialog("tome_dialog2", "A wand and a tome. They appeared on my bench, just as the others did.", "tome_choice2")
		bubble.AddChoice("tome_choice2", "Why now?", "tome_dialog3")

		bubble.AddDialog("tome_dialog3", "You’ve shown you can handle more than steel. These are tools of magic—use them wisely.", "tome_end")

		bubble.AddDialog("tome_end", "Take them. Perhaps with these, you’ll uncover secrets even the dungeon itself has forgotten.", nil)
	elseif game.homeBaseStoryHandler.currentEventBlacksmith == "augmentshop" then
		bubble.AddDialog("augmentshop_dialog1", "Hold, please, and listen for a moment.", "augmentshop_choice1")
		bubble.AddChoice("augmentshop_choice1", "Yes?", "augmentshop_dialog2")
			
		bubble.AddDialog("augmentshop_dialog2", "Another like you has blooded The Beast, and my weapons can be strengthened as a result. The blood can change and empower them", "augmentshop_choice2")
		bubble.AddChoice("augmentshop_choice2", "Awesome!", "augmentshop_end")
	
		bubble.AddDialog("augmentshop_end", "Yes, it can be awe-inspiring. Since you are next to risk your life in that place, I feel it is only right that you decide how the blood is used. I’ve made some plans and posted them near the anvil, please take a look.", nil)
	else
		local randDiag = math.random(0, 8)
		if randDiag == 0 then
			bubble.AddDialog("rand_1", "No, I don’t just stand here all the time! I just do all my forgework while you lot are in the dungeon, lest I be pestered with inane questions!", nil)
		elseif randDiag == 1 then
			bubble.AddDialog("rand_2", "The hammer is the first thing my family forged, untold generations ago. It is made of the same stuff as our weapons, but heated differently to make it harder and more durable.", nil)
		elseif randDiag == 2 then
			bubble.AddDialog("rand_3", "My grandfather’s grandfather completed the knife, and what a shock it gave him when he threw it! Nearly took off his ear when it came soaring back!", nil)
		elseif randDiag == 3 then
			bubble.AddDialog("rand_4", "As long as that dungeon has been around, so has my family. We hold it as a sacred duty to forge weapons to aid in its destruction.", nil)
		elseif randDiag == 4 then
			bubble.AddDialog("rand_5", "The weapons my family forges always make their way back to us, regardless of the wielder’s fate. We don’t really understand it, but we certainly appreciate it.", nil)
		elseif randDiag == 5 then
			bubble.AddDialog("rand_6", "That acolyte fellow keeps pestering me with “hello” and “good morning” and such. To my mind, silence is better left unbroken...especially in the morning.", nil)
		elseif randDiag == 6 then
			bubble.AddDialog("rand_7", "The Ancient Dungeon churns beneath the earth constantly, moving about bit by bit. The last entrance found was nearly 500 miles southeast of here!", nil)
		elseif randDiag == 7 then
			bubble.AddDialog("rand_8", "Last night, I dreamed that the dungeon spoke to me. Odd, and more odd still, I swear it sounded familiar...", nil)
		elseif randDiag == 8 then
			bubble.AddDialog("rand_9", "I've heard tell that there are “merchants” in the dungeon, selling oddments. Be wary, friend: anything that lives in that place surely means you harm.", nil)
		end
	end

	-- configure the speechbubble
	bubble.firstDialog = bubble.GetFirstPage().id
	bubble.npcName = "The Blacksmith"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
	RefreshBubble()
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if dialogID == "introduction_end" then
		game.SaveBool("story_introduction", true)
		game.homeBaseStoryHandler.blacksmithForceDialogueCollider.SetActive(false)
	elseif dialogID == "augmentshop_end" then
		game.SaveBool("story_augmentshop", true)
		game.ShowMessageInWorld(game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("blacksmith_unlocked_augmentshop"), 4.0)
		game.RefreshHomeBaseUIs()
		game.homeBaseStoryHandler.blacksmithForceDialogueCollider.SetActive(false)
	elseif dialogID == "crossbow_end" then
		game.SaveBool("story_crossbow_dialogue", true)
		game.ShowMessageInWorld(game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("blacksmith_unlocked_crossbow"), 4.0)
		game.homeBaseStoryHandler.blacksmithForceDialogueCollider.SetActive(false)
		game.RefreshHomeBaseUIs()
	elseif dialogID == "tome_end" then
		game.SaveBool("story_tome_dialogue", true)
		game.ShowMessageInWorld(game.localizationInterpreter.currentlySelectedLanguage.GetTranslation("blacksmith_unlocked_tome"), 4.0)
		game.homeBaseStoryHandler.blacksmithForceDialogueCollider.SetActive(false)
		game.RefreshHomeBaseUIs()
	end
end