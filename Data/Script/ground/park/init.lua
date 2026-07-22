--[[
    PMD: New Era - Ground Script: Sunflora Park
    Peaceful garden area.
]]--
require 'common'

local park = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function park.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init park <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function park.Enter(map)
    park.PlotScripting()
end

function park.Exit(map)
end

function park.Update(map)
end

function park.GameLoad(map)
    park.PlotScripting()
end

function park.GameSave(map)
end

function park.PlotScripting()
    -- Story-specific logic for Sunflora Park
end

return park
