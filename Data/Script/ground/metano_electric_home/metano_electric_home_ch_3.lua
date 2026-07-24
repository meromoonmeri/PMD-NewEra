require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_electric_home_ch_3 = {}

function metano_electric_home_ch_3.SetupGround()
        
        if SV.Chapter3.DefeatedBoss then
                local luxray  = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Luxray', 216, 130, Direction.Down}
                        })

        end
        
        GAME:FadeIn(20)
end

function metano_electric_home_ch_3.Luxray_Action(chara, activator)
        GeneralFunctions.StartConversation(chara, "Outlaws?[pause=0] What fear need I of them?")
        UI:WaitShowDialogue("Si des hors-la-loi se présentent à moi,[pause=10] je les vaincrais facilement moi-même.")
        UI:WaitShowDialogue("Les autres Pokémon de la ville devraient faire de même,[pause=10] mais ils sont devenus mous à force de vivre près de la guilde.")
        GeneralFunctions.EndConversation(chara)
end 


