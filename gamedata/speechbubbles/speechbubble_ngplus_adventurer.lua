function ADVR.onLoad()
	-- Add all Speechbubble Dialogs and choices 
	if player.TotalWins == 0 then
		bubble.AddDialog("wins_0_part1", "Hah! That thing booted you out here too, right?", "wins_0_choice1")
		bubble.AddChoice("wins_0_choice1", "I...guess so...", "wins_0_part2")

		bubble.AddDialog("wins_0_part2", "A handy trick, that. Anything seems too nasty, just poof it away. Won’t stop me, though. I’ve never failed a hunt, and won’t start now.", "wins_0_choice2")
		bubble.AddChoice("wins_0_choice2", "So...you’re...", "wins_0_part3")

		bubble.AddDialog("wins_0_part3", "Bashing my way back inside! Figure it’ll be quicker than finding my way back to the entrance, considering I have no idea where we are.", "wins_0_choice3")
		bubble.AddChoice("wins_0_choice3", " Do you...need help?", "wins_0_end")

		bubble.AddDialog("wins_0_end", "Help, yes, competition, no. I appreciate the offer, but there’s only glory enough for one in there: me! Off you go!", nil)
	elseif player.TotalWins == 1 then
		bubble.AddDialog("wins_1_part1", " Sorry *huff* can’t talk *puff*! Believe it or not, bashing a hole in a mountain is difficult work!", "wins_1_choice1")
		bubble.AddChoice("wins_1_choice1", "...", "wins_1_end")

		bubble.AddDialog("wins_1_end", "I'm almost there! That thing will die with my sword through its eye, or I’ll die trying!", nil)
	else
		bubble.AddDialog("mp_other_end", "...", nil)
	end
	
	-- configure the speechbubble
	bubble.firstDialog = bubble.GetFirstPage().id
	bubble.npcName = "The Hunter"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
	if(dialogID == "wins_1_end" or dialogID == "wins_0_end" or dialogID == "mp_other_end") then
		local diggingAdventurer = game.FindObjectOfType(game.GetType("DiggingAdventurer")) ---@type DiggingAdventurer|Object
		diggingAdventurer.FinishInteraction()
	end
end