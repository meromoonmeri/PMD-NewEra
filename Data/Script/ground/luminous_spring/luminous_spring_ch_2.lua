require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

luminous_spring_ch_2 = {}


function luminous_spring_ch_2.FindNumelCutscene()
	local hero = CH('PLAYER')
	local partner = CH('Teammate1')
	local numel = CharacterEssentials.MakeCharactersFromList({{"Numel", 292, 248, Direction.Up}})
	GAME:WaitFrames(60)
	AI:DisableCharacterAI(partner)
	SOUND:StopBGM()
	
	GROUND:TeleportTo(hero, 276, 624, Direction.Up)
	GROUND:TeleportTo(partner, 308, 624, Direction.Up)
	GAME:MoveCamera(300, 600, 1, false)
	--Start numel's trembling
	--GeneralFunctions.StartTremble(numel)
		
	GAME:CutsceneMode(true)
	UI:ResetSpeaker()
	UI:WaitShowTitle(GAME:GetCurrentGround().Name:ToLocal(), 20)
	GAME:WaitFrames(60)
	UI:WaitHideTitle(20)
	GAME:FadeIn(40)
	
	SOUND:PlayBGM('In The Depths of the Pit.ogg', true)
	
	local coro1 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(partner, 308, 488, false, 1) end)
	local coro2 = TASK:BranchCoroutine(function() GAME:WaitFrames(10)
												  GROUND:MoveToPosition(hero, 276, 488, false, 1) end)
												  
	TASK:JoinCoroutines({coro1, coro2})
	GAME:WaitFrames(10)
	
	UI:SetSpeaker(partner)
	UI:WaitShowDialogue("Hmm...[pause=10] Nous avons fait un sacré bout de chemin...")
	GAME:WaitFrames(20)
	
	GROUND:CharTurnToCharAnimated(partner, hero, 4)
	GROUND:CharTurnToCharAnimated(hero, partner, 4)
	UI:WaitShowDialogue("Penses-tu que nous sommes arrivés à la Source Luminante ?")
	UI:WaitShowDialogue("Si c'est bien la Source Luminante,[pause=10] où peut bien se trouver " .. numel:GetDisplayName() .. " ?")
	
	GAME:WaitFrames(20)
	
	GeneralFunctions.LookAround(partner, 4, 4, true, false, false, Direction.Up)
	GeneralFunctions.EmoteAndPause(partner, "Exclaim", true)
	UI:SetSpeakerEmotion("Surprised")
	SOUND:FadeOutBGM(120)
	UI:WaitShowDialogue("Oh![pause=0] " .. hero:GetDisplayName() .. "![pause=0] Regarde par là !")
	GAME:WaitFrames(20)
	
	coro1 = TASK:BranchCoroutine(function() GROUND:CharAnimateTurnTo(hero, Direction.Up, 4) end)
	coro2 = TASK:BranchCoroutine(function() GAME:MoveCamera(300, 478, 1, false)
											GAME:MoveCamera(300, 256, 116, false) end)
	
	
	TASK:JoinCoroutines({coro1, coro2})
	GAME:WaitFrames(10)
	
	UI:SetSpeaker(numel)
	UI:SetSpeakerEmotion("Teary-Eyed")
	UI:WaitShowDialogue("Snif...[pause=0] Maman...[pause=0] Je n'aurais jamais dû m'enfuir...")
	GAME:WaitFrames(20)
	
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Surprised")
	UI:WaitShowDialogue("Regarde![pause=0] Il est là ![pause=0] C'est " .. numel:GetDisplayName() .. " !")
	
	coro1 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(partner, 308, 280, false, 2) end)
	coro2 = TASK:BranchCoroutine(function() GAME:WaitFrames(10)
											GROUND:MoveToPosition(hero, 276, 280, false, 2) end)
											
	TASK:JoinCoroutines({coro1, coro2})
	GAME:WaitFrames(10)	
	
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue(numel:GetDisplayName() .. "![pause=0] Te voilà ![pause=0] On l'a trouvé,[pause=10] " .. hero:GetDisplayName() .. " !")
	GAME:WaitFrames(20)
	
	--GeneralFunctions.StopTremble(numel)	
	GeneralFunctions.EmoteAndPause(numel, "Notice", true)
	UI:SetSpeaker(numel)
	UI:SetSpeakerEmotion("Teary-Eyed")
	UI:WaitShowDialogue("Huh ?")
	
	GAME:WaitFrames(12)
	GROUND:CharAnimateTurnTo(numel, Direction.Down, 4)
	GAME:WaitFrames(10)
	
	GeneralFunctions.Recoil(numel)
	UI:SetSpeakerEmotion("Surprised")
	UI:WaitShowDialogue("Wh-qui êtes-vous ?[pause=0] P-please n-ne me faites pas de mal !")
	
	GAME:WaitFrames(20)
	GROUND:CharSetEmote(partner, "sweating", 1)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Surprised")
	UI:WaitShowDialogue("Woah,[pause=10] on ne va pas te faire de mal ![pause=0] Ce n'est même pas dans nos pensées !")	
	UI:SetSpeakerEmotion("Normal")
	SOUND:PlayBGM("Wigglytuff's Guild Remix.ogg", true)
	UI:WaitShowDialogue("On est l'Équipe " .. GAME:GetTeamName() .. "![pause=0] On est une équipe d'aventuriers et on est là pour te sauver !")
	
	GAME:WaitFrames(20)
	GeneralFunctions.EmoteAndPause(numel, "Exclaim", true)
	UI:SetSpeaker(numel)
	UI:SetSpeakerEmotion("Inspired")
	UI:WaitShowDialogue("Vous êtes une équipe d'aventuriers ?")
	
	
	GAME:WaitFrames(20)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue("Oui ![pause=0] On est là pour te ramener à Bourg Méta !")
	
	GAME:WaitFrames(20)
	SOUND:PlayBattleSE('EVT_Emote_Startled_2')
	GeneralFunctions.Hop(numel)
	GeneralFunctions.Hop(numel)
	
	UI:SetSpeaker(numel)
	UI:SetSpeakerEmotion("Joyous")
	GROUND:CharSetEmote(numel, "glowing", 0)
	UI:WaitShowDialogue("Vraiment ?[pause=0] Hourra ![pause=0] J' commençais à croire que j'allais rester coincé ici pour toujours !")
	UI:WaitShowDialogue("J'avais tout mon épuisé pour venir ici ![pause=0] J'étais trop fatigué pour faire le chemin du retour !")
	UI:WaitShowDialogue("Mais maintenant,[pause=10] je suis sauvé ![pause=0] Merci !")
	GAME:WaitFrames(20)
	
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue("Bien sûr ![pause=0] On est juste contents que tu sois en sécurité !")
	GAME:WaitFrames(20)
	SOUND:FadeOutBGM(120)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Mais,[pause=10] avant de repartir,[pause=10] " .. numel:GetDisplayName() .. "...[pause=0] Tu peux nous dire comment tu as atterri par ici ?")
	
	GAME:WaitFrames(20)
	GROUND:CharSetEmote(numel, "", 0)
	UI:SetSpeaker(numel)
	UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue("Eh bien...[pause=0] Ma maman essaie toujours de tout diriger...")
	UI:WaitShowDialogue("Elle me fait toujours faire toutes sortes de corvées ennuyeuses et épuisantes...")
	UI:WaitShowDialogue("Je pensais que si j'étais grand, elle ne pourrait plus me donner d'ordres.")
	UI:WaitShowDialogue("Alors je me suis faufilé dehors pendant qu'elle dormais et je suis venu ici pour pouvoir évoluer...[pause=0] Mais...")
	GROUND:CharAnimateTurnTo(numel, Direction.Up, 4) 
	GAME:WaitFrames(10)
	GeneralFunctions.Complain(numel, true)
	UI:SetSpeakerEmotion("Angry")
	UI:WaitShowDialogue("La stupide source ne fonctionne même pas ![pause=0] J'ai fait tout ça pour rien !")
	
	GAME:WaitFrames(20)
	GeneralFunctions.EmoteAndPause(partner, "Question", true)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("La source ne fonctionne pas ?[pause=0] Que veux-tu dire ?")
	
	GAME:WaitFrames(20)
	GROUND:CharSetEmote(numel, "", 0)
	GROUND:CharAnimateTurnTo(numel, Direction.Down, 4)
	UI:SetSpeaker(numel)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Eh bien,[pause=10] on est censé se tenir sous la lumière de la source,[pause=10] puis on entend une voix et on évolue...")
	UI:WaitShowDialogue("Mais quand je me mets sous la lumière,[pause=10] rien ne se passe ![pause=0]\\
J'entends même pas de voix !")
	
	GAME:WaitFrames(20)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("C'est étrange...")
	GAME:WaitFrames(20)
	
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("Laisse-moi essayer.[pause=0] Peut-être que ça fonctionnera pour moi ?")
	GAME:WaitFrames(20)
	
	UI:SetSpeaker(numel)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Je suppose que tu peux bien essayer...")
	
	GAME:WaitFrames(20)
	
	coro1 = TASK:BranchCoroutine(function() GROUND:CharAnimateTurnTo(numel, Direction.Right, 4) 
											GROUND:MoveToPosition(numel, 324, 248, false, 1)
											GeneralFunctions.FaceMovingCharacter(numel, partner, 4, Direction.Up) end)
	coro2 = TASK:BranchCoroutine(function() GAME:WaitFrames(20)
											GeneralFunctions.EightWayMove(partner, 292, 248, false, 1)
											GeneralFunctions.MoveCharAndCamera(partner, 292, 192, false, 1)
											GROUND:CharAnimateTurnTo(partner, Direction.Down, 4) end)
	local coro3 = TASK:BranchCoroutine(function() GAME:WaitFrames(60)
												  GROUND:MoveInDirection(hero, Direction.Up, 32, false, 1) end)
											

	TASK:JoinCoroutines({coro1, coro2, coro3})
	
	GAME:WaitFrames(20)
	UI:SetSpeaker(partner)
	UI:WaitShowDialogue("Comme ça,[pause=10] c'est ça ?")
	
	GAME:WaitFrames(20)
	UI:ResetSpeaker(false)
	UI:SetCenter(true)
	UI:WaitShowDialogue("...........................")
	--GAME:WaitFrames(20)
	--UI:WaitShowDialogue("...........................")
	UI:SetCenter(false)
	GAME:WaitFrames(80)
	
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("...Rien ne se passe.[pause=0] J'entends pas de voix non plus.")
	UI:WaitShowDialogue("Je suppose que ça ne fonctionne pas pour moi.")
	
	GAME:WaitFrames(10)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue(hero:GetDisplayName() .. ",[pause=10] pourquoi n'essaies-tu pas ?")
	GAME:WaitFrames(20)

	coro1 = TASK:BranchCoroutine(function() GeneralFunctions.EightWayMove(hero, 292, 216, false, 1)
											GROUND:MoveToPosition(hero, 292, 192, false, 1) 
											GROUND:CharAnimateTurnTo(hero, Direction.Down, 4) end)
	coro2 = TASK:BranchCoroutine(function()	GAME:WaitFrames(8)
											GROUND:CharAnimateTurnTo(partner, Direction.Right, 4)
											GROUND:MoveToPosition(partner, 340, 192, false, 1)
											GROUND:CharAnimateTurnTo(partner, Direction.Left, 4) end)
	coro3 = TASK:BranchCoroutine(function() GeneralFunctions.FaceMovingCharacter(numel, hero, 4, Direction.Up) end)
											

	TASK:JoinCoroutines({coro1, coro2, coro3})
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(Je reste juste ici,[pause=10] alors ?[pause=0] C'est assez bizarre...)", "Worried")
	
	GAME:WaitFrames(20)
	UI:ResetSpeaker(false)
	UI:SetCenter(true)
	UI:WaitShowDialogue("...........................")
	GAME:WaitFrames(20)
	GeneralFunctions.Shake(hero)
	GAME:WaitFrames(10)
	UI:SetCenter(false)
	GeneralFunctions.EmoteAndPause(hero, "Notice", true)
	GeneralFunctions.HeroDialogue(hero, "(Je ressens quelque chose...[pause=0] d'étrange.)", "Worried")
	GeneralFunctions.HeroDialogue(hero, "(Est-ce que c'est censé être comme ça pour l'évolution ?)", "Worried")
	GAME:WaitFrames(40)
	
	GeneralFunctions.HeroDialogue(hero, "(...Non.[pause=0] Ça ne peut pas être ça.[pause=0] J'ai déjà ressenti ça...[pause=0] Mais où ?)", "Worried")
	
	local zone = _DATA.DataIndices[RogueEssence.Data.DataManager.DataType.Zone]:Get("relic_forest")
	GAME:WaitFrames(40)
	SOUND:PlayBattleSE('EVT_Emote_Exclaim_Idea')
	GeneralFunctions.EmoteAndPause(hero, 'Exclaim', false)	
	GeneralFunctions.HeroDialogue(hero, "(Ah,[pause=10] c'est ça !)", "Surprised")
	GeneralFunctions.HeroDialogue(hero, "(Je l'ai ressenti dans " .. zone:GetColoredName() .. "![pause=0] Quand j'ai touché cette pierre !)", "Surprised")
	
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(Mais cette fois-ci, c'est différent.[pause=0] Ça me donne un peu la nausée,[pause=10] en fait.)", "Worried")
	GeneralFunctions.HeroDialogue(hero, "(...Est-ce qu'il y a un problème avec la source ?)", "Worried")
	
	GAME:WaitFrames(20)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Worried")
	SOUND:PlayBGM('In The Depths of the Pit.ogg', true)
	UI:WaitShowDialogue("Ça ne marche pas pour toi non plus,[pause=10] hein " .. hero:GetDisplayName() .. " ?")
	
	GAME:WaitFrames(20)
	GROUND:CharTurnToCharAnimated(hero, partner, 4)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("C'est un peu inquiétant que la source ne semble pas fonctionner...")
	UI:WaitShowDialogue("On devrait prévenir " .. CharacterEssentials.GetCharacterName("Noctowl") .. " quand on sera de retour.")
	
	GAME:WaitFrames(20)
	
	coro1 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(partner, numel, 4) end)
	coro2 = TASK:BranchCoroutine(function() GROUND:CharAnimateTurnTo(hero, Direction.Down, 4) end)
	
	TASK:JoinCoroutines({coro1, coro2})
	
	GROUND:CharTurnToCharAnimated(numel, partner, 4)
	
	UI:WaitShowDialogue(numel:GetDisplayName() .. ",[pause=10] tu es prêt à rentrer chez toi ?[pause=0] Ta pauvre maman s'inquiète pour toi !")
	
	
	GAME:WaitFrames(20)
	GeneralFunctions.EmoteAndPause(numel, "Exclaim", true)
	UI:SetSpeaker(numel)
	UI:SetSpeakerEmotion("Teary-Eyed")
	UI:WaitShowDialogue("Oh...[pause=0] Ma pauvre maman...[pause=0] Je l'ai probablement fait tellement s'inquiéter...")
	GAME:WaitFrames(20)
	--GeneralFunctions.ShakeHead(numel, 4, true)
	
	GAME:WaitFrames(20)
	GeneralFunctions.Hop(numel)
	UI:WaitShowDialogue("Oui ![pause=0] Ramène-moi chez moi ![pause=0] Je veux revoir maman !")
	

	GAME:WaitFrames(30)
	SOUND:FadeOutBGM(60)
	GAME:FadeOut(false, 60)	
	GAME:WaitFrames(90)
	SV.Chapter2.FinishedRiver = true 
	GAME:CutsceneMode(false)
	GAME:EnterGroundMap("guild_second_floor", "Main_Entrance_Marker")

	
end
	


return luminous_spring_ch_2