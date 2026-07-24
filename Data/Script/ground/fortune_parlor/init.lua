--[[
    PMD: New Era - Ground Script: Meowstic Fortune Parlor
    Mysterious fortune telling shop.
]]--
require 'common'

local fortune_parlor = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function fortune_parlor.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init fortune_parlor <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function fortune_parlor.Enter(map)
    fortune_parlor.PlotScripting()
end

function fortune_parlor.Exit(map)
end

function fortune_parlor.Update(map)
end

function fortune_parlor.GameLoad(map)
    fortune_parlor.PlotScripting()
end

function fortune_parlor.GameSave(map)
end

function fortune_parlor.PlotScripting()
    -- Story-specific logic for Meowstic Fortune Parlor
end

return fortune_parlor
