--[[
    PMD: New Era - Ground Script: Cinccino Cafe
    The social hub of New Era City.
]]--
require 'common'

local cafe = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function cafe.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init cafe <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function cafe.Enter(map)
    cafe.PlotScripting()
end

function cafe.Exit(map)
end

function cafe.Update(map)
end

function cafe.GameLoad(map)
    cafe.PlotScripting()
end

function cafe.GameSave(map)
end

function cafe.PlotScripting()
    -- Story-specific logic for Cinccino Cafe
end

return cafe
