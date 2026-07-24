--[[
    PMD: New Era - Ground Script: Residential Area
    Living quarters for civilians.
]]--
require 'common'

local residential = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function residential.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init residential <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function residential.Enter(map)
    residential.PlotScripting()
end

function residential.Exit(map)
end

function residential.Update(map)
end

function residential.GameLoad(map)
    residential.PlotScripting()
end

function residential.GameSave(map)
end

function residential.PlotScripting()
    -- Story-specific logic for Residential Area
end

return residential
