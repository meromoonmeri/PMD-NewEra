--[[
    PMD: New Era - Ground Script: Pokemon Hospital
    Chansey medical facility.
]]--
require 'common'

local hospital = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function hospital.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init hospital <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function hospital.Enter(map)
    hospital.PlotScripting()
end

function hospital.Exit(map)
end

function hospital.Update(map)
end

function hospital.GameLoad(map)
    hospital.PlotScripting()
end

function hospital.GameSave(map)
end

function hospital.PlotScripting()
    -- Story-specific logic for Pokemon Hospital
end

return hospital
