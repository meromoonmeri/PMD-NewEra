--[[
    PMD: New Era - Ground Script: Exploration Dojo
    Training facility run by Scrafty.
]]--
require 'common'

local dojo = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function dojo.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init dojo <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function dojo.Enter(map)
    dojo.PlotScripting()
end

function dojo.Exit(map)
end

function dojo.Update(map)
end

function dojo.GameLoad(map)
    dojo.PlotScripting()
end

function dojo.GameSave(map)
end

function dojo.PlotScripting()
    -- Story-specific logic for Exploration Dojo
end

return dojo
