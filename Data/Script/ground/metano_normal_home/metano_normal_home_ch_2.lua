require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_normal_home_ch_2 = {}

function metano_normal_home_ch_2.SetupGround()
        if not SV.Chapter2.FinishedFirstDay then 
                local linoone, sentret  = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Linoone', 202, 166, Direction.Left},
                                {'Sentret', 256, 116, Direction.Down}
                        })
                
                GROUND:CharSetAnim(sentret, "Sleep", true)
        
        else 
                local furret = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Furret', 136, 166, Direction.Right}
                        })
                
        end
        
        GAME:FadeIn(20)
end

function metano_normal_home_ch_2.Linoone_Action(chara, activator)
        GeneralFunctions.StartConversation(chara, "It's always a nice break when " .. CH('Sentret'):GetDisplayName() .. " goes down for his nap.")
        UI:WaitShowDialogue("J'ai enfin un peu de temps pour moi.[pause=0] Je pense que je vais rattraper un peu de lecture.")
        GeneralFunctions.EndConversation(chara)
end 


function metano_normal_home_ch_2.Sentret_Action(chara, activator)
        local linoone = CH('Linoone')
        local hero = CH('PLAYER')
        local partner = CH('Teammate1')
        local olddir = linoone.Direction
        partner.IsInteracting = true
        
        GROUND:CharSetAnim(partner, "None", true)
        GROUND:CharSetAnim(hero, "None", true)
        GROUND:CharSetAnim(linoone, "None", true)
        UI:SetSpeaker(linoone)
        UI:SetSpeakerEmotion("Normal")
        GeneralFunctions.EmoteAndPause(linoone, "Exclaim", true)
        GROUND:CharTurnToCharAnimated(linoone, hero, 4)
        UI:WaitShowDialogue("Hé ![pause=0] Qu'est-ce que vous deux faites là-bas ?")
        
        GeneralFunctions.DuoTurnTowardsChar(linoone)
        
        UI:WaitShowDialogue(CharacterEssentials.GetCharacterName('Sentret') .. " fait sa sieste.[pause=0] Ne le réveillez pas, s'il vous plaît !")
        
        GAME:WaitFrames(20)
        UI:SetSpeaker(partner)
        GROUND:CharSetEmote(partner, "sweating", 1)
        UI:WaitShowDialogue("O-oh.[pause=0] Pardon, madame !")
        GROUND:CharAnimateTurnTo(linoone, olddir, 4)
        
        GROUND:CharEndAnim(partner)
        GROUND:CharEndAnim(hero)
        GROUND:CharEndAnim(linoone)
        partner.IsInteracting = false
end



function metano_normal_home_ch_2.Furret_Action(chara, activator)
        if SV.Chapter2.EnteredRiver then 
                GeneralFunctions.StartConversation(chara, "Still no sign of " .. CharacterEssentials.GetCharacterName("Numel") .. "...[pause=0] I sure hope he's found soon...","Worried")
                UI:WaitShowDialogue("Je ne pourrai pas dormir tranquillement tant que je ne saurai pas qu'il est rentré chez lui, sain et sauf,[pause=10] avec sa maman.")
        else
                GeneralFunctions.StartConversation(chara, CharacterEssentials.GetCharacterName("Camerupt") .. " came here earlier asking if I had seen " .. CharacterEssentials.GetCharacterName("Numel") .. " this morning.", "Worried")
                UI:WaitShowDialogue("Cela dit, ça fait un moment que je ne l'ai pas vu.[pause=0] Si je ne dormais pas autant en ville,[pause=10] j'aurais peut-être pu le repérer...")
        end 
        GeneralFunctions.EndConversation(chara)
end 