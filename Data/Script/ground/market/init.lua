--[[
    PMD: New Era - Ground Script: Market District
    Shopping area for items and equipment.
]]--
require 'common'

local market = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function market.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init market <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function market.Enter(map)
    market.PlotScripting()
end

function market.Exit(map)
end

function market.Update(map)
end

function market.GameLoad(map)
    market.PlotScripting()
end

function market.GameSave(map)
end

function market.PlotScripting()
    -- Story-specific logic for Market District
end

return market
