--[[
    PMD: New Era - Chapter 1 Opening Script
    Misty Reach Forest - Where the hero awakens as a Pokemon
]]--
require 'common'

local misty_reach_forest = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function misty_reach_forest.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init misty_reach_forest <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function misty_reach_forest.Enter(map)
    misty_reach_forest.PlotScripting()
end

function misty_reach_forest.Exit(map)
end

function misty_reach_forest.Update(map)
end

function misty_reach_forest.GameLoad(map)
    misty_reach_forest.PlotScripting()
end

function misty_reach_forest.GameSave(map)
end

-------------------------------
-- Chapter 1: Awakening in a Strange World
-------------------------------
function misty_reach_forest.PlotScripting()
    if not SV.Chapter1.PlayedIntroCutscene then
        misty_reach_forest.IntroCutscene()
    elseif not SV.Chapter1.PartnerMetHero then
        misty_reach_forest.PartnerFindsHero()
    elseif not SV.Chapter1.TeamCompletedForest then
        misty_reach_forest.WipedInForest()
    else
        misty_reach_forest.GenericEnding()
    end
end

function misty_reach_forest.IntroCutscene()
    SV.Chapter1.PlayedIntroCutscene = true
    SV.ChapterProgression.Chapter = 1
    SV.Chapter1.Started = true
    
    GAME:CutsceneMode(true)
    GROUND:Hide('Teammate1')
    UI:ResetSpeaker()
    SOUND:FadeOutBGM()
    
    local hero = CH('PLAYER')
    local marker = MRKR("WakeupLocation")
    GROUND:CharSetAnim(hero, 'Laying', true)
    GROUND:TeleportTo(hero, marker.Position.X, marker.Position.Y, Direction.Right)
    
    UI:SetAutoFinish(true)
    
    -- Chapter title card
    local coro1 = TASK:BranchCoroutine(function()
        UI:WaitShowTitle("Chapitre 1\n\nRéveil dans un Monde Étrange\n", 20)
        GAME:WaitFrames(180)
        UI:WaitHideTitle(20)
    end)
    local coro2 = TASK:BranchCoroutine(function()
        UI:WaitShowBG("Chapter_1", 180, 20)
        GAME:WaitFrames(180)
        UI:WaitHideBG(20)
    end)
    TASK:JoinCoroutines({coro1, coro2})
    
    GAME:WaitFrames(180)
    
    -- Hero wakes up
    UI:WaitShowVoiceOver(".............", -1)
    GAME:WaitFrames(30)
    UI:WaitShowVoiceOver("Où... suis-je ?", -1)
    GAME:WaitFrames(30)
    UI:WaitShowVoiceOver("Ma tête... tout tourbillonne...", -1)
    
    GAME:WaitFrames(60)
    GROUND:CharSetAnim(hero, 'Idle', true)
    
    UI:SetAutoFinish(false)
    SOUND:PlayBGM('Mystifying Forest.ogg', true)
    
    -- Hero realizes they are a Pokemon
    UI:WaitShowDialogue("Urgh... qu'est-ce qui s'est passé ?")
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("Ces pattes... ce corps...")
    UI:WaitShowDialogue("Je suis... un Pokémon ?!")
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("Ça ne peut pas être vrai. J'étais... j'étais humain, non ?")
    UI:WaitShowDialogue("Pourquoi est-ce que je ne me souviens de rien clairement ?")
    
    GAME:WaitFrames(30)
    
    -- Partner encounter
    local partner = CH('Teammate1')
    GROUND:Show('Teammate1')
    
    local partner_marker = MRKR("PartnerLocation")
    GROUND:TeleportTo(partner, partner_marker.Position.X, partner_marker.Position.Y, Direction.Left)
    
    -- Partner calls out
    UI:SetSpeaker(ScriptSpeaker("partner", "???"))
    UI:WaitShowDialogue("Hé ! Ça va là-dedans ?!")
    
    -- Partner approaches
    GROUND:MoveToPosition(partner, marker.Position.X - 20, marker.Position.Y, false, 1)
    GROUND:CharAnimateTurnTo(partner, Direction.Down, 4)
    
    UI:SetSpeaker(ScriptSpeaker("partner", "???"))
    UI:WaitShowDialogue("Oh, tu es réveillé ! J'ai eu peur en te trouvant allongé ici.")
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("Cette forêt peut être dangereuse pour les explorers qui ne sont pas préparés.")
    UI:WaitShowDialogue("Je m'appelle Lumibell. Je suis un explorateur en formation à la Guilde Nouvelle Ère.")
    
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("Et toi ? Tu te souviens de comment tu es arrivé ici ?")
    
    -- Hero responds
    UI:SetSpeaker(CH('PLAYER'))
    UI:WaitShowDialogue("Je... je ne me souviens pas de grand-chose, en fait.")
    UI:WaitShowDialogue("Je sais que je n'ai pas toujours été un Pokémon, mais tout le reste est flou.")
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("La seule chose dont je me souviens clairement, c'est... une promesse.")
    
    UI:SetSpeaker(ScriptSpeaker("partner", "Lumibell"))
    UI:WaitShowDialogue("Une promesse ? Envers qui ?")
    
    UI:SetSpeaker(CH('PLAYER'))
    UI:WaitShowDialogue("Je... je ne sais pas. Quelqu'un d'important. Mais je ne me rappelle plus qui.")
    UI:WaitShowDialogue("On dirait que c'était il y a très longtemps...")
    
    GAME:WaitFrames(20)
    
    UI:SetSpeaker(ScriptSpeaker("partner", "Lumibell"))
    UI:WaitShowDialogue("Ça a l'air vraiment important. Peut-être que tes souvenirs reviendront avec le temps !")
    UI:WaitShowDialogue("En attendant, tu devrais venir avec moi à la Cité Nouvelle Ère.")
    UI:WaitShowDialogue("Mais d'abord, il faut traverser cette forêt en sécurité.")
    
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("Reste près de moi, d'accord ? Je te protégerai !")
    
    GAME:CutsceneMode(false)
    
    -- Partner joins
    SV.Chapter1.PartnerMetHero = true
end

function misty_reach_forest.PartnerFindsHero()
    local hero = CH('PLAYER')
    local partner = CH('Teammate1')
    
    AI:DisableCharacterAI(partner)
    SOUND:StopBGM()
    GAME:WaitFrames(20)
    
    GAME:MoveCamera(301, 224, 1, false)
    GAME:FadeIn(40)
    SOUND:PlayBGM('Mystifying Forest.ogg', true)
    
    GAME:WaitFrames(20)
    
    local coro1 = TASK:BranchCoroutine(function()
        GROUND:MoveToPosition(partner, 309, 240, false, 1)
    end)
    local coro2 = TASK:BranchCoroutine(function()
        GAME:WaitFrames(10)
        GROUND:MoveToPosition(hero, 277, 240, false, 1)
    end)
    TASK:JoinCoroutines({coro1, coro2})
    
    GAME:CutsceneMode(true)
    UI:ResetSpeaker()
    
    UI:SetSpeaker(ScriptSpeaker("partner", "Lumibell"))
    UI:WaitShowDialogue("C'est bon ! La sortie devrait être juste devant.")
    UI:WaitShowDialogue("Reste sur tes gardes — il peut y avoir des Pokémon hostiles dans les parties profondes !")
    
    GAME:CutsceneMode(false)
end

function misty_reach_forest.WipedInForest()
    local hero = CH('PLAYER')
    local partner = CH('Teammate1')
    
    GAME:FadeIn(40)
    GAME:CutsceneMode(true)
    
    UI:SetSpeaker(ScriptSpeaker("partner", "Lumibell"))
    UI:WaitShowDialogue("Oh non, on s'est séparés ! Ça va ?")
    UI:WaitShowDialogue("Ne t'inquiète pas — on traversera ensemble cette fois-ci !")
    
    GAME:CutsceneMode(false)
end

function misty_reach_forest.GenericEnding()
    local hero = CH('PLAYER')
    
    GAME:CutsceneMode(true)
    UI:ResetSpeaker()
    UI:WaitShowTitle("Forêt de la Brume Murmurante", 20)
    GAME:WaitFrames(60)
    UI:WaitHideTitle(20)
    GAME:FadeIn(40)
    
    SOUND:PlayBGM('Mystifying Forest.ogg', true)
    
    GAME:WaitFrames(20)
    UI:SetCenter(true)
    UI:WaitShowDialogue("Il ne semble plus y avoir rien d'intéressant ici.")
    UI:WaitShowDialogue("Il est temps de partir.")
    GAME:WaitFrames(40)
    UI:SetCenter(false)
    
    SOUND:FadeOutBGM(60)
    GAME:FadeOut(false, 60)
    GAME:CutsceneMode(false)
    
    -- Return to main zone
    GeneralFunctions.EndDungeonRun(
        RogueEssence.Data.GameProgress.ResultType.Cleared,
        "backup_master_zone", -1, 6, 0, true, true
    )
end

return misty_reach_forest
