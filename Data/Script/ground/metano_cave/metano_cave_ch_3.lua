require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_cave_ch_3 = {}

function metano_cave_ch_3.SetupGround()
        GAME:FadeIn(20)
end

function metano_cave_ch_3.Sunflora_Action(chara, activator)
        if not SV.Chapter3.DefeatedBoss then
                GeneralFunctions.StartConversation(chara, "...That child that went missing.[pause=0] Has he been rescued yet?", "Worried", true, false)
                UI:WaitShowDialogue(".........Je vois.[pause=0] Au moins, il y a des aventuriers comme vous deux, maintenant.")
        else
                GeneralFunctions.StartConversation(chara, "...Outlaws,[pause=10] huh?", "Worried", true, false)
                UI:SetSpeakerEmotion("Pain")
                UI:WaitShowDialogue("...Je ne me soucie plus vraiment de ce genre de choses.[pause=0] Laissez-moi tranquille, s'il vous plaît.")
        end
        GeneralFunctions.EndConversation(chara, false)
end 
