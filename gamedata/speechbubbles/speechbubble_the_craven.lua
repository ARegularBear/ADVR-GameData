function ADVR.onLoad()
	local randDiag = math.random(0, 9)
	if randDiag == 0 then
		bubble.AddDialog("rand_0", "It was a long, cold journey for me, best I warm myself by the fire a bit before going in.", nil)
	elseif randDiag == 1 then
		bubble.AddDialog("rand_1", "I woke up this morning with a terrible headache. Once it passes, I’ll head inside directly.", nil)
	elseif randDiag == 2 then
		bubble.AddDialog("rand_2", "Ooof, I think I ate something bad. I suppose I’ll have to delay my adventure until it settles.", nil)
	elseif randDiag == 3 then
		bubble.AddDialog("rand_3", "Did you see that black cat? It’s an ill omen. Perhaps not the best day for adventuring...", nil)
	elseif randDiag == 4 then
		bubble.AddDialog("rand_4", "I slept terribly last night! Alertness is key when willfully endangering one’s life, so no Ancient Dungeon for me today.", nil)
	elseif randDiag == 5 then
		bubble.AddDialog("rand_5", "Today is my birthday, so I’m celebrating by not entering the Ancient Dungeon.", nil)
	elseif randDiag == 6 then
		bubble.AddDialog("rand_6", "I stepped in a puddle and now I have soggy socks. A person just can’t adventure in soggy socks. Hopefully they’ll be dry by tomorrow.", nil)
	elseif randDiag == 7 then
		bubble.AddDialog("rand_7", "I was going to go inside today, but a dog just ate my homework. I know the two seem unrelated, but trust me, they’re not.", nil)
	elseif randDiag == 8 then
		bubble.AddDialog("rand_8", "Ouch! Paper cuts are the absolute worst! Right on my sword-thumb too! I hope it heals quickly so I can finally go inside.. *unconvincing sigh*", nil)
	elseif randDiag == 9 then
		bubble.AddDialog("rand_9", "No no, you first, I insist! I may not be the greatest adventurer around, but I pride myself on my manners. I’m happy to wait for my turn.", nil)
	end

	-- configure the speechbubble
	bubble.firstDialog = bubble.GetFirstPage().id
	bubble.npcName = "The Craven"
	bubble.timeBetweenLetters = 0.02
end

function ADVR.SpeechbubbleEvents.onSpeechbubbleOpen()
end

function ADVR.SpeechbubbleEvents.onDialogFinished(dialogID)
end