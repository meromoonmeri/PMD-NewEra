--[[
    PMD: New Era - Ground Script: Bank and Storage
    Persian financial institution.
]]--
require 'common'

local bank = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function bank.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init bank <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function bank.Enter(map)
    bank.PlotScripting()
end

function bank.Exit(map)
end

function bank.Update(map)
end

function bank.GameLoad(map)
    bank.PlotScripting()
end

function bank.GameSave(map)
end

function bank.PlotScripting()
    -- Story-specific logic for Bank and Storage
end

return bank
