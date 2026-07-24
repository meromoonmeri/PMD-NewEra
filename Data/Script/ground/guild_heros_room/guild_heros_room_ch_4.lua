require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'
require 'ground.guild_heros_room.guild_heros_room_helper'

guild_heros_room_ch_4 = {}


function guild_heros_room_ch_4.ShowTitleCard()
	GAME:FadeOut(false, 1)
	GAME:CutsceneMode(true)
	AI:DisableCharacterAI(CH('Teammate1'))
	UI:ResetSpeaker()
	SOUND:StopBGM()
	GAME:WaitFrames(60)
	local coro1 = TASK:BranchCoroutine(function() UI:WaitShowTitle("Chapter 4\n\nA Real Adventure\n", 20)
												  GAME:WaitFrames(180)
												  UI:WaitHideTitle(20) end)
	local coro2 = TASK:BranchCoroutine(function() UI:WaitShowBG("Chapter_4", 180, 20)
												  GAME:WaitFrames(180)
												  UI:WaitHideBG(20) end)
	TASK:JoinCoroutines({coro1, coro2})
	
	GAME:WaitFrames(60)
	SV.Chapter4.ShowedTitleCard = true
	guild_heros_room_helper.Morning(true)
end

function guild_heros_room_ch_4.PostGroveBedtalk()
	local hero = CH('PLAYER')
	local partner = CH('Teammate1')
	GAME:CutsceneMode(true)
	guild_heros_room_helper.Bedtime(false)
	UI:ResetSpeaker()
	GAME:FadeIn(40)
	
	local zone = _DATA.DataIndices[RogueEssence.Data.DataManager.DataType.Zone]:Get("relic_forest")

	--partner is excited about the day.
	--getting to explore a new place, getting the apricorn, actually being able to keep it.
	--even met new teammates that helped get the treasure
	--so happy with how things have been turning out, hopes the player is enjoying themselves too
	--excitement for the expedition on top of all this
	---thanks the player for forming the team.
	--hero is happy to be apart of the team as well. happy partner isnt thinking about thwait Really enjoying life as a pokemon
	--partner is reminded... has hero remembered anything else that's important?
	--no. nothing new remembered or realized.
	--dang, unfortunate... any more meaning to the strange feelings?
	--hero thinks it over, hasn't really figured anything else out yet.
	--come to think of it... i felt a bit strange hearing the expedition announcement.
	--actually, i felt strange joining the guild and meeting the partner too!
	--it's a different kind of strangeness, but there's no other way to put it really than "strange".
	--What could it all mean. Tells the partner
	--wow, really! That's weird...
	--Is there some sort of connection? Or do you just feel that way because you're a Pokemon now, or because you just felt happy?
	--Hard to say. Could just be excitement after all. After this expedition, we should see if we can do anything to learn more about your past.
	--it's getting late... Good night, player.

--[[Wow today was great im having so much fun and im so happy about things rn i hope u are too
Yes me human me enjoy pokemon world this is awesome. also im happy that ur happy
partner really doesnt need to thank the player for forming the team i think its unneeded on further thought and copies the original too hard
partner's joy fades a bit and they change topics to players amnesia
has the player remembered anything else, anything else about the strange feelings?
player notes he got caught up in the fun it slipped his mind. Thinks about it a bit, but doesn't really have anything new.
Thinks about when he feels strange besides the times he told the partner, they muse a bit on it, then resolve to look into it once the expedition is through
]]--


	SOUND:PlayBGM('Goodnight.ogg', true)
	GAME:WaitFrames(40)
	UI:SetSpeaker(partner)
	UI:WaitShowDialogue("La journée a été absolument géniale,[pause=10] " .. hero:GetDisplayName() .. " ![pause=0] Je me suis tellement amusé !")
	UI:SetSpeakerEmotion("Inspired")
	UI:WaitShowDialogue("Notre première vraie aventure s'est super bien passée ![pause=0] On a même trouvé un trésor et on a pu le garder !")
	UI:WaitShowDialogue("Travailler ensemble avec toi et nos coéquipiers...[pause=0] Ça n'aurait pas pu mieux se passer !")
	UI:WaitShowDialogue("Avec l'expédition qui arrive aussi,[pause=10] je suis tellement excité par tout ça ![pause=0] Et toi ?")

	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(Things have been exciting lately.[pause=0] It seems that excitement has helped " .. partner:GetDisplayName() .. " get " .. GeneralFunctions.GetPronoun(partner, "their") .. " mind off of " .. CharacterEssentials.GetCharacterName("Sandile") .. ",[pause=10] too.)", "Normal")
	GeneralFunctions.HeroDialogue(hero, "(It's been a lot of fun adventuring with " .. partner:GetDisplayName() .. "!)", "Normal")
	GeneralFunctions.HeroDialogue(hero, "(Life in the guild has been a blast so far...[pause=0] I'd like to keep going on adventures with " .. partner:GetDisplayName() .. "!)", "Happy")
	
	GAME:WaitFrames(20)
	GeneralFunctions.DoAnimation(hero, "Nod")
	GAME:WaitFrames(10)
	
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Happy")
	UI:WaitShowDialogue("Je suis content que tu sois d'accord ![pause=0] Continuons nos grandes aventures,[pause=10] " .. hero:GetDisplayName() .. " !")
	
	GROUND:CharSetEmote(partner, "glowing", 0)
	GAME:WaitFrames(40)
	GROUND:CharSetEmote(hero, "glowing", 0)
	GAME:WaitFrames(60)
	GROUND:CharSetEmote(partner, "", 0)
	GROUND:CharSetEmote(hero, "", 0)
	GAME:WaitFrames(40)
	GROUND:EntTurn(partner, Direction.UpLeft)
	GAME:WaitFrames(90)
	GROUND:CharTurnToChar(partner, hero)
	SOUND:FadeOutBGM(120)
	--SOUND:PlayBattleSE('EVT_Emote_Exclaim_Idea')
	--GeneralFunctions.EmoteAndPause(
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Hé,[pause=10] " .. hero:GetDisplayName() .. "...")
	UI:WaitShowDialogue("Tu te souviens, juste avant qu'on rejoigne la guilde,[pause=10] comment je t'avais promis d'aider à résoudre ton amnésie ?")
	UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue("On a été tellement occupés avec les activités de la guilde qu'on n'a pas eu l'occasion de s'en occuper du tout...")
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("Mais je l'ai pas oublié ![script=0]", {function() return GeneralFunctions.Hop(partner) end})
	
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Ceci étant dit...")
	UI:WaitShowDialogue(hero:GetDisplayName() .. ",[pause=10] tu as réussi à te souvenir de quelque chose sur la façon dont tu as fini dans " .. zone:GetColoredName() .. " ?")
	GAME:WaitFrames(20)
	
	GeneralFunctions.HeroDialogue(hero, "(Hmm...[pause=0] I haven't given it any thought,[pause=10] actually.)", "Worried")
	GeneralFunctions.HeroDialogue(hero, "(I'd been so caught up in doing guild work with " .. partner:GetDisplayName() .. " that it slipped my mind entirely!)", "Worried")
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(But,[pause=10] now that I stop and think about it...[pause=0] I still haven't remembered anything.)", "Sad")
	GAME:WaitFrames(20)
	GeneralFunctions.ShakeHead(hero)
	GAME:WaitFrames(10)
	
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue("C'est dommage...[pause=0] Je me doutais bien que c'était le cas,[pause=10] mais j'espérais que tu avais retrouvé quelque chose.")
	GAME:WaitFrames(20)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Et ces sensations étranges,[pause=10] comme celle que tu as eue à la Source Lumineuse ?[pause=0] Tu as une idée là-dessus ?")
	
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(I haven't felt sick like I did at Luminous Spring since we were there.[pause=0] I still don't know why I felt that way.)", "Worried")
	GeneralFunctions.HeroDialogue(hero, "(There was also how I felt touching the obelisk in " .. zone:GetColoredName() .. ",[pause=10] but I don't know anything about that either...)", "Worried")
	GeneralFunctions.HeroDialogue(hero, "(Hmm...)", "Worried")
	
	GAME:WaitFrames(60)
	SOUND:PlayBattleSE('EVT_Emote_Exclaim_Idea')
	GeneralFunctions.EmoteAndPause(hero, "Exclaim", false)
	
	SOUND:PlayBGM('I Saw Something Again....ogg', false)
	GeneralFunctions.HeroDialogue(hero, "(Wait![pause=0] Those aren't the only times I've felt strange![pause=0] I've gotten a strange feeling a few other times!)", "Surprised")
	GAME:WaitFrames(20)
	GeneralFunctions.HeroDialogue(hero, "(I felt strange when I came to the guild for the first time,[pause=10] when I heard about the expedition earlier,[pause=10] and...)", "Normal")
	GAME:WaitFrames(40)
	GeneralFunctions.HeroDialogue(hero, "(...And when I met " .. partner:GetDisplayName() .. ".)", "Worried")
	GAME:WaitFrames(20)
	
	GeneralFunctions.HeroDialogue(hero, "(Those times weren't as strong as what I felt with the obelisk and Luminous Spring,[pause=10] but the feeling was similar.)", "Normal")
	
	GAME:WaitFrames(20)
	GeneralFunctions.HeroSpeak(hero, 60)
	GAME:WaitFrames(20)
	
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Worried")
	UI:WaitShowDialogue("Alors tu as ressenti quelque chose d'étrange plus que ces deux fois-là,[pause=10] c'est ça ?")	
	GAME:WaitFrames(20)
	UI:WaitShowDialogue("Si c'est le cas,[pause=10] il y a peut-être un sens à ces sensations après tout.")
	UI:WaitShowDialogue("Je doute que tu ressentes quelque chose d'étrange aussi souvent sans raison,[pause=10] non ?")
	GAME:WaitFrames(20)
	
	UI:SetSpeakerEmotion("Sad")
	UI:WaitShowDialogue("C'est juste que...[pause=0] je ne vois pas ce que ces moments ont en commun...[pause=0] Ils sont tous si différents !")
	UI:WaitShowDialogue("Je ne comprends pas non plus pourquoi les sensations sont parfois plus fortes et parfois plus faibles.")
	UI:WaitShowDialogue("Du coup, je n'ai aucune idée de ce que pourraient signifier tes sensations étranges...")
	GAME:WaitFrames(20)
	
	GeneralFunctions.HeroDialogue(hero, "(.........)", "Sad")
	GAME:WaitFrames(20)
	
	SOUND:FadeOutBGM(120)
	UI:SetSpeaker(partner)
	UI:SetSpeakerEmotion("Normal")
	UI:WaitShowDialogue("Cependant,[pause=10] ce n'est pas parce qu'on ne peut rien trouver maintenant qu'on ne résoudra pas ça !")
	UI:WaitShowDialogue("Dernièrement, j'ai eu l'impression qu'on peut tout faire quand on travaille ensemble.")
	UI:WaitShowDialogue("Alors je suis sûr qu'on arrivera à tout comprendre ensemble.")
	UI:WaitShowDialogue("Mais avec l'expédition qui arrive,[pause=10] on devrait d'abord se concentrer là-dessus.")
	UI:WaitShowDialogue("On finira par comprendre ![pause=0] Je te le promets,[pause=10] " .. hero:GetDisplayName() .. " !")
	GAME:WaitFrames(20)
	
	GeneralFunctions.HeroDialogue(hero, "(It's frustrating we won't be able to make any progress on this soon...)", "Worried")
	GeneralFunctions.HeroDialogue(hero, "(But with the expedition approaching,[pause=10] it makes sense to focus on that for now.)", "Normal")
	GAME:WaitFrames(20)
	GeneralFunctions.DoAnimation(hero, "Nod")
	GAME:WaitFrames(40)
	
	SOUND:PlayBGM('Goodnight.ogg', true)
	UI:SetSpeaker(partner)
	UI:WaitShowDialogue("...Bon,[pause=10] il se fait tard.[pause=0] Rester éveillés à stresser ne nous aidera pas.")
	UI:WaitShowDialogue("On devrait dormir pour être en forme pour faire une bonne journée demain.")
	
	GAME:WaitFrames(40)
	GROUND:CharSetAnim(partner, "Laying", true)
	GAME:WaitFrames(60)
	GROUND:CharSetAnim(hero, "Laying", true)
	GAME:WaitFrames(40)
	UI:SetSpeaker(partner:GetDisplayName(), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
	UI:WaitShowDialogue("Bonne nuit,[pause=10] " .. hero:GetDisplayName() .. ".")
	GAME:WaitFrames(40)
	GROUND:CharSetAnim(partner, "EventSleep", true)
	GAME:WaitFrames(40)
	GROUND:CharSetAnim(hero, "EventSleep", true)
	GAME:WaitFrames(180)
	SOUND:FadeOutBGM(120)
	GAME:FadeOut(false, 120)	
	
	SV.Chapter4.FinishedBedtimeCutscene = true
	SV.ChapterProgression.CurrentStoryDungeon = ''--Clear the current story dungeon flag
	SV.TemporaryFlags.MorningAddress = true
	SV.TemporaryFlags.MorningWakeup = true
	GeneralFunctions.EndOfDay()
	--Need to pass 4 (add 3 because of how when it checks the days passed parameter) days before chapter 5 starts
	SV.ChapterProgression.DaysToReach = SV.ChapterProgression.DaysPassed + 3
	GAME:CutsceneMode(false)
	GAME:EnterGroundMap('guild_heros_room', 'Main_Entrance_Marker')

	

end