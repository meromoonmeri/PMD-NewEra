```lua
require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

relic_forest_ch_1 = {}

-------------------------------
--Cutscene functions
-------------------------------
function relic_forest_ch_1.Intro_Cutscene()
	--First cutscene
	GAME:CutsceneMode(true)
	GROUND:Hide('Teammate1')
	UI:ResetSpeaker()
	SOUND:FadeOutBGM()
	
	local hero = CH('PLAYER')
	local marker = MRKR("WakeupLocation")
	GROUND:CharSetAnim(hero, 'Laying', true)
	GROUND:TeleportTo(hero, marker.Position.X, marker.Position.Y, Direction.Right)
	
	--set auto finish has it so the voiceover fades in and out as the complete line
	--rather than typing it out like in the personality quiz
	UI:SetAutoFinish(true)

	--chapter 1 title card
	local coro1 = TASK:BranchCoroutine(function() UI:WaitShowTitle("Chapitre 1\\
\\
Un Nouveau Début\\
", 20)
												  GAME:WaitFrames(180)
												  UI:WaitHideTitle(20) end)
	local coro2 = TASK:BranchCoroutine(function() UI:WaitShowBG("Chapter_1", 180, 20)
												  GAME:WaitFrames(180)
												  UI:WaitHideBG(20) end)
	TASK:JoinCoroutines({coro1, coro2})
	
	GAME:WaitFrames(180)
	
	
  	UI:WaitShowVoiceOver(".........", -1)  
  	UI:WaitShowVoiceOver("...Les yeux fermés pour rêver de royaumes fantastiques...", -1)  
	UI:WaitShowVoiceOver("...Les yeux ouverts pour faire face à la réalité crue...", -1)  
	UI:WaitShowVoiceOver("...Mondes différents, pourtant liés.", -1)  
	UI:WaitShowVoiceOver(".........", -1)  
	UI:WaitShowVoiceOver("Où cela vous place-t-il ?", -1) 
	
	UI:SetAutoFinish(false)
	
	GAME:WaitFrames(120)
	
	GAME:FadeIn(120)
	GAME:WaitFrames(120)
	UI:ResetSpeaker()
	UI:SetSpeaker('', false, hero.CurrentForm.Species, hero.CurrentForm.Form, hero.CurrentForm.Skin, hero.CurrentForm.Gender)
	UI:SetSpeakerEmotion('Pain')
	UI:WaitShowDialogue("...[pause=0] Non...[pause=0] Je ne peux pas rester éveillé...")
	GAME:WaitFrames(60)
	GAME:FadeOut(false, 120)
	
	SV.Chapter1.PlayedIntroCutscene = true
	GAME:CutsceneMode(false)
	GAME:EnterGroundMap("metano_town", "Main_Entrance_Marker")
	
	
	
end


function relic_forest_ch_1.PartnerFindsHeroCutscene()
--[color=#FFFF00]Riolu[color]
--[color=#00FFFF]Erleuchtet[color]

	--clear party, set up party with hero as player and partner as partner
	GeneralFunctions.DefaultParty(true)
	--[[
	local h = GAME:GetPlayerAssemblyMember(0)
	local p = GAME:GetPlayerPartyMember(0)
	GAME:RemovePlayerAssembly(0)
	GAME:RemovePlayerTeam(0)
	
	GAME:AddPlayerTeam(h)
	GAME:AddPlayerTeam(p)
	GAME:SetTeamLeaderIndex(0)	
	
	--spawn partner in manually, this is a special case because of party shenanigans
	COMMON.RespawnAllies()
	]]--
  
	
	local hero = CH('PLAYER')
	local partner = CH('Teammate1')
	local marker = MRKR("WakeupLocation")
	GROUND:CharSetAnim(hero, 'Laying', true)
	GROUND:TeleportTo(hero, marker.Position.X, marker.Position.Y, Direction.Right)

	SOUND:StopBGM()
	GAME:CutsceneMode(true)
	AI:DisableCharacterAI(partner)
	UI:ResetSpeaker()
	GAME:MoveCamera(300, 536, 1, false)
	GROUND:TeleportTo(partner, 292, 616, Direction.Up)
	UI:WaitShowTitle(GAME:GetCurrentGround().Name:ToLocal(), 20)
	GAME:WaitFrames(60)
	UI:WaitHideTitle(20)
	GAME:FadeIn(40)
	SOUND:PlayBGM('In The Depths of the Pit.ogg', true)

	
	--walk into frame from the bottom 
	GeneralFunctions.MoveCharAndCamera(partner, 292, 528, false, 1)
	GAME:WaitFrames(20)
	GeneralFunctions.LookAround(partner, 2, 4, false, false, false, Direction.Up)
	GAME:WaitFrames(10)
	
	--celebrate that you made it through 
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("J'y suis depuis un moment...[pause=0] Il semble que j'ai atteint la partie la plus profonde de la forêt.")
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Je ne comprendrai jamais pourquoi " .. CharacterEssentials.GetCharacterName("Relicanth") .. " trouve la forêt si dangereuse.")
	GAME:WaitFrames(40)
	UI:WaitShowDialogue("Je suis déjà venu ici à maintes reprises,[pause=10] mais...")
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue("Je ne peux m'empêcher d'être heureux à chaque fois que j'arrive jusqu'ici.")
	SOUND:PlayBattleSE('EVT_Emote_Startled_2')
	GeneralFunctions.DoubleHop(partner)
	GROUND:CharSetEmote(partner, "glowing", 0)
	UI:WaitShowDialogue("Mon propre petit succès d'aventurier !")
	GAME:WaitFrames(20)
	GROUND:CharSetEmote(partner, "", 0)
	GAME:WaitFrames(20)

	
	--look around a bit 
	GeneralFunctions.LookAround(partner, 2, 4, false, true, false, Direction.Up)
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion('Normal')
	UI:WaitShowDialogue("C'est le moment d'aller voir mon porte-bonheur puisque j'y suis.")
	GAME:WaitFrames(20)

	--huh? something's over there?
	GeneralFunctions.MoveCharAndCamera(partner, 292, 408, false, 1)
	GeneralFunctions.LookAround(partner, 3, 4, false, false, true, Direction.UpLeft)
	SOUND:PlayBattleSE('EVT_Emote_Exclaim')
	GROUND:CharSetEmote(partner, "notice", 1)
	GAME:WaitFrames(20)
	SOUND:FadeOutBGM(120)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("Huh ?[pause=0] Qu'est-ce que c'est par là ?")
	GeneralFunctions.MoveCharAndCamera(partner, 292, 360, false, 1)
	GROUND:CharAnimateTurnTo(partner, Direction.UpLeft, 4)
	
	--"Waah! Someone has collapsed on the sand!" 
	--SOUND:PlayBattleSE('EVT_Emote_Startled')
	--GROUND:CharSetAnim(partner, 'Hurt', true)
	--GROUND:CharSetEmote(partner, "shock", 1)
	GeneralFunctions.Recoil(partner)
	GAME:WaitFrames(20)
	GROUND:CharSetAnim(partner, 'None', true)
	
	UI:SetSpeakerEmotion("Surprised")
	UI:WaitShowDialogue("Waah ![pause=0] Quelqu'un s'est évanoui dans l'herbe !")
	GeneralFunctions.MoveCharAndCamera(partner, 292, 272, true, 4)
	GeneralFunctions.MoveCharAndCamera(partner, 268, 272, true, 4)
	
	GAME:WaitFrames(10)
	GeneralFunctions.Hop(partner)
	UI:WaitShowDialogue("H-hey ![pause=0] Qu'est-ce qui s'est passé ?[pause=0] Tu vas bien !?")
	GAME:WaitFrames(80)
	
	--step in and out twice, facing forward the entire time
	UI:WaitShowDialogue("Oh non,[pause=10] s'il te plaît,[pause=10] sois okay !")
	GROUND:MoveInDirection(partner, Direction.Left, 4, false, 2)
	GROUND:AnimateInDirection(partner, "Walk", Direction.Left, Direction.Right, 4, 1, 2)
	GAME:WaitFrames(10)
	GROUND:MoveInDirection(partner, Direction.Left, 4, false, 2)
	GROUND:AnimateInDirection(partner, "Walk", Direction.Left, Direction.Right, 4, 1, 2)
	
	--wakeup
	GAME:WaitFrames(40)
	GeneralFunctions.Shake(hero)
	GAME:WaitFrames(30)
	UI:SetSpeaker(hero)
	GeneralFunctions.HeroDialogue(hero, "(...)", "Pain")
	GROUND:CharSetAnim(hero, 'Wake', false)
	GAME:WaitFrames(40)
	GROUND:CharSetAnim(hero, 'None', true)
	GAME:WaitFrames(20)
	GROUND:CharSetEmote(partner, "exclaim", 1)
	SOUND:PlayBattleSE("EVT_Emote_Exclaim")
	GAME:WaitFrames(40)
	GROUND:AnimateInDirection(partner, "Walk", Direction.Left, Direction.Right, 8, 1, 1)
	
	GeneralFunctions.LookAround(hero, 4, 4, true, true, false, Direction.Right)
	GAME:WaitFrames(40)
	
	--partner is relieved you arent dead
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Sigh")
	UI:WaitShowDialogue("Phew ![pause=0] Tu ne réagissais pas.[pause=0] Tu m'as fait peur un moment !")
		
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue("Eh bien,[pause=10] je suis content de voir que tu vas bien.[pause=0] Je m'appelle " .. partner:GetDisplayName() .." !")
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Comment as-tu fini par être ici, de toute façon ?[pause=0] Personne n'est vraiment censé être par ici.")
	
	--amnesia
	local hero_species = _DATA:GetMonster(hero.CurrentForm.Species):GetColoredName()
	local partner_species = _DATA:GetMonster(partner.CurrentForm.Species):GetColoredName()
	GAME:WaitFrames(20)
	GeneralFunctions.HeroSpeak(hero, 60)
	GAME:WaitFrames(20)
	GeneralFunctions.Recoil(partner)
	UI:SetSpeakerEmotion("Surprised")
	UI:WaitShowDialogue("Huh ?[pause=0] Tu ne sais pas comment tu es arrivé ici ?")
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("C'est inquiétant...[pause=0] Comment un " .. hero_species .. " pourrait se réveiller ici sans aucun souvenir ?")
	
	--hero realizes they are a pokemon, pinches themselves to see if they are dreaming
	GAME:WaitFrames(20)
	GROUND:CharSetEmote(hero, "question", 1)
	SOUND:PlayBattleSE("EVT_Emote_Confused")
	GAME:WaitFrames(40)
	GeneralFunctions.LookAround(hero, 3, 4, false, false, false, Direction.Right)
	GAME:WaitFrames(40)
	GROUND:CharSetEmote(hero, "shock", 1)
	SOUND:PlayBattleSE("EVT_Emote_Shock")
	GAME:WaitFrames(40)
	GeneralFunctions.HeroDialogue(hero, "(Wh-quoi ![pause=0] Je suis un " .. hero_species .. " !)", "Surprised")
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(Cela doit être un rêve ![pause=0] Il n'y a aucun moyen que je sois vraiment devenu un " .. hero_species .. " !)", "Surprised")
	GeneralFunctions.HeroDialogue(hero, "(Je vais juste me pincer tout de suite et je vais me réveiller !)", "Surprised")
	GAME:WaitFrames(20)
	GROUND:CharSetEmote(hero, "shock", 1)
	SOUND:PlayBattleSE("DUN_Bounced")--pinch sfx
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(Aïe !)", "Pain")
	GAME:WaitFrames(40)
	GeneralFunctions.HeroDialogue(hero, "(Je suis toujours là ?[pause=0] C'est réel !?)", "Surprised")
	GAME:WaitFrames(10)
	SOUND:PlayBattleSE('EVT_Emote_Sweating')
	GROUND:CharSetEmote(hero, "sweating", 1)
```
```lua
	GAME:WaitFrames(40)
	GeneralFunctions.HeroDialogue(hero, "(Je n'en reviens pas...[pause=0] Je suis vraiment un " .. hero_species .. "...)", "Worried")--at some point, should comment on how being a Pokémon is actually sick, just initially shocked and overwhelmed which is why they reacted like this
	GeneralFunctions.HeroDialogue(hero, "(Mais comment cela a-t-il pu se produire ?[pause=0] Je ne me souviens de rien...)", "Worried")
	GAME:WaitFrames(40)
```
	GeneralFunctions.HeroSpeak(hero, 60)
	GAME:WaitFrames(20)
	
	--human? this a joke?
	GAME:WaitFrames(20)
	GROUND:CharSetEmote(partner, "question", 1)
	SOUND:PlayBattleSE("EVT_Emote_Confused")
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Surprised")
	GAME:WaitFrames(40)
	--maybe add a hop at the end of the dialogue
	UI:WaitShowDialogue("Huh ?[pause=0] Tu dis être un humain ?")
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Tu essaies de me faire croire une histoire ?[pause=0] Je pensais que les humains n'étaient qu'un mythe...")
	UI:WaitShowDialogue("En plus,[pause=10] tu as l'air d'un " ..  hero_species .. " à mes yeux...")
	
	
	GROUND:CharSetEmote(hero, "exclaim", 1)
	SOUND:PlayBattleSE("EVT_Emote_Exclaim_2")
	GAME:WaitFrames(20)
	GeneralFunctions.ShakeHead(hero, 4, true)
	
	local zone = _DATA.DataIndices[RogueEssence.Data.DataManager.DataType.Zone]:Get("relic_forest")
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Tu persistes à dire que tu es un humain,[pause=10] hein ?")
	UI:WaitShowDialogue("J'ai du mal à croire qu'un humain puisse se transformer en Pokémon...")
	GAME:WaitFrames(20)
	
	
	SOUND:PlayBattleSE('EVT_Emote_Sweating')
	GROUND:CharSetEmote(hero, "sweating", 1)
	GAME:WaitFrames(40)
	GeneralFunctions.HeroDialogue(hero, "(Est-ce si difficile de faire confiance au fait que j'étais humain ?)", "Sad")
	GAME:WaitFrames(60)
	GeneralFunctions.HeroDialogue(hero, "(Ce " .. partner_species .. " ne me croit pas...[pause=0] Est-ce que quelqu'un d'autre le croirait ?)", "Worried")
	GeneralFunctions.HeroDialogue(hero, "(Je ne me souviens de rien...[pause=0] Que vais-je faire ?)", "Worried")


	--partner realizes you're scared and lost
	GAME:WaitFrames(40)
	SOUND:PlayBattleSE('EVT_Emote_Exclaim')
	GROUND:CharSetEmote(partner, "notice", 1)
	GAME:WaitFrames(20)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("(Hmm...[pause=0] " .. GeneralFunctions.GetPronoun(hero, 'they', true) .. " " .. GeneralFunctions.Conjugate(hero, 'look') .. " abasourdi,[pause=10] en fait...[pause=0] Peut-être que " .. GeneralFunctions.GetPronoun(hero, "they're", false) .. " dit la vérité après tout ?)")
	UI:WaitShowDialogue("(" .. GeneralFunctions.GetPronoun(hero, 'they', true) .. " s'est même pincé " .. GeneralFunctions.GetPronoun(hero, 'themself') .. " comme si " .. GeneralFunctions.GetPronoun(hero, 'they') .. " " .. GeneralFunctions.GetPronoun(hero, "were") .. " en train de se réveiller ou un truc du genre...)")
	UI:WaitShowDialogue("(...Il n'y a aucune raison pour que quelqu'un mente à propos de ça,[pause=10] n'est-ce pas ?)")
	GAME:WaitFrames(40)
	
	--ok i believe you kinda 
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("Hé...[pause=0] Euh...[pause=0] J'ai un peu réfléchi et...")
	UI:WaitShowDialogue("Je pense que peut-être tu ne mens pas après tout.[pause=0] Ta réaction semble sincère.")
	UI:WaitShowDialogue("Personne ne resterait inconscient dans un donjon mystère en prétendant ce que tu prétends juste pour plaisanter.")
	UI:WaitShowDialogue("Même si ton histoire n'est pas tout à fait vraie...")
	UI:WaitShowDialogue("Je pense que tu es au moins honnête.[pause=0] Quelque chose d'étrange t'est certainement arrivé.")
	GAME:WaitFrames(20)

	--name yourself	
	UI:SetSpeakerEmotion("Worried")
	GAME:WaitFrames(40)
	UI:WaitShowDialogue("Mais...[pause=0] Tu es sûr de ne te souvenir de rien du tout ?[pause=0] Peut-être un nom ?")
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(...Je ne pense même pas me souvenir d'une chose aussi simple que ça...)", "Sad")
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(Je pourrais juste choisir quelque chose que j'aimerais qu'on m'appelle,[pause=10] je suppose.)", "Normal")
	GAME:WaitFrames(20)
	UI:ResetSpeaker()
	local yesnoResult = false
	while not yesnoResult do
		UI:NameMenu("Quel sera ton nom ?", "", 60)
		UI:WaitForChoice()
		result = UI:ChoiceResult()
		GAME:SetCharacterNickname(GAME:GetPlayerPartyMember(0), result)
		UI:ChoiceMenuYesNo("Est-ce que " .. hero:GetDisplayName() .. " est correct ?")
		UI:WaitForChoice()
		yesnoResult = UI:ChoiceResult()
	end

	GAME:WaitFrames(20)
	GeneralFunctions.HeroSpeak(hero, 60)
	GAME:WaitFrames(20)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("Je vois.[pause=0] Donc " .. hero:GetDisplayName() .. " est ton nom.")
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue("Ravi de faire ta connaissance,[pause=10] " .. hero:GetDisplayName() .. " !")
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("Je suis désolé d'avoir été méfiant avant.[pause=0] C'est juste dur à croire qu'un humain puisse se transformer en Pokémon.")
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue("Même si tu n'étais pas un humain,[pause=10] tu penses en avoir été un, et ça me suffit.")
	
	
	
	--will you come with me back to metano town?
	GAME:WaitFrames(20)
	GeneralFunctions.LookAround(partner, 2, 4, false, false, false, Direction.Left)
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Mais euh...[pause=0] Il se fait tard...")
	--GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("Je pense que tu devrais venir avec moi jusqu'à la ville proche.")
	UI:WaitShowDialogue("Tu as perdu la mémoire et tu as été transformé en Pokémon pour une raison ou une autre...")
	UI:WaitShowDialogue("Ce ne serait pas bien de te laisser tout seul après tout ce que tu m'as dit.")
	UI:BeginChoiceMenu("Alors,[pause=10] qu'en dis-tu ?[pause=0] Viens-tu avec moi ?", {"Aller avec " .. GeneralFunctions.GetPronoun(partner, 'them'), "Refuser"}, 1, 2)
	UI:WaitForChoice()
	local result = UI:ChoiceResult()	
	--if you say no, loop a dialogue until you say yes
	while result == 2 do 
		GAME:WaitFrames(20)
		GeneralFunctions.Recoil(partner)
		GROUND:CharSetAnim(partner, 'None', true)
		UI:SetSpeakerEmotion("Surprised")
		UI:WaitShowDialogue("Quoi !?")
		SOUND:PlayBattleSE('EVT_Emote_Sweating')
		GROUND:CharSetEmote(partner, "sweating", 1)
		GAME:WaitFrames(40)
		UI:SetSpeakerEmotion("Worried")
		UI:WaitShowDialogue(hero:GetDisplayName() .. "...")
		UI:WaitShowDialogue("Tu as perdu la mémoire et tu as été transformé en Pokémon...")
		UI:WaitShowDialogue("Où irais-tu ailleurs ?[pause=0] Qu'est-ce que tu ferais ?")
		GAME:WaitFrames(20)
		UI:SetSpeakerEmotion("Sad")
		UI:WaitShowDialogue("Je ne peux pas te laisser dehors en toute bonne conscience...")
		UI:BeginChoiceMenu("Alors s'il te plaît...[pause=0] Viens-tu avec moi ?", {"Aller avec " ..  GeneralFunctions.GetPronoun(partner, 'them'), "Refuser"}, 1, 2)
		UI:WaitForChoice()
		result = UI:ChoiceResult()	
	end
	
	--player agrees
	GAME:WaitFrames(40)
	GeneralFunctions.HeroDialogue(hero, "(Je n'ai pas vraiment le choix ici...)", "Worried")
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, ("Mais " .. partner:GetDisplayName() .. " semble gentil.[pause=0] Rester avec " ..  GeneralFunctions.GetPronoun(partner, 'them') .. " pour l'instant semble être une bonne idée."), "Normal")
	GeneralFunctions.HeroDialogue(hero, ("De plus...[pause=0] J'ai une étrange bonne impression à propos de " .. partner:GetDisplayName() .. "."), "Normal")
	GAME:WaitFrames(20)
	GeneralFunctions.DoAnimation(hero, 'Nod')
	GAME:WaitFrames(20)
	
	--hooray we'll have to go thru the dungeon though
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue("Super ![pause=0] Je suis content que tu acceptes !")
	UI:SetSpeakerEmotion("Worried")
	GROUND:CharAnimateTurnTo(partner, Direction.Down, 4)
	GAME:WaitFrames(16)
	UI:WaitShowDialogue("Nous devrons traverser le donjon mystère pour y arriver.")
	GROUND:CharAnimateTurnTo(partner, Direction.Left, 4)
	GAME:WaitFrames(16)
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue("J'ai réussi à venir ici seul,[pause=10] donc tant que nous travaillons ensemble, ce sera facile de revenir !")

	--lets look around before leaving
	GAME:WaitFrames(20)
	GROUND:CharAnimateTurnTo(partner, Direction.Up, 4)
	GAME:WaitFrames(40)
	GROUND:CharAnimateTurnTo(partner, Direction.Left, 4)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("Avant de partir,[pause=10] pourrais-tu regarder quelque chose avec moi un instant ?")
	UI:WaitShowDialogue("Je veux te montrer quelque chose de cool.")
	GAME:WaitFrames(20)
	

	coro1 = TASK:BranchCoroutine(function() GeneralFunctions.MoveCharAndCamera(partner, 293, 247, false, 1)
											GeneralFunctions.MoveCharAndCamera(partner, 293, 218, false, 1) end)
	GAME:WaitFrames(40)
	GeneralFunctions.EightWayMove(hero, 270, 236, false, 1)
	GROUND:CharAnimateTurnTo(hero, Direction.UpRight, 4)
	TASK:JoinCoroutines({coro1})
	GAME:WaitFrames(20)
	
	--wow a stone tablet
	GeneralFunctions.EmoteAndPause(hero, "Question", true)
	GeneralFunctions.HeroDialogue(hero, "(Huh ?[pause=0] Il y a un obélisque de pierre par ici.)", "Normal")
	
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion('Normal')
	GROUND:CharTurnToCharAnimated(partner, hero, 4)
	UI:WaitShowDialogue("J'ai exploré ici de nombreuses fois,[pause=10] mais ce stèle m'a toujours intrigué.")
	GROUND:CharAnimateTurnTo(partner, Direction.Up, 4)
	UI:WaitShowDialogue("Si tu regardes de près,[pause=10] tu peux voir qu'il y a une sorte d'écriture ancienne gravée dessus.")
	GROUND:CharAnimateTurnTo(hero, Direction.UpRight, 4)

	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion('Normal')
	GROUND:CharAnimateTurnTo(partner, Direction.DownLeft, 4)
	UI:WaitShowDialogue("C'est le seul endroit où j'ai jamais vu des lettres comme ça !")
	UI:SetSpeakerEmotion('Worried')
	UI:WaitShowDialogue("Mais...[pause=0] Je n'ai aucune idée de ce que ces lettres ou cet écriture signifient...")
	
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion('Inspired')
	GeneralFunctions.Hop(partner)
	GROUND:CharSetEmote(partner, "happy", 0)
	UI:WaitShowDialogue("C'est incroyable, n'est-ce pas ?[br]Il doit y avoir une histoire importante derrière cette stèle et son écriture !")
	UI:WaitShowDialogue("Les choses comme ça m' fascinent tellement !")
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Normal")
	GROUND:CharSetEmote(partner, "", 0)
	UI:WaitShowDialogue('Bref,[pause=10] quand je viens ici, je touche toujours la pierre pour avoir de la chance.')
	GAME:WaitFrames(20)
	
	
	--touch the tablet
	GROUND:CharAnimateTurnTo(partner, Direction.Up, 4)
	GROUND:MoveToPosition(partner, 293, 210, false, 1)	
	GAME:WaitFrames(20)
	GROUND:CharSetAction(partner, RogueEssence.Ground.PoseGroundAction(partner.Position, partner.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Pose")))
	GAME:WaitFrames(40)

	GeneralFunctions.Monologue(partner:GetDisplayName() .. " a frotté la stèle de pierre ancienne.")
	UI:SetSpeaker(partner)
	GAME:WaitFrames(40)
	GROUND:CharSetAnim(partner, 'None', true)
	GROUND:AnimateToPosition(partner, "Walk", Direction.Up, 293, 218, 1, 1, 0)
	GAME:WaitFrames(20)
	GROUND:CharAnimateTurnTo(partner, Direction.DownLeft, 4)
	
	--ask hero to try
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("Tu devrais aussi la toucher pour avoir de la chance,[pause=10] " .. hero:GetDisplayName() .. " !")
	
	--partner moves out of way, hero tries looking and touching
	coro1 = TASK:BranchCoroutine(function() GROUND:AnimateToPosition(partner, "Walk", Direction.Left, 317, 218, 1, 1, 0) end)
	GAME:WaitFrames(32)
	GROUND:MoveToPosition(hero, 293, 218, false, 1)	
	TASK:JoinCoroutines({coro1})
	GROUND:CharAnimateTurnTo(hero, Direction.Up, 4)
	GAME:WaitFrames(20)
	--sense a vague connection with the tablet

	GeneralFunctions.HeroDialogue(hero, ("(" .. partner:GetDisplayName() .. " a raison.[pause=0] Il y a une écriture étrange sur la stèle.)"), "Normal")
	GeneralFunctions.HeroDialogue(hero, "(Je vais aussi lui toucher pour avoir de la chance alors.)", "Normal")
	GROUND:MoveToPosition(hero, 293, 210, false, 1)	
	GAME:WaitFrames(20)
	GROUND:CharSetAction(hero, RogueEssence.Ground.PoseGroundAction(hero.Position, hero.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Pose")))
	
	GAME:WaitFrames(40)
	GeneralFunctions.Monologue(hero:GetDisplayName() .. " a frotté la stèle de pierre ancienne.")
```
Here is the translated Lua code with all English dialogue strings converted to French, following all your specified rules:

	GAME:WaitFrames(20)
	GROUND:CharSetEmote(hero, "notice", 1)
	SOUND:PlayBattleSE("EVT_Emote_Exclaim")
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(Rien ne semble d'inhabituel ici,[pause=10] mais...)", "Worried")
	GeneralFunctions.HeroDialogue(hero, "(Il y a quelque chose d'étrange à propos de cette tablette...[pause=30] cela me met mal à l'aise.)", "Worried")
	GeneralFunctions.HeroDialogue(hero, "(Mais pourquoi ?[pause=0] Il ne semble y avoir rien de spécial à propos de cette tablette...)", "Worried")
	GAME:WaitFrames(20)

	GROUND:CharSetAnim(hero, 'None', true)
	GROUND:AnimateToPosition(hero, "Walk", Direction.Up, 293, 218, 1, 1, 0)
	GAME:WaitFrames(20)
	GROUND:CharAnimateTurnTo(hero, Direction.Right, 4)
	GAME:WaitFrames(16)
	GeneralFunctions.HeroSpeak(hero, 60)

	--couldnt really learn anything meaningful from touching the tablet.
	GAME:WaitFrames(20)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Quand tu as touché la tablette,[pause=10] tu as eu une sorte de sensation étrange ?")
	GAME:WaitFrames(20)
	--UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("C'est bizarre...[pause=0] Mais si tu n'en sais rien,[pause=10] on ne peut pas savoir si cette sensation a une importance.")
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("C'est quelque chose à garder en tête,[pause=10] je suppose.[pause=0] Dommage que l'on en sache pas plus sur cette tablette...")
	GAME:WaitFrames(20)
	
	--nothing else is nearby. Let's leave.
	GeneralFunctions.LookAround(partner, 4, 4, true, false, false, Direction.Left)
	GAME:WaitFrames(20)
	UI:WaitShowDialogue("Je pense qu'il est temps de retourner vers le village.")
	UI:WaitShowDialogue("Si on reste ensemble,[pause=10] on devrait pouvoir traverser le donjon mystère sans encombres.")
	GAME:WaitFrames(20)
	UI:WaitShowDialogue("D'accord ![pause=0] Mettons-nous en route !")
	GAME:WaitFrames(20)

	--leave together, 
	coro1 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(partner, 317, 298, false, 1) end)
	local coro2 = TASK:BranchCoroutine(function() GeneralFunctions.WaitThenMove(hero, 293, 298, false, 1, 20) end)
	GAME:WaitFrames(40)
	GAME:FadeOut(false, 40)
	TASK:JoinCoroutines({coro1, coro2})	

	SV.Chapter1.PartnerMetHero = true
	--set team name temporarily to hero and partners name
	GAME:SetTeamName(hero.Nickname .. " et " .. partner.Nickname)
	GAME:CutsceneMode(false)

	--relic forest dungeon round 2
	GAME:EnterDungeon("relic_forest", 0, 4, 0, RogueEssence.Data.GameProgress.DungeonStakes.Risk, true, true)

end

--the duo wiped trying to make it back to town
function relic_forest_ch_1.WipedInForest()
	--reset party
	--GeneralFunctions.DefaultParty(true, false)
	local hero = CH('PLAYER')
	local partner = CH('Teammate1')
	GAME:CutsceneMode(true)
	AI:DisableCharacterAI(partner)
	UI:ResetSpeaker()
	GAME:MoveCamera(294, 520, 1, false)
	GROUND:TeleportTo(hero, 276, 512, Direction.Down)
	GROUND:TeleportTo(partner, 308, 512, Direction.Down)
	GROUND:CharSetAnim(partner, 'EventSleep', true)
	GROUND:CharSetAnim(hero, 'EventSleep', true)

	GAME:FadeIn(40)
	
	GAME:WaitFrames(120)
	local coro1 = TASK:BranchCoroutine(function () GeneralFunctions.DoAnimation(hero, 'Wake') end)
	local coro2 = TASK:BranchCoroutine(function () GeneralFunctions.DoAnimation(partner, 'Wake') end)
	TASK:JoinCoroutines({coro1, coro2})
	
	coro1 = TASK:BranchCoroutine(function () GROUND:CharAnimateTurnTo(hero, Direction.Down, 4) end)
	coro2 = TASK:BranchCoroutine(function () GROUND:CharAnimateTurnTo(partner, Direction.Down, 4) end)
	TASK:JoinCoroutines({coro1, coro2})
	
	GAME:WaitFrames(20)
	
	coro1 = TASK:BranchCoroutine(function () GeneralFunctions.LookAround(hero, 2, 4, false, false, false, Direction.Right) end)
	coro2 = TASK:BranchCoroutine(function () GAME:WaitFrames(10) GeneralFunctions.LookAround(partner, 2, 4, false, false, false, Direction.Left) end)
	TASK:JoinCoroutines({coro1, coro2})
	
	GAME:WaitFrames(20)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion('Pain')
	GeneralFunctions.EmoteAndPause(partner, 'Sweating', true)	
	UI:WaitShowDialogue('Aïe...[pause=0] C'était plus difficile que je ne le pensais...')
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion('Normal')
	UI:WaitShowDialogue('Tu vas bien,[pause=10] ' .. hero:GetDisplayName() .. ' ?')
	
	GAME:WaitFrames(10)
	GeneralFunctions.DoAnimation(hero, 'Nod')
	GAME:WaitFrames(20)

	UI:WaitShowDialogue("Je suppose que si l'un de nous deux est mis K.O.,[pause=10] l'autre ne peut pas continuer...")
	--UI:WaitShowDialogue("Je me demande pourquoi c'est le cas...")
	
	GAME:WaitFrames(20)
	GROUND:CharAnimateTurnTo(partner, Direction.Down, 4)
	GAME:WaitFrames(40)
	GROUND:CharTurnToCharAnimated(partner, hero, 4)
	UI:WaitShowDialogue("Bon,[pause=10] on ne peut pas trainer ici.[pause=0] Il faut retourner au village avant que la soirée n'advienne davantage.")
	UI:WaitShowDialogue("Essayons à nouveau,[pause=10] " .. hero:GetDisplayName() .. "![script=0]", {function() return GeneralFunctions.Hop(partner) end})
	GAME:WaitFrames(20)

	coro1 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(partner, 308, 612, false, 1) end)
	coro2 = TASK:BranchCoroutine(function() GeneralFunctions.WaitThenMove(hero, 276, 612, false, 1, 20) end)
	GAME:WaitFrames(60)
	SOUND:FadeOutBGM()
	GAME:FadeOut(false, 40)
	TASK:JoinCoroutines({coro1, coro2})	
	
	GAME:CutsceneMode(false)

	--relic forest dungeon round 2
	GAME:EnterDungeon("relic_forest", 0, 4, 0, RogueEssence.Data.GameProgress.DungeonStakes.Risk, true, true)
end