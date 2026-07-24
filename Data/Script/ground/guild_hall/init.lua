--[[
    PMD: New Era - Ground Script: Guild Hall
    The main hall of Guild New Era where missions are accepted.
]]--
require 'common'

local guild_hall = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function guild_hall.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init guild_hall <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function guild_hall.Enter(map)
    guild_hall.PlotScripting()
end

function guild_hall.Exit(map)
end

function guild_hall.Update(map)
end

function guild_hall.GameLoad(map)
    guild_hall.PlotScripting()
end

function guild_hall.GameSave(map)
end

function guild_hall.PlotScripting()
    -- Story-specific logic for Guild Hall
end

return guild_hall
