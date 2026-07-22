--[[
    PMD: New Era - Ground Script: Ancient Ruins
    Archaeological site from the first Collapse era.
]]--
require 'common'

local ancient_ruins = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function ancient_ruins.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init ancient_ruins <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function ancient_ruins.Enter(map)
    ancient_ruins.PlotScripting()
end

function ancient_ruins.Exit(map)
end

function ancient_ruins.Update(map)
end

function ancient_ruins.GameLoad(map)
    ancient_ruins.PlotScripting()
end

function ancient_ruins.GameSave(map)
end

function ancient_ruins.PlotScripting()
    -- Story-specific logic for Ancient Ruins
end

return ancient_ruins
