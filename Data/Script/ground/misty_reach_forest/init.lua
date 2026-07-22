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
        UI:WaitShowTitle("Chapter 1\n\nAwakening in a Strange World\n", 20)
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
    UI:WaitShowVoiceOver("Where... am I?", -1)
    GAME:WaitFrames(30)
    UI:WaitShowVoiceOver("My head... everything is spinning...", -1)
    
    GAME:WaitFrames(60)
    GROUND:CharSetAnim(hero, 'Idle', true)
    
    UI:SetAutoFinish(false)
    SOUND:PlayBGM('Mystifying Forest.ogg', true)
    
    -- Hero realizes they are a Pokemon
    UI:WaitShowDialogue("Ugh... what happened?")
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("These paws... this body...")
    UI:WaitShowDialogue("I am... a Pokemon?!")
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("That cannot be right. I was... I was human, was I not?")
    UI:WaitShowDialogue("Why can I not remember anything clearly?")
    
    GAME:WaitFrames(30)
    
    -- Partner encounter
    local partner = CH('Teammate1')
    GROUND:Show('Teammate1')
    
    local partner_marker = MRKR("PartnerLocation")
    GROUND:TeleportTo(partner, partner_marker.Position.X, partner_marker.Position.Y, Direction.Left)
    
    -- Partner calls out
    UI:SetSpeaker(ScriptSpeaker("partner", "???"))
    UI:WaitShowDialogue("Hey! Are you okay over there?!")
    
    -- Partner approaches
    GROUND:MoveToPosition(partner, marker.Position.X - 20, marker.Position.Y, false, 1)
    GROUND:CharAnimateTurnTo(partner, Direction.Down, 4)
    
    UI:SetSpeaker(ScriptSpeaker("partner", "???"))
    UI:WaitShowDialogue("Oh good, you are awake! I was worried when I found you lying here.")
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("This forest can be dangerous for explorers who are not prepared.")
    UI:WaitShowDialogue("My name is Litwick. I am an explorer-in-training at Guild New Era.")
    
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("What about you? Do you remember how you got here?")
    
    -- Hero responds
    UI:SetSpeaker(CH('PLAYER'))
    UI:WaitShowDialogue("I... I do not remember much of anything, actually.")
    UI:WaitShowDialogue("I know I was not always a Pokemon, but everything else is a blur.")
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("The only thing I can clearly remember is... a promise.")
    
    UI:SetSpeaker(ScriptSpeaker("partner", "Litwick"))
    UI:WaitShowDialogue("A promise? To whom?")
    
    UI:SetSpeaker(CH('PLAYER'))
    UI:WaitShowDialogue("I... I do not know. Someone important. But I cannot remember who.")
    UI:WaitShowDialogue("It feels like it was a very long time ago...")
    
    GAME:WaitFrames(20)
    
    UI:SetSpeaker(ScriptSpeaker("partner", "Litwick"))
    UI:WaitShowDialogue("That sounds really important. Maybe your memories will come back in time!")
    UI:WaitShowDialogue("In the meantime, you should come with me to New Era City.")
    UI:WaitShowDialogue("But first, we need to get through this forest safely.")
    
    GAME:WaitFrames(20)
    UI:WaitShowDialogue("Stay close to me, okay? I will protect you!")
    
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
    
    UI:SetSpeaker(ScriptSpeaker("partner", "Litwick"))
    UI:WaitShowDialogue("Alright! The exit should be just ahead.")
    UI:WaitShowDialogue("Stay on your toes - there can be hostile Pokemon in the deeper parts!")
    
    GAME:CutsceneMode(false)
end

function misty_reach_forest.WipedInForest()
    local hero = CH('PLAYER')
    local partner = CH('Teammate1')
    
    GAME:FadeIn(40)
    GAME:CutsceneMode(true)
    
    UI:SetSpeaker(ScriptSpeaker("partner", "Litwick"))
    UI:WaitShowDialogue("Oh no, we got separated! Are you okay?")
    UI:WaitShowDialogue("Do not worry - we will make it through together this time!")
    
    GAME:CutsceneMode(false)
end

function misty_reach_forest.GenericEnding()
    local hero = CH('PLAYER')
    
    GAME:CutsceneMode(true)
    UI:ResetSpeaker()
    UI:WaitShowTitle("Misty Reach Forest", 20)
    GAME:WaitFrames(60)
    UI:WaitHideTitle(20)
    GAME:FadeIn(40)
    
    SOUND:PlayBGM('Mystifying Forest.ogg', true)
    
    GAME:WaitFrames(20)
    UI:SetCenter(true)
    UI:WaitShowDialogue("There does not appear to be anything else of interest here.")
    UI:WaitShowDialogue("It is time to move on.")
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
