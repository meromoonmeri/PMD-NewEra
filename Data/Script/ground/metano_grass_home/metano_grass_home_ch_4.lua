require 'common'
require 'PartnerEssentials'
require 'GeneralFunctions'
require 'CharacterEssentials'

metano_grass_home_ch_4 = {}

function metano_grass_home_ch_4.SetupGround()
        if not SV.Chapter4.FinishedGrove then
                local vileplume  = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Vileplume', 120, 192, Direction.Up}
                        })
        else 
                local vileplume  = 
                        CharacterEssentials.MakeCharactersFromList({
                                {'Vileplume', 96, 136, Direction.Down},
                                {'Bellossom', 96, 192, Direction.Up}
                        })
        end
        
        GAME:FadeIn(20)
end

function metano_grass_home_ch_4.Vileplume_Action(chara, activator)
        if not SV.Chapter4.FinishedGrove then 
                GeneralFunctions.StartConversation(chara, "With the increase in mystery dungeons and outlaws lately,[pause=10] it amazes me how the town can remain so calm.", "Worried")
                UI:WaitShowDialogue("Les choses deviennent si dangereuses,[pause=10] c'est tout ce à quoi je peux penser...")
                GeneralFunctions.EndConversation(chara)
        else
                metano_grass_home_ch_4.Bellossom_Vileplume_Conversation(chara)
        end
end 

function metano_grass_home_ch_4.Bellossom_Action(chara, activator)
        if not SV.Chapter4.FinishedGrove then 
                --N/A
        else
                metano_grass_home_ch_4.Bellossom_Vileplume_Conversation(chara)
        end
end


function metano_grass_home_ch_4.Bellossom_Vileplume_Conversation(chara)
        local bellossom = CH('Bellossom')
        local vileplume = CH('Vileplume')
        local hero = CH('PLAYER')
        local partner = CH('Teammate1')
        
        partner.IsInteracting = true
        GROUND:CharSetAnim(vileplume, 'None', true)
        GROUND:CharSetAnim(bellossom, 'None', true)
        GROUND:CharSetAnim(hero, 'None', true)
        GROUND:CharSetAnim(partner, 'None', true)
        UI:SetSpeaker(vileplume)
        UI:SetSpeakerEmotion("Worried")
    GROUND:CharTurnToChar(hero, chara)
    local coro1 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(partner, chara, 4) end)
        UI:WaitShowDialogue("Tout semble si sombre ces derniers temps,[pause=10] chéri...[pause=0] Le danger dans ce monde me ronge...")
    TASK:JoinCoroutines({coro1})

        GAME:WaitFrames(20)
        UI:SetSpeaker(bellossom)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Oh là là,[pause=10] tu ne devrais pas tant t'inquiéter ![pause=0] Tu réfléchis trop !")
        UI:WaitShowDialogue("Tu as juste besoin de moins penser à ce genre de choses !")

        GAME:WaitFrames(20)
        GROUND:CharSetEmote(vileplume, "sweating", 1)
        UI:SetSpeaker(vileplume)
        UI:SetSpeakerEmotion("Sad")
        UI:WaitShowDialogue("J'aimerais que ce soit aussi simple...")

        GROUND:CharEndAnim(vileplume)
        GROUND:CharEndAnim(bellossom)
        GROUND:CharEndAnim(partner)
        GROUND:CharEndAnim(hero)
        partner.IsInteracting = false
end

--[[function metano_grass_home_ch_4.Bellossom_Vileplume_Conversation(chara, activator)
        local bellossom = CH('Bellossom')
        local vileplume = CH('Vileplume')
        local hero = CH('PLAYER')
        local partner = CH('Teammate1')
        
        partner.IsInteracting = true
        GROUND:CharSetAnim(vileplume, 'None', true)
        GROUND:CharSetAnim(bellossom, 'None', true)
        GROUND:CharSetAnim(hero, 'None', true)
        GROUND:CharSetAnim(partner, 'None', true)
        UI:SetSpeaker(vileplume)
        UI:SetSpeakerEmotion("Worried")
    GROUND:CharTurnToChar(hero, chara)
    local coro1 = TASK:BranchCoroutine(function() GROUND:CharTurnToCharAnimated(partner, chara, 4) end)
        UI:WaitShowDialogue("Tout semble si sombre ces derniers temps,[pause=10] chéri...[pause=0] Le danger dans ce monde me ronge...")
    TASK:JoinCoroutines({coro1})

        GAME:WaitFrames(20)
        UI:SetSpeaker(bellossom)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("Oh là là,[pause=10] tu ne devrais pas tant t'inquiéter ![pause=0] Tout ira très bien !")
        UI:WaitShowDialogue("Et s'il arrive quelque chose de mal,[pause=10] les enfants et moi serons toujours là pour toi ![pause=0] Nous sommes une famille !")
        GAME:WaitFrames(20)
        
        UI:SetSpeaker(vileplume)
        UI:SetSpeakerEmotion("Happy")
        UI:WaitShowDialogue("C'est...[pause=30] vrai ![pause=0] Ça me fait du bien d'entendre ça au milieu de tout ce qui se passe.")
        UI:WaitShowDialogue("Merci chéri.[pause=0] Je ne sais pas ce que je ferais sans toi.")
        GAME:WaitFrames(20)
        
        UI:SetSpeaker(bellossom)
        UI:SetSpeakerEmotion("Joyous")
        UI:WaitShowDialogue("Bien sûr, mon cœur ![pause=0] Nous serons toujours là pour toi,[pause=10] ne l'oublie jamais !")

        GROUND:CharEndAnim(medicham)
        GROUND:CharEndAnim(machamp)
        GROUND:CharEndAnim(partner)
        GROUND:CharEndAnim(hero)
        partner.IsInteracting = false
end]]--