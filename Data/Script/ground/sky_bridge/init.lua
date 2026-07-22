--[[
    PMD: New Era - Ground Script: Sky Bridge
    Gateway to sky dungeons, built by Rayquaza.
]]--
require 'common'

local sky_bridge = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function sky_bridge.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init sky_bridge <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function sky_bridge.Enter(map)
    sky_bridge.PlotScripting()
end

function sky_bridge.Exit(map)
end

function sky_bridge.Update(map)
end

function sky_bridge.GameLoad(map)
    sky_bridge.PlotScripting()
end

function sky_bridge.GameSave(map)
end

function sky_bridge.PlotScripting()
    -- Story-specific logic for Sky Bridge
end

return sky_bridge
