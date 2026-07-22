--[[
    PMD: New Era - Ground Script: Dream Altar
    Gateway to the Dream Dimension.
]]--
require 'common'

local dream_altar = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function dream_altar.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init dream_altar <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function dream_altar.Enter(map)
    dream_altar.PlotScripting()
end

function dream_altar.Exit(map)
end

function dream_altar.Update(map)
end

function dream_altar.GameLoad(map)
    dream_altar.PlotScripting()
end

function dream_altar.GameSave(map)
end

function dream_altar.PlotScripting()
    -- Story-specific logic for Dream Altar
end

return dream_altar
