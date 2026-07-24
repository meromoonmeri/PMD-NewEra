require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_inn_ch_2 = {}

function metano_inn_ch_2.SetupGround()

        if not SV.Chapter2.FinishedFirstDay then 
                GROUND:Hide('Innkeeper_Desk_Right')
                
                local nidoking, nidoqueen, nidoran_m, snorlax = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Nidoking', 'Innkeeper_Left'},
                                {'Nidoqueen', 168, 144, Direction.Right},
                                {'Nidoran_M', 264, 152, Direction.UpLeft},
                                {'Snorlax', 128, 248, Direction.DownRight}
                        })
                
                AI:SetCharacterAI(nidoqueen, "ai.ground_default", RogueElements.Loc(152, 128), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)
                AI:SetCharacterAI(nidoran_m, "ai.ground_default", RogueElements.Loc(248, 136), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)
                AI:SetCharacterAI(snorlax, "ai.ground_default", RogueElements.Loc(112, 232), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)
                

        else
                local nidoking, nidoqueen, nidoran_m, nidorina, snorlax = 
                CharacterEssentials.MakeCharactersFromList({
                        {'Nidoking', 'Innkeeper_Left'},
                        {'Nidoqueen', 'Innkeeper_Right'},
                        {'Nidoran_M', 316, 164, Direction.Left},
                        {'Nidorina', 264, 152, Direction.Down},
                        {'Snorlax', 293, 273, Direction.Up}
                })
                
                AI:SetCharacterAI(nidorina, "ai.ground_default", RogueElements.Loc(248, 136), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)
                GROUND:CharSetAnim(nidoran_m, "Sleep", true)
        end
        
        GAME:FadeIn(20)
end


function metano_inn_ch_2.Innkeeper_Desk_Left_Action(chara, activator)
        local nidoking = CH('Nidoking')
        if not SV.Chapter2.FinishedFirstDay then
                GeneralFunctions.StartConversation(nidoking, "Howdy y'all![pause=0] Welcome to the Metano Inn![pause=0] Can I get y'all a couple of beds for the evenin'?")
                UI:WaitShowDialogue("...Quoi ça ?[pause=0] Vous vivez à la guilde ?")
                UI:SetSpeakerEmotion("Happy")
                UI:WaitShowDialogue("Eh bien,[pause=10] vous êtes toujours les bienvenus ici, quand vous voulez ![pause=0] N'hésitez pas à passer !")
        else 
                GeneralFunctions.StartConversation(nidoking, "Poor " .. CharacterEssentials.GetCharacterName('Camerupt') .. "'s young'un has gone missin'.")
                UI:SetSpeakerEmotion("Worried")
                UI:WaitShowDialogue("C'est toujours triste d'entendre qu'un truc pareil arrive aux gens du coin.")
                UI:SetSpeakerEmotion("Normal")
                UI:WaitShowDialogue("Moi et ma femme devrions aller lui rendre visite pour voir comment elle va.")
        end
        GeneralFunctions.EndConversation(nidoking)
end

function metano_inn_ch_2.Nidoran_M_Action(chara, activator)
        if not SV.Chapter2.FinishedFirstDay then 
                GeneralFunctions.StartConversation(chara, "Goo...[pause=20] gaa!")
                GeneralFunctions.EndConversation(chara)
        else 
                UI:SetSpeaker(chara:GetDisplayName(),true, "", -1, "", RogueEssence.Data.Gender.Unknown)
                GeneralFunctions.StartConversation(chara, "ZZZzzz...", "Normal", false, false, false)
                GeneralFunctions.EndConversation(chara, false)
        end
end


--she isn't behind the desk on day 1
function metano_inn_ch_2.Nidoqueen_Action(chara, activator)
        GeneralFunctions.StartConversation(chara, "That's my hubby mannin' the front desk over yonder.")
        GROUND:CharSetEmote(chara, "happy", 0)
        UI:SetSpeakerEmotion("Special0")
        UI:WaitShowDialogue("C'est vraiment un bon parti,[pause=10] non ?[pause=0] Je suis très fier de lui et de nos deux enfants !")
        GROUND:CharSetEmote(chara, "", 0)
        GeneralFunctions.EndConversation(chara)
end

--only active on day 2 
function metano_inn_ch_2.Innkeeper_Desk_Right_Action(chara, activator)
        local nidoqueen = CH('Nidoqueen')
        GeneralFunctions.StartConversation(nidoqueen, "We heard that one of the youngsters in town went missin' and now not a soul knows where he is.", "Worried")
        UI:WaitShowDialogue("On garde un œil très attentif sur nos petits en attendant qu'il soit retrouvé sain et sauf,[pause=10] au cas où il y aurait un quelconque danger.")
        GeneralFunctions.EndConversation(nidoqueen)
end

function metano_inn_ch_2.Nidorina_Action(chara, activator)
        GeneralFunctions.StartConversation(chara, "Can't believe I'm not allowed out until that stupid kid is found.", "Determined")
        UI:WaitShowDialogue("Juste parce qu'un mioche stupide s'est enfui, ça ne veut pas dire que je vais le faire moi aussi ![pause=0] Mais mes parents, bien sûr, ils pigent rien !")
        UI:SetSpeakerEmotion("Angry")
        UI:WaitShowDialogue("ARGH ![pause=0] C'est tellement agaçant ![pause=0] Et ils le sont aussi !")
        GeneralFunctions.EndConversation(chara)
end


function metano_inn_ch_2.Passerby_1_Action(chara, activator)
        if not SV.Chapter2.FinishedFirstDay then 
                GeneralFunctions.StartConversation(chara, "I'm passing through this area and decided to rest for a while at the inn here.")
                UI:WaitShowDialogue("J'ai entendu beaucoup de bien sur l'Auberge de Metano au cours de mes voyages.[pause=0] J'espère que la réputation est méritée !")
        else 
                GeneralFunctions.StartConversation(chara, "Last night's sleep was some of the best I've ever had.[pause=0] This really is a great inn!")
                UI:WaitShowDialogue("Par contre, le petit-déjeuner continental laisse vraiment à désirer...[pause=0] Les portions sont bien trop petites !") 
        end
        GeneralFunctions.EndConversation(chara)
end