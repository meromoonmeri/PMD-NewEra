require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_grass_home_ch_2 = {}

function metano_grass_home_ch_2.SetupGround()
        if not SV.Chapter2.FinishedFirstDay then 
                local vileplume  = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Vileplume', 120, 192, Direction.Up}
                        })
        else
                local gloom  = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Gloom', 200, 192, Direction.DownLeft}
                        })
                        
                AI:SetCharacterAI(gloom, "ai.ground_default", RogueElements.Loc(168, 160), RogueElements.Loc(64, 64), 1, 16, 32, 40, 180)
        
        end
        
        GAME:FadeIn(20)
end

function metano_grass_home_ch_2.Vileplume_Action(chara, activator)
        GeneralFunctions.StartConversation(chara, "I've been hearing that more and more of these mystery dungeons have been popping up as of late.", "Worried")
        UI:WaitShowDialogue("Le plus étrange,[pause=10] c'est que personne ne semble savoir pourquoi elles apparaissent de plus en plus...")
        UI:WaitShowDialogue("On dirait que le monde devient de plus en plus dangereux chaque jour qui passe...")
        UI:WaitShowDialogue("C'est effrayant de vivre en ces temps...")
        GeneralFunctions.EndConversation(chara)
end 

function metano_grass_home_ch_2.Gloom_Action(chara, activator)
        local numel_species = _DATA:GetMonster('numel'):GetColoredName()
        GeneralFunctions.StartConversation(chara, CharacterEssentials.GetCharacterName("Nidorina") .. " isn't allowed out right now because of the missing " .. numel_species .. " kid.[pause=0] Her parents worry,[pause=10] I guess.")
        UI:SetSpeakerEmotion("Worried")
        UI:WaitShowDialogue("C'est vraiment dommage que " .. CharacterEssentials.GetCharacterName("Numel") .. " ait disparu...[pause=0] Mais j'aimerais que ça n'empêche pas " .. CharacterEssentials.GetCharacterName("Nidorina") .. " de sortir avec ses amis...")
        GeneralFunctions.EndConversation(chara)
end 
