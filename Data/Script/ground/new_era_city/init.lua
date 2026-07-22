--[[
    PMD: New Era - Main Ground Script (New Era City Hub)
    This is the main hub town script where players return between dungeons.
]]--
require 'common'

local new_era_city = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function new_era_city.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init new_era_city <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
    COMMON.RespawnAllies(true)
    -- Show chapter title on first visit
    if SV.ChapterProgression.Chapter >= 1 and not SV.Chapter1.ArrivedAtCity then
        SV.Chapter1.ArrivedAtCity = true
    end
end

function new_era_city.Enter(map)
    new_era_city.PlotScripting()
end

function new_era_city.Exit(map)
end

function new_era_city.Update(map)
end

function new_era_city.GameLoad(map)
    new_era_city.PlotScripting()
end

function new_era_city.GameSave(map)
end

function new_era_city.PlotScripting()
    local hero = CH('PLAYER')
    local chapter = SV.ChapterProgression.Chapter
    
    SOUND:PlayBGM('Treasure_Town.ogg', true)
    GAME:FadeIn(40)
    
    -- Chapter-specific hub events
    if chapter >= 1 then
        -- Show appropriate dialogue based on story progress
    end
end

-------------------------------
-- NPC Interactions
-------------------------------
function new_era_city.Guildmaster_Dragonite_Action(chara, activator)
    local hero = CH('PLAYER')
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Guildmaster_Dragonite)
    
    local chapter = SV.ChapterProgression.Chapter
    
    if chapter == 0 or not SV.Chapter1.ArrivedAtCity then
        UI:WaitShowDialogue("Welcome, young one. I am Guildmaster Dragonite.")
        UI:WaitShowDialogue("This is New Era City, the heart of our exploration guild.")
        UI:WaitShowDialogue("If you wish to join the guild, speak to Lopunny at the desk.")
    elseif chapter <= 3 then
        UI:WaitShowDialogue("How goes your exploration? The bulletin board has new missions.")
    elseif chapter >= 4 and chapter <= 10 then
        UI:WaitShowDialogue("These are troubling times. The Collapse threatens us all.")
        UI:WaitShowDialogue("But I believe in you and your team. Stay strong.")
    elseif chapter >= 11 and chapter <= 18 then
        UI:WaitShowDialogue("The dimensional crisis grows worse by the day.")
        UI:WaitShowDialogue("Please, do what must be done. The world depends on you.")
    elseif chapter >= 19 then
        UI:WaitShowDialogue("Everything hangs in the balance now.")
        UI:WaitShowDialogue("Go to the Dream Dimension. Stop the Primordial Chaos.")
    elseif chapter >= 20 and SV.Chapter20.Complete then
        UI:WaitShowDialogue("You did it. The world is saved.")
        UI:WaitShowDialogue("Thank you, from the bottom of my heart.")
    end
    
    GAME:CutsceneMode(false)
end

function new_era_city.Lopunny_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Lopunny)
    
    if not SV.Chapter2.JoinedGuild then
        UI:WaitShowDialogue("Oh! A new face! Are you here to join the guild?")
        UI:WaitShowDialogue("Wonderful! Let me register your exploration team right away!")
        UI:ChoiceMenuYesNo("Ready to register your team?",
            function(result)
                if result then
                    SV.Chapter2.JoinedGuild = true
                    SV.ChapterProgression.Chapter = 2
                    UI:WaitShowDialogue("Excellent! Welcome to Guild New Era!")
                    UI:WaitShowDialogue("Check the bulletin board for your first mission.")
                else
                    UI:WaitShowDialogue("Take your time! I will be here whenever you are ready.")
                end
            end)
    else
        UI:WaitShowDialogue("Good to see you! There are always new missions on the board.")
        UI:WaitShowDialogue("Stay safe out there!")
    end
    
    GAME:CutsceneMode(false)
end

function new_era_city.Cinccino_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Cinccino)
    UI:WaitShowDialogue("Welcome to my cafe! Would you like something to eat?")
    UI:WaitShowDialogue("The Berry Soufflee is my speciality. It will restore your energy!")
    GAME:CutsceneMode(false)
end

function new_era_city.Chansey_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Chansey)
    UI:WaitShowDialogue("Oh my! Are you hurt? Let me take a look at you.")
    UI:WaitShowDialogue("There, there. You are all healed up now!")
    GAME:CutsceneMode(false)
end

function new_era_city.Gothitelle_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Gothitelle)
    
    local chapter = SV.ChapterProgression.Chapter
    if chapter < 4 then
        UI:WaitShowDialogue("Welcome to the library. Knowledge is the greatest treasure.")
        UI:WaitShowDialogue("Feel free to browse. I have texts on every subject imaginable.")
    elseif chapter >= 4 and chapter < 8 then
        UI:WaitShowDialogue("You should read about the Temporal Dimension.")
        UI:WaitShowDialogue("The ancient texts mention something called 'The Collapse'...")
    elseif chapter >= 8 and chapter < 13 then
        UI:WaitShowDialogue("The truth about your reincarnation... it is all here in the texts.")
        UI:WaitShowDialogue("The ancient human who sealed the first Collapse.")
    else
        UI:WaitShowDialogue("Everything we feared has come to pass.")
        UI:WaitShowDialogue("But you carry the hope of two lifetimes.")
    end
    
    GAME:CutsceneMode(false)
end

function new_era_city.Scrafty_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Scrafty)
    UI:WaitShowDialogue("Yo! Wanna train? The dojo is always open.")
    UI:WaitShowDialogue("No pain, no gain! Let us see what you have got!")
    GAME:CutsceneMode(false)
end

function new_era_city.Meowstic_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Meowstic)
    UI:WaitShowDialogue("Welcome... I sense great destiny surrounding you.")
    UI:WaitShowDialogue("The stars whisper of a coming catastrophe... and of a hero who can prevent it.")
    GAME:CutsceneMode(false)
end

function new_era_city.Sunflora_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Sunflora)
    UI:WaitShowDialogue("Oh hello! Welcome to the garden!")
    UI:WaitShowDialogue("Feel free to pick some berries. They are free for explorers!")
    GAME:CutsceneMode(false)
end

function new_era_city.Persian_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Persian)
    UI:WaitShowDialogue("Bank and Storage, at your service!")
    UI:WaitShowDialogue("Your money and items are safe here, even if you faint in a dungeon.")
    GAME:CutsceneMode(false)
end

function new_era_city.Absol_Action(chara, activator)
    GAME:CutsceneMode(true)
    UI:SetSpeaker(Absol)
    
    if SV.Chapter4.MetAbsol then
        UI:WaitShowDialogue("The Collapse grows stronger. I can feel it.")
        UI:WaitShowDialogue("My disaster sense has never been this active before.")
        UI:WaitShowDialogue("Please be careful out there.")
    else
        UI:WaitShowDialogue("...")
        UI:WaitShowDialogue("You carry a strange resonance. Like a memory from another life.")
    end
    
    GAME:CutsceneMode(false)
end

-------------------------------
-- Zone Transitions
-------------------------------
function new_era_city.Guild_Enter_Action(chara, activator)
    -- Transition to Guild Hall ground map
end

function new_era_city.Shop_Enter_Action(chara, activator)
    -- Open shop menu
end

return new_era_city
