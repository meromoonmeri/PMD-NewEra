require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'
require 'ground.guild_heros_room.guild_heros_room_helper'

guild_heros_room_ch_1 = {}





--This is for the hero's bed. Event is to go to bed at the end of the chapter to trigger final cutscene.
function guild_heros_room_ch_1.Save_Bed_Dialogue(obj, activator)
        local hero = CH('PLAYER')
        local partner = CH('Teammate1')
        GROUND:CharTurnToCharAnimated(partner, hero, 4)
        GROUND:CharTurnToCharAnimated(hero, partner, 4)
        UI:SetSpeaker(partner)
        UI:SetSpeakerEmotion("Normal")
        if SV.Chapter1.MetSnubbull and SV.Chapter1.MetZigzagoon and SV.Chapter1.MetCranidosMareep and SV.Chapter1.MetBreloomGirafarig and SV.Chapter1.MetAudino then
                GeneralFunctions.StartPartnerConversation("Il se fait tard...[pause=0] Et je crois qu'on a assez visité la guilde...")
                UI:ChoiceMenuYesNo("Tu veux aller dormir pour cette nuit ?")
                UI:WaitForChoice()
                local result = UI:ChoiceResult()
                if result then
                        UI:WaitShowDialogue("D'accord,[pause=10] on va se coucher alors.")
                        UI:WaitShowDialogue("Demain sera une grande journée,[pause=10] il faut qu'on se repose bien.")
                        UI:WaitShowDialogue("Bonne nuit,[pause=10] " .. hero:GetDisplayName() .. ".")
                        SOUND:FadeOutBGM(120)
                        GAME:FadeOut(false, 60)
                        GAME:WaitFrames(120)
                        GeneralFunctions.EndConversation(partner)
                        guild_heros_room_ch_1.Bedtalk()
                else
                        UI:WaitShowDialogue("D'accord,[pause=10] on peut encore regarder un peu.")
                        UI:WaitShowDialogue("Mais on ne devrait pas rester éveillés trop longtemps ![pause=0] On veut être en forme pour demain !")
                        GAME:WaitFrames(20)
                        GeneralFunctions.PromptSaveAndQuit()
                        GeneralFunctions.EndConversation(partner)
                end
        else
                GeneralFunctions.StartPartnerConversation("Ce n'est pas si tard que ça...[pause=0] Promenons-nous dans la guilde et essayons de rencontrer tous les autres membres !")
                GAME:WaitFrames(20)
                GeneralFunctions.PromptSaveAndQuit()
                GeneralFunctions.EndConversation(partner)
        end
end


function guild_heros_room_ch_1.Bedtalk()
        
        --Set nighttime, put duo in beds asleep

        GROUND:Hide("Save_Point")
        guild_heros_room_helper.Bedtime()--set nighttime scene, put duo in their beds
        local hero = CH('PLAYER')
        local partner = CH('Teammate1')

        GAME:CutsceneMode(true)
        AI:DisableCharacterAI(partner)
        GeneralFunctions.CenterCamera({hero, partner})
        GROUND:CharSetAnim(hero, 'Laying', true)
        GROUND:CharSetAnim(partner, 'Laying', true)
        GAME:FadeIn(40)
        
        SOUND:PlayBGM("Goodnight.ogg", true)
        GAME:WaitFrames(60)
        UI:SetSpeaker(partner:GetDisplayName(), true, "", -1, "", RogueEssence.Data.Gender.Unknown)
        UI:WaitShowDialogue(".........")
        UI:WaitShowDialogue("Hé,[pause=10] t'es éveillé,[pause=10] " .. hero:GetDisplayName() .. "?")
        GAME:WaitFrames(20)
        
        UI:WaitShowDialogue("La journée a été complètement folle,[pause=10] pas vrai ?")
        UI:WaitShowDialogue("Je voulais rejoindre la guilde depuis si longtemps...")
        UI:WaitShowDialogue("Maintenant que je suis là,[pause=10] je suis si heureux...[pause=0] J'ai du mal à m'endormir,[pause=10] haha.")
        GAME:WaitFrames(20)
        
        UI:WaitShowDialogue("J'étais si nerveux...[pause=0] Mais tout le monde ici a été si gentil et accueillant.")
        UI:WaitShowDialogue("...Enfin,[pause=10] presque tout le monde.[pause=0] Mais de toute façon, je me sens beaucoup plus à l'aise maintenant.")
        UI:WaitShowDialogue("Même le Maître de la Guilde...[pause=0] Il était tellement simple et gentil,[pause=10] j'étais surpris.")
        GAME:WaitFrames(20)
        
        UI:WaitShowDialogue("On va partir dans toutes sortes d'aventures à partir de demain...")
        UI:WaitShowDialogue("C'est un peu effrayant,[pause=10] mais...[pause=0] ça m'enthousiasme aussi !")
        UI:WaitShowDialogue("On va apprendre et découvrir tellement de choses...[pause=0] Et s'amuser beaucoup aussi !")
        UI:WaitShowDialogue("Et c'est tout parce que tu as décidé de former cette équipe avec moi,[pause=10] " .. hero:GetDisplayName() .. ".")
        UI:WaitShowDialogue("Ça compte beaucoup pour moi...")
        UI:WaitShowDialogue("Donc...[pause=0] Euh...[pause=0] Merci d'avoir rejoint la guilde avec moi, " .. hero:GetDisplayName() .. "...")
        --UI:WaitShowDialogue("Once we're great adventurers,[pause=10] I'm sure we'll be able to solve the mystery of your amnesia.[pause=0] I promise.")
        GAME:WaitFrames(20)
        
        UI:WaitShowDialogue(".........")
        UI:WaitShowDialogue("On ferait mieux d'essayer de dormir...[pause=0] On ne veut pas être épuisés au réveil.")
        UI:WaitShowDialogue("On va tout donner demain,[pause=10] d'accord ?")
        UI:WaitShowDialogue("Bonne nuit,[pause=10] " .. hero:GetDisplayName() .. ".")
        GAME:WaitFrames(20)
        
        GROUND:CharSetAnim(partner, "EventSleep", true)
        SOUND:FadeOutBGM(60)
        GAME:WaitFrames(60)
        
        UI:SetSpeaker('', false, "", -1, "", RogueEssence.Data.Gender.Unknown)
        --man im excited but why do i feel so at ease and maybe a bit of deja vu? why am i a picklemanster?
        UI:WaitShowDialogue("(.........)")
        UI:WaitShowDialogue("(D'abord je me suis transformé en Pokémon,[pause=10] maintenant je suis apprenti dans cette guilde...)")
        UI:WaitShowDialogue("(Tout va si vite...)")
        UI:WaitShowDialogue("(Mais...[pause=0] je ne peux m'empêcher d'être fou d'enthousiasme face à tout ça.)")
        UI:WaitShowDialogue("(Être amis avec " .. partner:GetDisplayName() .. "...[pause=0] Toutes les aventures qu'on va vivre...)")
        UI:WaitShowDialogue("(Rien qu'y penser, je suis tout excité !)")
        GAME:WaitFrames(20)
        
        UI:WaitShowDialogue("(Mais...[pause=0] je crois que c'est ça qui m'intrigue le plus.)")
        UI:WaitShowDialogue("(Ne devrais-je pas plutôt avoir peur ?[pause=0] Pourquoi je me sens si serein ?)")
        UI:WaitShowDialogue("(Je me suis transformé en Pokémon,[pause=10] j'ai perdu la mémoire,[pause=10] et j'étais inconscient près d'une étrange stèle dans une forêt...)")
        UI:WaitShowDialogue("(Ne devrais-je pas être plus anxieux ?)")
        GAME:WaitFrames(60)
        
        --not thematically appropriate on second thought. Hero hasn't necessarily played explorers. Strange feelings felt elsewhere that tip off to "playing explorers" can instead be interpreted as the hero is progressing along the path he wants to / should progress on and is progressing the plot as he should.
        --UI:WaitShowDialogue("(Even more troubling...)")
        --UI:WaitShowDialogue("(Why do I have this weird feeling of déjà vu?)")
        --GAME:WaitFrames(60)
        
        UI:WaitShowDialogue("(.........)")
        UI:WaitShowDialogue("(Je suppose qu'il n'y a pas de sens à me tracasser à propos de ma situation.)")
        UI:WaitShowDialogue("(C'est probablement mieux comme ça que j'apprécie tout ça.)")
        UI:WaitShowDialogue("(Je devrais juste suivre le courant pour l'instant et profiter de la vie de guilde avec " .. partner:GetDisplayName() .. "...)")
        UI:WaitShowDialogue("(Je suis sûr que " .. partner:GetDisplayName() .. " et moi finirons par comprendre tout ça...)")
        GAME:WaitFrames(20)
        
        UI:WaitShowDialogue("(...[pause=0]Éventuellement...)")--doesn't really care if he finds out or not since hero can just enjoy life as a pokemon regardless of solving the mystery
        GAME:WaitFrames(40)
        GROUND:CharSetAnim(hero, "EventSleep", true)
        GAME:WaitFrames(180)
        GAME:UnlockDungeon("illuminant_riverbed")--unlock riverbed for when it's ready in chapter 2.
        GAME:FadeOut(false, 120)
        SV.ChapterProgression.Chapter = 2
        GeneralFunctions.EndOfDay()--reset daily flags and increment day counter by 1
        
        GAME:WaitFrames(120)
        UI:ResetSpeaker()
        --UI:WaitShowDialogue("That's the end of Chapter 1![pause=0] Thanks for playing!")
        --UI:WaitShowDialogue("I'm starting work on Chapter 2 next.[pause=0] But give me your thoughts on Chapter 1!")
        --UI:WaitShowDialogue("Hopefully it won't take as long to do the next chapters.[pause=0] I'm hoping that your guys help will speed things along.")
        --UI:WaitShowDialogue("Let me know if you managed to find any bugs as well.")
        --UI:WaitShowDialogue("In the meantime, I've set the flags so that you can freeroam in this debug-esque state.")
        --UI:WaitShowDialogue("I don't think any cutscenes should be triggering now, but don't expect anything to be looking too normal in this state.")
        --UI:WaitShowDialogue("Do let me know if any story cutscenes trigger.[pause=0] Because if any do I messed up.")
        --UI:WaitShowDialogue("And anything you see is subject to change, just so you know.")
        --UI:WaitShowDialogue("I already have some plans to modify some things around the town...")
        --UI:WaitShowDialogue("Also be sure to check the discord for updates and notes on known bugs/issues, chapter 2 progress, etc.")
        --UI:WaitShowDialogue("Alright.[pause=0] I'm enabling free roam now...[pause=0] Thanks again for playing!")
        
        --GAME:CutsceneMode(false)
        GROUND:RemoveMapStatus("darkness")--Remove map status before saving the game, as saving with a map status saves it for the next load.
        GeneralFunctions.PromptChapterSaveAndQuit("guild_heros_room", "Main_Entrance_Marker", 2)
--      GAME:WaitFrames(20)
        --GAME:EnterGroundMap("guild_heros_room", "Main_Entrance_Marker")
        --[[GAME:CutsceneMode(false)
        GROUND:CharEndAnim(partner)
        GROUND:CharEndAnim(hero)
        GROUND:RemoveMapStatus("darkness")
        SOUND:PlayBGM("Wigglytuff's Guild.ogg", false)
        GROUND:
        GAME:FadeIn(40)
        AI:EnableCharacterAI(partner)
        AI:SetCharacterAI(partner, "ai.ground_partner", CH('PLAYER'), partner.Position)]]--
                
end



function guild_heros_room_ch_1.RoomIntro()
--TASK:BranchCoroutine(guild_heros_room_ch_1.RoomIntro)
        local partner = CH('Teammate1')
        local hero = CH('PLAYER')
        GAME:CutsceneMode(true)
        AI:DisableCharacterAI(partner)
        UI:ResetSpeaker()
        SOUND:PlayBGM("Wigglytuff's Guild Remix.ogg", true)
        GROUND:Hide('Bedroom_Exit')--disable map transition object
        GROUND:Hide("Save_Point")--disable bed saving
        
        local noctowl =
                CharacterEssentials.MakeCharactersFromList({
                        {"Noctowl", 0, 204, Direction.Right},
                })

        GAME:MoveCamera(192, 176, 1, false)
        GROUND:TeleportTo(partner, -32, 192, Direction.Right)
        GROUND:TeleportTo(hero, -32, 216, Direction.Right)

        GAME:FadeIn(40)

        local coro1 = TASK:BranchCoroutine(function() GAME:WaitFrames(8)
                                                                                                  GROUND:MoveToPosition(partner, 172, 192, false, 1)
                                                                                                  GAME:WaitFrames(10)                                                                                             
                                                                                                  GeneralFunctions.EmoteAndPause(partner, "Exclaim", true) 
                                                                                                  end)
        local coro2 = TASK:BranchCoroutine(function() GAME:WaitFrames(16) 
                                                                                                  GROUND:MoveToPosition(hero, 172, 216, false, 1)
                                                                                                  GAME:WaitFrames(10)
                                                                                                  GeneralFunctions.EmoteAndPause(hero, "Exclaim", false)
                                                                                                  end)
        local coro3 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(noctowl, 200, 204, false, 1) 
                                                                                              GROUND:CharAnimateTurnTo(noctowl, Direction.Left, 4)
                                                                                                  end)
                                                                                                
        TASK:JoinCoroutines({coro1, coro2, coro3})
        

        
        UI:SetSpeaker(noctowl)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Voici vos quartiers pendant votre entraînement ici à la guilde.")
        UI:WaitShowDialogue("Il y a déjà quelques meubles ici.[pause=0] Vous pouvez vous en servir à votre guise.")
        GAME:WaitFrames(20)


        --thanks phileas!
        GeneralFunctions.Hop(partner, "Idle")
        UI:SetSpeaker(partner)
        UI:SetSpeakerEmotion("Joyous")
        GROUND:CharSetEmote(partner, "glowing", 0)
        GROUND:CharSetAnim(partner, "Idle", true)
        UI:WaitShowDialogue("Cette chambre est géniale ![pause=0] Merci beaucoup " .. noctowl:GetDisplayName() .. " !")
        
        GAME:WaitFrames(20)
        GROUND:CharSetEmote(partner, "", 0)
        GROUND:CharSetAnim(partner, "None", true)
        local bed1 = MRKR("Hero_Bed")
        local bed2 = MRKR("Partner_Bed")
        
        coro1 = TASK:BranchCoroutine(function() GeneralFunctions.EightWayMove(partner, bed1.Position.X, bed1.Position.Y, false, 1)
                                                                                        GROUND:CharTurnToCharAnimated(partner, hero, 4) end)
        coro2 = TASK:BranchCoroutine(function() GeneralFunctions.FaceMovingCharacter(hero, partner, 4) end)
        coro3 = TASK:BranchCoroutine(function() GeneralFunctions.FaceMovingCharacter(noctowl, partner, 4)
                                                                                        GROUND:CharAnimateTurnTo(noctowl, Direction.Up, 4) end)
        TASK:JoinCoroutines({coro1, coro2, coro3})

        --this bed is comfy
        GeneralFunctions.Hop(partner)
        GeneralFunctions.Hop(partner)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Ces lits sont super ![pause=0] " .. hero:GetDisplayName() .. ",[pause=10] viens t'asseoir sur l'un d'eux !")
        
        GAME:WaitFrames(20)
        
        coro1 = TASK:BranchCoroutine(function() GeneralFunctions.EightWayMove(hero, bed1.Position.X, bed1.Position.Y, false, 1) 
                                                                                        GROUND:CharAnimateTurnTo(hero, Direction.Down, 4) end)
        coro1 = TASK:BranchCoroutine(function() GeneralFunctions.EightWayMove(partner, bed2.Position.X, bed2.Position.Y, false, 1) 
                                                                                        GROUND:CharAnimateTurnTo(partner, Direction.Left, 4) end)
        TASK:JoinCoroutines({coro1, coro2})
        GAME:WaitFrames(30)
        GeneralFunctions.HeroDialogue(hero, "(Pour un tas de paille,[pause=10] ce lit est plutôt confortable !)", "Normal")
        
        
        --is this what's it's like to want to wag your tail?
        GAME:WaitFrames(20)
        GeneralFunctions.HeroDialogue(hero, "(J'ai peut-être perdu la mémoire et me suis transformé en Pokémon,[pause=10] mais...)", "Normal")
        GeneralFunctions.HeroDialogue(hero, "(Après avoir rencontré " .. partner:GetDisplayName() .. " et avoir rejoint cette guilde...)", "Normal")
        GAME:WaitFrames(20)
        GeneralFunctions.HeroDialogue(hero, "(...Je ne peux m'empêcher d'être excité.)", "Inspired")
        GeneralFunctions.HeroDialogue(hero, "(Je me suis transformé en Pokémon...[pause=0] Et pourtant, je suis heureux !)", "Inspired")
        GeneralFunctions.HeroDialogue(hero, "(Je ne sais pas trop comment décrire ça,[pause=10] mais je me sens comme chez moi !)", "Inspired")
        
        GAME:WaitFrames(20)

        UI:SetSpeaker(partner)
        UI:SetSpeakerEmotion("Happy")
        GROUND:CharSetEmote(partner, "glowing", 0)
        UI:WaitShowDialogue("Haha,[pause=10] je te l'avais bien dit,[pause=10] non ?")
        GAME:WaitFrames(20)
        GROUND:CharTurnToCharAnimated(hero, partner, 4)
        GAME:WaitFrames(20)
        GROUND:CharSetEmote(hero, "glowing", 0)
        
        GAME:WaitFrames(60)
        UI:SetSpeaker(noctowl)
        UI:SetSpeakerEmotion("Normal")
        --GROUND:CharSetEmote(noctowl, "glowing", 0)
        UI:WaitShowDialogue("Je suis ravi d'apprendre que vous aimez la chambre.")
        --GROUND:CharSetEmote(noctowl, "", 0)
        
        
        --why not go meet your compatriots?
        GAME:WaitFrames(20)
        GROUND:CharSetEmote(partner, "", 0)
        GROUND:CharSetEmote(hero, "", 0)
        GROUND:CharTurnToCharAnimated(partner, noctowl, 4)
        GROUND:CharTurnToCharAnimated(hero, noctowl, 4)
        
        GAME:WaitFrames(12)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Votre entraînement commence demain.[pause=0] Assurez-vous de bien vous reposer.")
        UI:WaitShowDialogue("Notre routine quotidienne commence très tôt le matin.[pause=0] Ne soyez pas en retard.")
        GAME:WaitFrames(40)
        UI:SetSpeaker(noctowl)
        UI:WaitShowDialogue("Hmm...[pause=0] Mais il n'est pas si tard dans la journée tout de même,[pause=10] n'est-ce pas ?")
        UI:WaitShowDialogue("Je vous suggère de profiter de ce temps pour explorer la guilde et rencontrer certains de vos camarades de guilde.")
        UI:WaitShowDialogue("Ça nous fera gagner du temps sur les présentations demain.")
        GAME:WaitFrames(20)
        
        --we should go meet our guildmembers
        GeneralFunctions.Hop(partner)
        UI:SetSpeaker(partner)
        UI:WaitShowDialogue("Super idée ![pause=0] On s'y mettra une fois qu'on sera bien installés !")
        GAME:WaitFrames(20)
        
        UI:SetSpeaker(noctowl)
        UI:WaitShowDialogue("Très bien,[pause=10] je vous laisse alors.[br]Je vais aider le Maître de la Guilde à mettre à jour nos registres.")
        GAME:WaitFrames(20)
        
        GROUND:CharAnimateTurnTo(noctowl, Direction.Left, 4)
        coro1 = TASK:BranchCoroutine(function() GROUND:MoveToPosition(noctowl, 0, 204, false, 1) end)
        coro2 = TASK:BranchCoroutine(function() GeneralFunctions.FaceMovingCharacter(hero, noctowl, 4, Direction.DownLeft) end)
        coro3 = TASK:BranchCoroutine(function() GeneralFunctions.FaceMovingCharacter(partner, noctowl, 4, Direction.DownLeft) end)
        TASK:JoinCoroutines({coro1, coro2, coro3})
        GAME:GetCurrentGround():RemoveTempChar(noctowl)
        
        GROUND:CharTurnToCharAnimated(partner, hero, 4)
        GROUND:CharTurnToCharAnimated(hero, partner, 4)
        GAME:WaitFrames(12)
        
        --wow, can you believe how amazing this all is? welp, let's go explore!
        --we can hit the hay when we've felt we looked around enough
        UI:SetSpeaker(partner)
        UI:SetSpeakerEmotion("Inspired")
        GROUND:CharSetAnim(partner, "Idle", true)
        UI:WaitShowDialogue("Tu réalises,[pause=10] " .. hero:GetDisplayName() .. "?[pause=0] On va vraiment devenir des aventuriers !")
        UI:WaitShowDialogue("J'ai l'impression de rêver.[pause=0] Je n'aurais jamais cru que ça arriverait ![pause=0] C'est comme un rêve !")
        
        GAME:WaitFrames(20)
        
        GeneralFunctions.HeroDialogue(hero, "(Être ici dans cette guilde est la chose la moins irréelle qui me soit arrivée aujourd'hui...)", "Worried")
        GAME:WaitFrames(20)
        GROUND:CharSetAnim(hero, "Idle", true)
        GeneralFunctions.HeroDialogue(hero, "(Malgré tout...[pause=0] C'est fantastique qu'on ait réussi à rejoindre la guilde.)", "Happy")
        GeneralFunctions.HeroDialogue(hero, "(Ça m'excite beaucoup ![pause=0] Je pense qu'on va bien s'amuser en faisant des aventures avec " .. partner:GetDisplayName() .. "!)", "Happy")
        
        
        --let's go meet our guildmates!!
        GAME:WaitFrames(10)
        GROUND:CharEndAnim(hero)
        GROUND:CharEndAnim(partner)
        GeneralFunctions.DoubleHop(partner)
        UI:SetSpeaker(partner)
        UI:SetSpeakerEmotion("Normal")
        UI:WaitShowDialogue("Allez ![pause=0] Allons rencontrer nos camarades de guilde ![pause=0] On reviendra plus tard quand il sera l'heure de dormir.")
        GAME:WaitFrames(20)
        SOUND:FadeOutBGM()
        
        GeneralFunctions.PanCamera(192, 176)
        GAME:WaitFrames(40)
        
        SOUND:PlayFanfare("Fanfare/Note")
        
        --adventurer's tip (how to save the game)
        UI:ResetSpeaker(false)
        UI:SetCenter(true)
        UI:WaitShowDialogue("Conseils d'Aventurier")
        UI:WaitShowDialogue("Le jeu sauvegardera automatiquement votre progression à chaque pas que vous faites dans un donjon.")
        UI:WaitShowDialogue("Vous pouvez sauvegarder manuellement votre progression en vous couchant dans le lit.")
        UI:WaitShowDialogue("Vous pouvez aussi sauvegarder en appuyant sur " .. STRINGS:LocalKeyString(9) .. " et en sélectionnant Sauvegarder.")
        UI:WaitShowDialogue("Enfin, vous pouvez utiliser le livre à proximité pour diverses autres fonctions utiles.")
        UI:SetCenter(false)
        GAME:WaitFrames(20)

        SOUND:PlayBGM("Wigglytuff's Guild.ogg", true)
        GROUND:Unhide("Bedroom_Exit")
        GROUND:Unhide("Save_Point")
        SV.Chapter1.TeamJoinedGuild = true
        AI:EnableCharacterAI(partner)
        AI:SetCharacterAI(partner, "ai.ground_partner", CH('PLAYER'), partner.Position)

        GAME:CutsceneMode(false)

                                                                                        
end



