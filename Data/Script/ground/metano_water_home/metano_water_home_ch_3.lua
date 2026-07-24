require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_water_home_ch_3 = {}

function metano_water_home_ch_3.SetupGround()
        
        if not SV.Chapter3.DefeatedBoss then
                local quagsire, floatzel  = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Quagsire', 232, 168, Direction.Up},
                                {'Floatzel', 232, 120, Direction.Down}
                        })
        end
                
        GAME:FadeIn(20)
end

function metano_water_home_ch_3.Quagsire_Action(chara, activator)
        GeneralFunctions.StartConversation(chara, "It's wonderful that " .. CharacterEssentials.GetCharacterName("Numel") .. " was rescued after wandering off,[pause=10] but...", "Worried")
        UI:WaitShowDialogue("Ça m'inquiète pour mes propres enfants.[pause=0] Ils ont tendance à vagabonder aussi...")
        UI:WaitShowDialogue("J'espère qu'ils n'iront pas se perdre dans un endroit où ils auraient besoin d'être secourus...")
        GeneralFunctions.EndConversation(chara)
end 

function metano_water_home_ch_3.Floatzel_Action(chara, activator)
        GeneralFunctions.StartConversation(chara, "I'm not too worried if " .. CharacterEssentials.GetCharacterName("Wooper_Girl") .. " or " .. CharacterEssentials.GetCharacterName("Wooper_Boy") .. " wander off.")
        UI:WaitShowDialogue("Ils se sont perdus plein de fois avant et ils ont toujours réussi à rentrer chez eux sains et saufs.")
        UI:WaitShowDialogue("Au pire,[pause=10] la guilde pourrait les sauver comme ils ont sauvé " .. CharacterEssentials.GetCharacterName("Numel") .. ",[pause=10] non ?")
        GeneralFunctions.EndConversation(chara)
end 
