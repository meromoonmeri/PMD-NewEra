require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_rock_home_ch_2 = {}

function metano_rock_home_ch_2.SetupGround()
        if not SV.Chapter2.FinishedFirstDay then 
                local medicham  = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Medicham', 152, 152, Direction.Left},

                        })
                
                AI:SetCharacterAI(medicham, "ai.ground_default", RogueElements.Loc(120, 120), RogueElements.Loc(64, 64), 1, 16, 64, 40, 180)
        end
        GAME:FadeIn(20)
end

function metano_rock_home_ch_2.Medicham_Action(chara, activator)
        --meditation and self reflection allow one to achieve inner peace.
        GeneralFunctions.StartConversation(chara, "Allow one inner peace,[pause=10] will meditation and self-reflection achieve.")
        --I have been trying to teach this to my daughter, but I think she's struggling with it.
        UI:WaitShowDialogue("La paix intérieure,[pause=10] par la méditation et l'introspection l'atteindre il faut.")
        GeneralFunctions.EndConversation(chara)
end 
