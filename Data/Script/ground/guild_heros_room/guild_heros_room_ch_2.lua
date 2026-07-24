require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'
require 'ground.guild_heros_room.guild_heros_room_helper'

guild_heros_room_ch_2 = {}




function guild_heros_room_ch_2.FirstMorning()
        GAME:FadeOut(false, 1)
        local hero = CH('PLAYER')
        local partner = CH('Teammate1')
        GAME:CutsceneMode(true)
        AI:DisableCharacterAI(partner)
        UI:ResetSpeaker()
        SOUND:StopBGM()
        GROUND:CharSetAnim(hero, 'EventSleep', true)
        GROUND:CharSetAnim(partner, 'EventSleep', true)
        GROUND:Hide('Bedroom_Exit')--disable map transition object
        GROUND:Hide("Save_Point")--disable bed saving
        local hero_bed = MRKR('Hero_Bed')
        local partner_bed = MRKR('Partner_Bed')
        GROUND:TeleportTo(CH('PLAYER'), hero_bed.Position.X, hero_bed.Position.Y, Direction.Left)
        GROUND:TeleportTo(CH('Teammate1'), partner_bed.Position.X, partner_bed.Position.Y, Direction.Right)
        GeneralFunctions.CenterCamera({hero, partner})
        SV.TemporaryFlags.JustWokeUp = true

        local audino =
                CharacterEssentials.MakeCharactersFromList({
                        {"Audino", 120, 204, Direction.UpRight},
                })

        GAME:WaitFrames(80)
        local coro1 = TASK:BranchCoroutine(function() UI:WaitShowTitle("Chapitre 2\n\nLa Première Mission\n", 20)
                                                                                                  GAME:WaitFrames(180)
                                                                                                  UI:WaitHideTitle(20) end)
        local coro2 = TASK:BranchCoroutine(function() UI:WaitShowBG("Chapter_2", 180, 20)
                                                                                                  GAME:WaitFrames(180)
                                                                                                  UI:WaitHideBG(20) end)
        TASK:JoinCoroutines({coro1, coro2})
        
        GAME:WaitFrames(120)

        UI:SetAutoFinish(true)
        UI:WaitShowVoiceOver("Le lendemain matin...\n\n", -1)
        UI:SetAutoFinish(false)
        
        GAME:WaitFrames(60)
        SOUND:PlayBattleSE("DUN_Heal_Bell")
        GAME:WaitFrames(90)
        UI:SetSpeaker(STRINGS:Format("\\uE040"), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
        UI:WaitShowDialogue("Bonjour ![pause=0] Il est l'heure de se lever !")
        GAME:FadeIn(40)
        
        --sleepyheads
        GAME:WaitFrames(20)
        UI:SetSpeaker('', true, "", -1, "", RogueEssence.Data.Gender.Unknown)
        UI:WaitShowDialogue(".........")
        GAME:WaitFrames(40)
        
        UI:SetSpeaker(audino)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Réveillez-vous, les dormeurs ![pause=0] C'est un nouveau jour radieux !")
        GAME:WaitFrames(20)
        
        GROUND:CharAnimateTurnTo(audino, Direction.Down, 4)
        GAME:WaitFrames(10)
        SOUND:PlayBattleSE("DUN_Heal_Bell")
        GROUND:CharSetAction(audino, RogueEssence.Ground.PoseGroundAction(audino.Position, audino.Direction, RogueEssence.Content.GraphicsManager.GetAnimIndex("Pose")))
        GAME:WaitFrames(100)
        GROUND:CharSetAnim(audino, 'None', true)
        GROUND:CharAnimateTurnTo(audino, Direction.UpRight, 4)
        
        GAME:WaitFrames(20)
        UI:SetSpeaker(partner:GetDisplayName(), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
        UI:WaitShowDialogue("Snorfle...[pause=0] Hein ?")
        GAME:WaitFrames(20)
        GROUND:CharSetAnim(hero, "Laying", true)
        GROUND:CharSetAnim(partner, "Laying", true)
                
        coro1 = TASK:BranchCoroutine(function () GAME:WaitFrames(10)
                                                                                         GeneralFunctions.Shake(hero)
                                                                                         GAME:WaitFrames(20)
                                                                                         GeneralFunctions.DoAnimation(hero, 'Wake') 
                                                                                         GROUND:CharAnimateTurnTo(hero, Direction.Down, 4) 
                                                                                         GAME:WaitFrames(20)
                                                                                         GeneralFunctions.LookAround(hero, 2, 4, false, false, false, Direction.DownLeft) end)
        coro2 = TASK:BranchCoroutine(function () GeneralFunctions.Shake(partner)
                                                                                         GAME:WaitFrames(20)
                                                                                         GeneralFunctions.DoAnimation(partner, 'Wake') 
                                                                                         GROUND:CharAnimateTurnTo(partner, Direction.Down, 4)
                                                                                         GAME:WaitFrames(20)
                                                                                         GeneralFunctions.LookAround(partner, 2, 4, false, false, false, Direction.DownLeft) end)
        TASK:JoinCoroutines({coro1, coro2})

        GAME:WaitFrames(20)
        GeneralFunctions.EmoteAndPause(partner, "Notice", true)
        UI:SetSpeaker(partner)
        UI:WaitShowDialogue("Oh,[pause=10] bonjour,[pause=10] " .. audino:GetDisplayName() .."!")
        GAME:WaitFrames(20)
        
        SOUND:PlayBGM("Wigglytuff's Guild.ogg", true)
        UI:SetSpeaker(audino)
        UI:SetSpeakerEmotion("Happy")
        local move = _DATA.DataIndices[RogueEssence.Data.DataManager.DataType.Skill]:Get("heal_bell")--healbell

        UI:WaitShowDialogue("Bonjour ![pause=0] Rien de tel qu'une " .. move:GetColoredName() .. " pour v-vous réveiller,[pause=10] non ?")
        
        GAME:WaitFrames(20)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("C'est l'heure de la r-réunion du matin ![pause=0] Ne soyez pas en retard,[pause=10] surtout votre premier jour !")
        
        GAME:WaitFrames(20)
        UI:SetSpeaker(partner)
        GeneralFunctions.EmoteAndPause(partner, "Question", true)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Hein ?[pause=0] Réunion du matin ?")
        
        GAME:WaitFrames(20)
        UI:SetSpeaker(audino)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Oui ![pause=0] La guilde se rassemble pour un briefing chaque matin !")
        UI:WaitShowDialogue("V-venez juste dans le hall et vous verrez !")
        
        GAME:WaitFrames(20)
        GROUND:CharAnimateTurnTo(audino, Direction.Left, 4)
        GAME:WaitFrames(40)
        GROUND:CharAnimateTurnTo(audino, Direction.UpRight, 4)
        
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("On dirait que la réunion va commencer ![pause=0] N-ne traînez pas trop !")
        GAME:WaitFrames(20)
        
        GROUND:CharAnimateTurnTo(audino, Direction.Left, 4)
        GROUND:MoveToPosition(audino, 0, 204, false, 2)
        GAME:GetCurrentGround():RemoveTempChar(audino)
        GAME:WaitFrames(20)
        
        --good morning, hero!
        GROUND:CharTurnToCharAnimated(partner, hero, 4)
        GROUND:CharTurnToCharAnimated(hero, partner, 4)
        GAME:WaitFrames(12)
        UI:SetSpeaker(partner)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Bonjour,[pause=10] " .. hero:GetDisplayName() .. " ![pause=0] J'espère que tu as bien dormi !")   
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("On ferait mieux de se dépêcher vers le hall avant de manquer la réunion ![pause=0] Viens !")
        
        GAME:WaitFrames(20)
        GeneralFunctions.PanCamera(208, 156)
        GAME:WaitFrames(20)
        GROUND:CharEndAnim(hero)
        GROUND:CharEndAnim(partner)
        GROUND:Unhide("Bedroom_Exit")
        GROUND:Unhide("Save_Point")
        SV.Chapter1.TeamJoinedGuild = true
        AI:EnableCharacterAI(partner)
        AI:SetCharacterAI(partner, "ai.ground_partner", CH('PLAYER'), partner.Position)

        GAME:CutsceneMode(false)
                

end

function guild_heros_room_ch_2.PostRiverBedtalk() 
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
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue(hero:GetDisplayName() .. ",[pause=10] la journée n'était-elle pas géniale ?[pause=0] Je suis tellement content de comment ça s'est passé !")
        UI:WaitShowDialogue("Notre première mission en tant qu'équipe d'aventuriers a été un succès total !")
        UI:WaitShowDialogue(CharacterEssentials.GetCharacterName("Camerupt") .. " avait l'air si soulagée de retrouver son fils.")
        UI:WaitShowDialogue("La récompense qu'elle nous a donnée était sympa...[pause=0] Mais je suis surtout content qu'on ait pu les aider.")
        GAME:WaitFrames(20)
        
        GeneralFunctions.HeroDialogue(hero, "(Je suis content qu'on ait pu les aider aussi.[pause=0] J'ai l'impression d'être une sorte de héros !)", "Happy")
        GeneralFunctions.HeroDialogue(hero, "(Aider les Pokémon dans le besoin est vraiment gratifiant.[pause=0] J'espère que " .. partner:GetDisplayName() .. " et moi pourrons continuer à le faire.)", "Happy")
        GAME:WaitFrames(20)
        
        UI:SetSpeaker(partner)
        UI:WaitShowDialogue("Ce qui s'est passé à la source était plutôt bizarre,[pause=10] quand même.[pause=0] Je me demande pourquoi ça ne marchait pas ?")
        UI:WaitShowDialogue(CharacterEssentials.GetCharacterName("Noctowl") .. " a dit de ne pas s'en inquiéter,[pause=10] donc je suppose que ce n'est pas si grave.")
        GAME:WaitFrames(20)
        
        GeneralFunctions.HeroDialogue(hero, "(Il a bien dit de ne pas s'inquiéter,[pause=10] mais je n'arrête pas de penser à cette sensation étrange que j'ai eue à la source.)", "Worried")
        GeneralFunctions.HeroDialogue(hero, "(C'était nauséabond,[pause=10] mais tellement similaire à ce que j'ai ressenti dans " .. zone:GetColoredName() .. "...[pause=0] Est-ce que ces deux endroits pourraient être liés ?)", "Worried")
        GAME:WaitFrames(40)
        
        GeneralFunctions.HeroSpeak(hero, 60)
        GAME:WaitFrames(20)
        
        UI:SetSpeaker(partner)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Hein ?[pause=0] Est-ce que je sais si la Source Lumineuse est liée d'une manière ou d'une autre à " .. zone:GetColoredName() .. "?")
        GAME:WaitFrames(20)
        UI:WaitShowDialogue("Euh...[pause=0] Je ne saurais pas dire,[pause=10] pourquoi tu demandes ?")
        
        GAME:WaitFrames(20)
        GeneralFunctions.HeroSpeak(hero, 60)
        
        GAME:WaitFrames(20)
        GeneralFunctions.Recoil(partner)
        UI:SetSpeakerEmotion("Surprised")
        UI:WaitShowDialogue("La lumière de la source t'a fait ressentir la même chose que quand tu as touché la stèle dans " .. zone:GetColoredName() .. "?")
        UI:WaitShowDialogue("Mais cette fois, tu as aussi eu mal ?")
        
        GAME:WaitFrames(20)
        GeneralFunctions.EmoteAndPause(partner, "Sweating", true)
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("Ça a l'air d'être quelque chose de significatif, en effet...[pause=0] Peut-être que les deux endroits sont liés d'une façon ou d'une autre.")
        UI:WaitShowDialogue("Mais une sensation vague, ce n'est pas beaucoup pour s'y baser pour le moment.")
        UI:WaitShowDialogue("On n'est même pas sûrs de ce que cette sensation signifiait dans " .. zone:GetColoredName() .. "!")

        --note: there is signficance in the feelings, as both the tablet and the spring are connected to the tree of life, to which the hero has significance as they were "summoned" here to save it 
        GAME:WaitFrames(20)
        GeneralFunctions.HeroDialogue(hero, "(C'est vrai...[pause=0] Je cherche peut-être un sens là où il n'y en a pas.)", "Worried")
        GeneralFunctions.HeroDialogue(hero, "(C'est difficile à dire,[pause=10] vu toute ma situation...)", "Worried")
        
        GAME:WaitFrames(20)
        UI:SetSpeaker(partner)
        UI:WaitShowDialogue("Je pense qu'on a besoin de quelque chose de plus concret avant de tirer des conclusions.")
        UI:WaitShowDialogue("Pour l'instant,[pause=10] je pense qu'on ne devrait pas s'en inquiéter.[pause=0] Je suis sûr que " .. CharacterEssentials.GetCharacterName("Noctowl") .. " sait de quoi il parle !")
        UI:WaitShowDialogue("Concentrons-nous sur notre entraînement de guilde pour pouvoir continuer à aider les Pokémon comme on l'a fait aujourd'hui.")
        
        --player is more interested in living pokemon life than figuring shit out? potentially? just an idea
        GAME:WaitFrames(20)
        GeneralFunctions.DoAnimation(hero, 'Nod')
        
        GAME:WaitFrames(40)
        GROUND:CharAnimateTurnTo(partner, Direction.Down, 4)
        GeneralFunctions.DoAnimation(partner, "DeepBreath")
        GAME:WaitFrames(10)
        GROUND:CharTurnToCharAnimated(partner, hero, 4)
        UI:SetSpeaker(partner)
        UI:WaitShowDialogue("Haa...[pause=0] Je commence à avoir sommeil.")
        UI:WaitShowDialogue("Reposons-nous pour rendre demain aussi génial qu'aujourd'hui.")
        
        GAME:WaitFrames(20)
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
        GAME:CutsceneMode(false)
        GAME:WaitFrames(60)
        GAME:EnterGroundMap("guild_guildmasters_room", "Main_Entrance_Marker")
        

        
        
        
        
        
end 

function guild_heros_room_ch_2.FirstNightBedtalk()
        GAME:FadeOut(false, 1)
        local hero = CH('PLAYER')
        local partner = CH('Teammate1')
        GAME:CutsceneMode(true)
        guild_heros_room_helper.Bedtime(false)
        UI:ResetSpeaker()
        GROUND:CharSetAnim(hero, 'Laying', true)
        GROUND:CharSetAnim(partner, 'Laying', true)
        
        --wait a bit after the transition from dinner scene before starting this one
        GAME:WaitFrames(60)
        --characters commenting on the dinner they just had while the screen is still faded out
        UI:SetSpeaker(CharacterEssentials.GetCharacterName('Tropius'), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
        UI:WaitShowDialogue("Un repas délicieux comme toujours,[pause=10] " .. CharacterEssentials.GetCharacterName('Snubbull') .. " ![pause=0] Je ne peux plus avaler une bouchée !")
        GAME:WaitFrames(20)
        
        UI:SetSpeaker(CharacterEssentials.GetCharacterName('Breloom'), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
        UI:WaitShowDialogue("Ouais,[pause=10] mon ventre est si plein d'" .. '"art"' .. " qu'on pourrait l'appeler un musée !")
        GAME:WaitFrames(20)
        
        UI:SetSpeaker(CharacterEssentials.GetCharacterName('Mareep'), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
        UI:WaitShowDialogue("Bê-e-e-e...[pause=0] Il se fait tard...[pause=0] Il est temps d'aller\ndormir ![pause=0] Bonne nuit tout le monde !")
        GAME:WaitFrames(20)
        
        UI:SetSpeaker(CharacterEssentials.GetCharacterName('Zigzagoon'), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
        UI:WaitShowDialogue("Oui ![pause=0] À tout le monde demain matin !")
        GAME:WaitFrames(60)
        
        GAME:FadeIn(60)
        GAME:WaitFrames(20)
        SOUND:PlayBGM("Goodnight.ogg", true)
        --GAME:WaitFrames(20)
        
        UI:SetSpeaker(partner:GetDisplayName(), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
        UI:WaitShowDialogue("..." .. hero:GetDisplayName() .. ",[pause=10] t'es encore éveillé ?")
        GAME:WaitFrames(20)
        
        UI:WaitShowDialogue("Aujourd'hui n'a pas été aussi palpitant que je l'aurais voulu,[pause=10] mais je suppose qu'il faut bien commencer par quelque chose.")
        UI:WaitShowDialogue("On a quand même beaucoup appris avec Maître " .. CharacterEssentials.GetCharacterName('Ledian') .. ".")
        UI:WaitShowDialogue("J'espère qu'elle pourra nous apprendre encore plus...[br]On doit apprendre et s'entraîner autant que possible si on veut devenir de grands aventuriers un jour !")
        
        GAME:WaitFrames(40)
        UI:WaitShowDialogue("Haa...[pause=0] Bon,[pause=10] rester éveillés toute la nuit ne va pas nous aider.[pause=0] Reposons-nous.")
        UI:WaitShowDialogue("En espérant que demain sera un autre superbe jour.")
        UI:WaitShowDialogue("Bonne nuit,[pause=10] " .. hero:GetDisplayName() .. ".")
        
        GAME:WaitFrames(20)
        GROUND:CharSetAnim(partner, 'EventSleep', true)
        GAME:WaitFrames(10)
        GROUND:CharSetAnim(hero, 'EventSleep', true)
        GAME:WaitFrames(180)
        SOUND:FadeOutBGM(120)
        GAME:FadeOut(false, 120)
        GAME:WaitFrames(60)
        GAME:CutsceneMode(false)
        SV.Chapter2.FinishedFirstDay = true
        GeneralFunctions.EndOfDay()--reset daily flags and increment day counter by 1
        SV.TemporaryFlags.MorningWakeup = true
        SV.TemporaryFlags.MorningAddress = true
        GAME:EnterGroundMap("guild_heros_room", "Main_Entrance_Marker")
end
