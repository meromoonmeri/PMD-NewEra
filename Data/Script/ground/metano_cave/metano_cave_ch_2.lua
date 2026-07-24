require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_cave_ch_2 = {}

function metano_cave_ch_2.SetupGround()
        GAME:FadeIn(20)
end

function metano_cave_ch_2.Sunflora_Action(chara, activator)
        if not SV.Chapter2.FinishedFirstDay then 
                GeneralFunctions.StartConversation(chara, "Visitors...?", "Worried", true, false)
                UI:WaitShowDialogue("Merci d'être passés,[pause=10] mais je préférerais être seul.[pause=0] Pardon.")
        else 
                GeneralFunctions.StartConversation(chara, "...One of the town children has gone missing?", "Worried", true, false)
                UI:WaitShowDialogue("...Ça n'est plus vraiment mon truc.[pause=0] Trouvez quelqu'un d'autre pour vous aider.")
        end 
        GeneralFunctions.EndConversation(chara, false)
end 
