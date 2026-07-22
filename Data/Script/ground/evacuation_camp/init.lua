--[[
    PMD: New Era - Ground Script: Hero Camp
    Emergency settlement during dimensional crisis.
]]--
require 'common'

local evacuation_camp = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function evacuation_camp.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init evacuation_camp <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function evacuation_camp.Enter(map)
    evacuation_camp.PlotScripting()
end

function evacuation_camp.Exit(map)
end

function evacuation_camp.Update(map)
end

function evacuation_camp.GameLoad(map)
    evacuation_camp.PlotScripting()
end

function evacuation_camp.GameSave(map)
end

function evacuation_camp.PlotScripting()
    -- Story-specific logic for Hero Camp
end

return evacuation_camp
