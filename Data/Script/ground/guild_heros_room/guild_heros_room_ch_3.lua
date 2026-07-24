require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'
require 'ground.guild_heros_room.guild_heros_room_helper'

guild_heros_room_ch_3 = {}



--show title card, then do a generic wakeup.
function guild_heros_room_ch_3.FirstMorning()
	GAME:FadeOut(false, 1)
	GAME:CutsceneMode(true)
	AI:DisableCharacterAI(CH('Teammate1'))
	UI:ResetSpeaker()
	SOUND:StopBGM()
	SV.Chapter3.ShowedTitleCard = true
	GAME:WaitFrames(60)
	local coro1 = TASK:BranchCoroutine(function() UI:WaitShowTitle("Chapter 3\n\nRivals\n", 20)
												  GAME:WaitFrames(180)
												  UI:WaitHideTitle(20) end)
	local coro2 = TASK:BranchCoroutine(function() UI:WaitShowBG("Chapter_3", 180, 20)
												  GAME:WaitFrames(180)
												  UI:WaitHideBG(20) end)
	TASK:JoinCoroutines({coro1, coro2})
	
	GAME:WaitFrames(120)
	guild_heros_room_helper.Morning(true)

end

--The scene before previewing the root
function guild_heros_room_ch_3.PostOutlawBedtalkFirstHalf()
	local hero = CH('PLAYER')
	local partner = CH('Teammate1')
	GAME:CutsceneMode(true)
	guild_heros_room_helper.Bedtime(false)
	UI:ResetSpeaker()
	GAME:FadeIn(40)
	
	local zone = _DATA.DataIndices[RogueEssence.Data.DataManager.DataType.Zone]:Get("relic_forest")

	SOUND:PlayBGM('Goodnight.ogg', true)
	GAME:WaitFrames(40)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("Je suis épuisé après cette journée.[pause=0] C'était bien plus que ce à quoi je m'attendais.")
	UI:WaitShowDialogue("J'arrive toujours pas à croire que notre première mission de hors-la-loi se soit transformée en combat contre une autre équipe d'aventuriers.")
	UI:WaitShowDialogue("C'est incroyable jusqu'où l'Équipe [color=#FFA5FF]Style[color] était prête à aller juste pour essayer de nous humilier.")

	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue("Je suis content qu'on ait réussi à battre l'Équipe [color=#FFA5FF]Style[color] et tout,[pause=10] mais j'arrive pas à me sortir de la tête le pauvre " .. CharacterEssentials.GetCharacterName("Sandile") .. ".")
	UI:WaitShowDialogue("Tu sais,[pause=10] quand on l'a confronté au début,[pause=10] j'étais plutôt nerveux.")
	UI:WaitShowDialogue("Je m'attendais à une confrontation avec un criminel dangereux !")
	UI:WaitShowDialogue("Mais en fait, il n'était pas si méchant que ça...[pause=0] Juste quelqu'un qui a fait un mauvais choix.")
	UI:WaitShowDialogue("Je sais que c'était notre travail,[pause=10] et je sais qu'il a volé l'écharpe qu'il portait...")
	UI:WaitShowDialogue("Mais je ne peux m'empêcher de me sentir mal de l'avoir arrêté.")
	UI:WaitShowDialogue("Faire notre travail était probablement la bonne chose à faire,[pause=10] mais...")
	
	GAME:WaitFrames(20)
	--GeneralFunctions.StartTremble(partner)
	UI:SetSpeakerEmotion("Teary-Eyed")
	UI:WaitShowDialogue("Le voir emmené par " .. CharacterEssentials.GetCharacterName("Bisharp") .. ",[pause=10] avec ce regard vaincu dans les yeux,[pause=10] ça m'a rendu tout triste...")
	UI:WaitShowDialogue("Ça aurait dû être ces voyous de l'Équipe [color=#FFA5FF]Style[color] qu'on emmenait,[pause=10] pas " .. CharacterEssentials.GetCharacterName("Sandile") .. "...")
	
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(" .. partner:GetDisplayName() .. "...)", "Sad")

	GAME:WaitFrames(20)
	--GeneralFunctions.StopTremble(partner)
	GeneralFunctions.ShakeHead(partner, 4)
	GAME:WaitFrames(20)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue("...J'ai pas vraiment envie d'y penser plus ce soir.[pause=0] On ferait mieux de dormir.")
	
	GAME:WaitFrames(40)
	SOUND:FadeOutBGM(60)
	GAME:FadeOut(false, 60)
	GAME:WaitFrames(120)
	GROUND:CharSetAnim(partner, "Laying", true)
	GROUND:CharSetAnim(hero, "Laying", true)
	GAME:FadeIn(60)

	GAME:WaitFrames(60)
	UI:SetSpeaker(partner:GetDisplayName(), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue(".........")
	UI:WaitShowDialogue("...T'es encore éveillé,[pause=10] " .. hero:GetDisplayName() .. " ?")
	
	GAME:WaitFrames(20)
	UI:WaitShowDialogue("J'arrive pas à dormir...[pause=0] J'arrête pas de repenser à ce qui s'est passé plus tôt.")
	UI:WaitShowDialogue("Peut-être que si je raconte une histoire, ça m'aidera à penser à autre chose.")
	
	local zone = _DATA.DataIndices[RogueEssence.Data.DataManager.DataType.Zone]:Get("relic_forest")
	GAME:WaitFrames(20)
	UI:WaitShowDialogue(CharacterEssentials.GetCharacterName("Relicanth") .. ",[pause=10] l'ancien de la ville qui vit dans l'étang au sud...")
	UI:WaitShowDialogue("Avec son âge,[pause=10] il connaît beaucoup l'histoire du monde,[pause=10] ainsi que plein de mythes et légendes.")
	UI:WaitShowDialogue("Quand il me surprenait en train d'essayer de me glisser dans " .. zone:GetColoredName() .. ",[pause=10] parfois il m'en racontait une.")
	UI:WaitShowDialogue("...Après m'avoir grondé pour avoir essayé de me glisser dans la forêt,[pause=10] bien sûr...")
	UI:WaitShowDialogue("Bref,[pause=10] une fois il m'a raconté la légende des Cœurs d'Âme.[pause=0] C'est mon histoire préférée !")
	
	GAME:WaitFrames(20)
	UI:SetSpeaker('', false, "", -1, "", RogueEssence.Data.Gender.Unknown)
	UI:WaitShowDialogue("(Hein ?[pause=0] Les Cœurs d'Âme ?)")
	
	GAME:WaitFrames(20)
	UI:SetSpeaker(partner:GetDisplayName(), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
	SOUND:PlayBGM('Anima Core.ogg', false)
	UI:WaitShowDialogue("Les Cœurs d'Âme sont des fragments mystiques,[pause=10] vivants, de quelque chose de plus grand qui existent dans des endroits cachés.")
	--cut here to a preview of the root
	GAME:WaitFrames(20)
	GAME:FadeOut(false, 40)
	GAME:EnterGroundMap('first_core_location', 'Main_Entrance_Marker', true)
end 


--After previewing root
function guild_heros_room_ch_3.PostOutlawBedtalkSecondHalf()
	local hero = CH('PLAYER')
	local partner = CH('Teammate1')
	GAME:CutsceneMode(true)
	guild_heros_room_helper.Bedtime(false, true)
	--SOUND:PlayBGM('Time Gear Remix.ogg', false)
	UI:SetSpeaker(partner:GetDisplayName(), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
	GROUND:CharSetAnim(partner, "Laying", true)
	GROUND:CharSetAnim(hero, "Laying", true)
	GAME:FadeIn(40)

	
	GAME:WaitFrames(40)
	UI:WaitShowDialogue("En tout cas,[pause=10] voilà comment la légende raconte les choses.[pause=0] Difficile de dire si les histoires de " ..  CharacterEssentials.GetCharacterName("Relicanth") .. " sont vraies ou fausses...")
	UI:WaitShowDialogue("Mais j'espère vraiment qu'elles le sont ![pause=0] Ce genre d'histoires fait partie des raisons pour lesquelles je suis devenu aventurier !")
	UI:WaitShowDialogue("Rien que d'y penser, les trucs mythiques comme ça me rendent tout excité !")
	UI:WaitShowDialogue("J'espère qu'un jour on pourra découvrir si ces histoires sont vraies !")
	UI:WaitShowDialogue("Si c'est le cas,[pause=10] on devrait faire tout ce qu'on peut pour protéger les Cœurs d'Âme pour qu'il ne leur arrive rien de mal.")
	
	GAME:WaitFrames(20)
	SOUND:FadeOutBGM(60)
	GAME:WaitFrames(60)
	UI:WaitShowDialogue(".........")
	UI:WaitShowDialogue("...Bâillement.[pause=0] Je commence à avoir sommeil.[pause=0] Je me sens mieux après avoir raconté cette histoire,[pause=10] d'ailleurs.")
	UI:WaitShowDialogue("Essayons de dormir.[pause=0] On aura besoin de toute notre énergie pour les aventures de demain.")


	GAME:WaitFrames(40)
	UI:WaitShowDialogue("Bonne nuit,[pause=10] " .. hero:GetDisplayName() .. ".")
	GAME:WaitFrames(40)
	GROUND:CharSetAnim(partner, "EventSleep", true)
	GAME:WaitFrames(40)
	GROUND:CharSetAnim(hero, "EventSleep", true)
	
	GAME:WaitFrames(180)
	SOUND:FadeOutBGM(120)
	GAME:FadeOut(false, 120)
	GAME:CutsceneMode(false)
	GAME:WaitFrames(120)
		
	GAME:EnterGroundMap('first_core_location', 'Main_Entrance_Marker')


end 

function guild_heros_room_ch_3.DemoThanks()
	UI:ResetSpeaker()
	UI:WaitShowDialogue("C'est la fin de la démo ! Merci beaucoup d'avoir joué !")
	UI:WaitShowDialogue("J'espère que vous avez apprécié la démo d'Halcyon ! D'autres chapitres arriveront bientôt !")
	UI:WaitShowDialogue("Remerciements particuliers à Audino pour toute son aide avec le moteur Origins.")
	UI:WaitShowDialogue("Sans son aide, Halcyon n'aurait jamais pu voir le jour !")
	UI:WaitShowDialogue("Je tiens également à remercier Trio- pour son aide avec les scripts de génération de missions et autres petites tâches de script.")
	UI:WaitShowDialogue("Il m'a fait gagner beaucoup de temps et m'a épargné bien des soucis avec toute l'aide qu'il a fournie.")
	UI:WaitShowDialogue("Merci de consulter le fichier readme pour la liste complète des crédits !")
	UI:WaitShowDialogue("Tous ceux qui ont participé ont fait du super travail, et je suis très reconnaissant de tout ce qu'ils ont accompli !")
	UI:WaitShowDialogue("Si vous avez des retours à partager, n'hésitez pas à le faire dans le canal Discord Halcyon approprié !")
	UI:WaitShowDialogue("Je suis impatient d'entendre ce que les gens pensent du jeu ou s'ils ont des suggestions ou des réflexions !")
	UI:WaitShowDialogue("Si vous souhaitez également contribuer à Halcyon, merci d'en informer Palika !")
	UI:WaitShowDialogue("J'aurais besoin de spriteurs et de musiciens pour m'aider avec les ressources personnalisées de temps en temps...")
	UI:WaitShowDialogue("Donc si ça vous intéresse et que vous êtes partant, faites-le moi savoir !")
	UI:WaitShowDialogue("Sinon, vous pouvez continuer à jouer à Halcyon pour terminer les missions générées aléatoirement si vous en avez envie.")
	UI:WaitShowDialogue("Rien ne peut faire progresser le jeu davantage pour le moment, car je dois développer plus d'histoire.")
	UI:WaitShowDialogue("Merci encore d'avoir joué ! Retour au gameplay normal... maintenant !")
end