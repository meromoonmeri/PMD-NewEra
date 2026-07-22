--[[
    PMD: New Era - Ground Script: Hero Room
    The personal quarters of the exploration team.
]]--
require 'common'

local guild_heros_room = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function guild_heros_room.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init guild_heros_room <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function guild_heros_room.Enter(map)
    guild_heros_room.PlotScripting()
end

function guild_heros_room.Exit(map)
end

function guild_heros_room.Update(map)
end

function guild_heros_room.GameLoad(map)
    guild_heros_room.PlotScripting()
end

function guild_heros_room.GameSave(map)
end

function guild_heros_room.PlotScripting()
    -- Story-specific logic for Hero Room
end

return guild_heros_room
