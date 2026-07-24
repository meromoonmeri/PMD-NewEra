require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_inn_ch_3 = {}

function metano_inn_ch_3.SetupGround()
        if SV.Chapter3.DefeatedBoss then
                
                local nidorina, nidoking, nidoran_m = 
                CharacterEssentials.MakeCharactersFromList({
                        {'Nidorina', 'Innkeeper_Right'},
                        {'Nidoking', 'Innkeeper_Left'},
                        {'Nidoran_M', 280, 184, Direction.Down}

                })
                
                AI:SetCharacterAI(nidoran_m, "ai.ground_default", RogueElements.Loc(264, 168), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)

        else 
                GROUND:Hide('Innkeeper_Desk_Left')
                
                local nidoqueen, nidoran_m, seviper, zangoose = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Nidoqueen', 'Innkeeper_Right'},
                                {'Nidoran_M', 168, 192, Direction.Down},
                                {'Seviper', 317, 273, Direction.Up},
                                {'Zangoose', 317, 210, Direction.Down}

                        })
                
                AI:SetCharacterAI(nidoran_m, "ai.ground_default", RogueElements.Loc(152, 176), RogueElements.Loc(32, 32), 1, 16, 64, 40, 180)
        end

        GAME:FadeIn(20)
end



function metano_inn_ch_3.Nidoran_M_Action(chara, activator)
        if not SV.Chapter3.DefeatedBoss then 
                GeneralFunctions.StartConversation(chara, "Googoogagee!")
        else
                GeneralFunctions.StartConversation(chara, ".........")
                GROUND:CharSetEmote(chara, "question", 1)
                SOUND:PlayBattleSE('EVT_Emote_Confused')
                UI:WaitShowDialogue("...Nyuh ?[pause=40]")
        end
        GeneralFunctions.EndConversation(chara)
end


function metano_inn_ch_3.Innkeeper_Desk_Left_Action(chara, activator)
        local nidoking = CH('Nidoking')
        GeneralFunctions.StartConversation(nidoking, "My daughter here is helpin' me man the front desk today!")
        UI:WaitShowDialogue("J'espère lui apprendre les ficelles du métier en s'asseyant là avec moi !")
        GeneralFunctions.EndConversation(nidoking)
end

function metano_inn_ch_3.Innkeeper_Desk_Right_Action(chara, activator)
        if not SV.Chapter3.DefeatedBoss then 
                local nidoqueen = CH('Nidoqueen')
                GeneralFunctions.StartConversation(nidoqueen, "Seems like nothin' dangerous was afoot in town after all.[pause=0] That young'un had just wandered off was all!")
                UI:SetSpeakerEmotion("Happy")
                UI:WaitShowDialogue("J'imagine que j'ai pas besoin de m'inquiéter d'un quelconque danger pour mes petits, alors !")
                GeneralFunctions.EndConversation(nidoqueen)
        else 
                local nidorina = CH('Nidorina')
                GeneralFunctions.StartConversation(nidorina, ".........")
                UI:WaitShowDialogue("...Peu importe.")
                GeneralFunctions.EndConversation(nidorina)
        end
end



function metano_inn_ch_3.Zangoose_Action(chara, activator)
        GeneralFunctions.StartConversation(chara, "This inn is one of the best places we've stayed at in our travels.[pause=0] Guess it's earned its reputation.")
        --too long with no nicknames
        UI:WaitShowDialogue("Aussi agréable que ce soit,[pause=10] je préférerais qu'on soit dehors à faire notre travail plutôt que de flâner comme " .. CharacterEssentials.GetCharacterName("Seviper") .. " là-bas le souhaite.")
        UI:WaitShowDialogue("Ça doit être le prix à payer pour un professionnel comme moi de s'associer avec un flemmard comme lui.")
        GeneralFunctions.EndConversation(chara)
end

function metano_inn_ch_3.Seviper_Action(chara, activator)
        GeneralFunctions.StartConversation(chara, "There'ssss been a lot of outlaw activity in this region lately.")
        UI:WaitShowDialogue("Alors " .. CharacterEssentials.GetCharacterName("Zangoose") .. " et moi restons dans cette auberge pendant qu'on chasse les primes dans les paragesss.")
        UI:WaitShowDialogue("Même s'il estsss trop enclin à resssster à l'auberge,[pause=10] plutôt que d'aller faire notre travail.")
        UI:WaitShowDialogue("Il n'estsss tout ssssimplement pas aussi travailleur que moi.")
        GeneralFunctions.EndConversation(chara)
end