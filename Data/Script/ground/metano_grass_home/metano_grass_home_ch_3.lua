require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_grass_home_ch_3 = {}

function metano_grass_home_ch_3.SetupGround()
        if not SV.Chapter3.DefeatedBoss then
                local vileplume, bellossom  = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Vileplume', 96, 192, Direction.Up},
                                {'Bellossom', 96, 136, Direction.Down}
                        })
        else 
                local vileplume  = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Vileplume', 200, 176, Direction.DownLeft}
                        })
        
                AI:SetCharacterAI(vileplume, "ai.ground_default", RogueElements.Loc(168, 144), RogueElements.Loc(64, 64), 1, 16, 32, 40, 180)
        end

        
        GAME:FadeIn(20)
end

function metano_grass_home_ch_3.Vileplume_Action(chara, activator)
        if not SV.Chapter3.DefeatedBoss then 
                GeneralFunctions.StartConversation(chara, "The world may be a dangerous place,[pause=10] but at least there are adventurers out there that help those in trouble.", "Worried")
                UI:WaitShowDialogue("Néanmoins,[pause=10] j'ai des doutes quant à leur capacité à résoudre tous les problèmes à venir...")
        else
                GeneralFunctions.StartConversation(chara, "All these outlaws...[pause=0] It must be connected with all the mystery dungeons cropping up lately.")
                UI:WaitShowDialogue("Oh,[pause=10] ce monde dangereux dans lequel nous vivons devient de plus en plus périlleux chaque jour...")
        end
        GeneralFunctions.EndConversation(chara)
end 

function metano_grass_home_ch_3.Bellossom_Action(chara, activator)
        GeneralFunctions.StartConversation(chara, "My husband is such a worrywart.[pause=0] He would be a lot happier if he stopped thinking so much!")
        GeneralFunctions.EndConversation(chara)
end 
