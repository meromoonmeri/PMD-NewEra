--[[
    PMD: New Era - Ground Script: First Hilltop
    Where the hero first saw New Era City.
]]--
require 'common'

local first_hilltop = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function first_hilltop.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init first_hilltop <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function first_hilltop.Enter(map)
    first_hilltop.PlotScripting()
end

function first_hilltop.Exit(map)
end

function first_hilltop.Update(map)
end

function first_hilltop.GameLoad(map)
    first_hilltop.PlotScripting()
end

function first_hilltop.GameSave(map)
end

function first_hilltop.PlotScripting()
    -- Story-specific logic for First Hilltop
end

return first_hilltop
