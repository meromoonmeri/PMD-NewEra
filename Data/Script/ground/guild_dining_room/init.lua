--[[
    PMD: New Era - Ground Script: Guild Dining Room
    Communal dining area for guild members.
]]--
require 'common'

local guild_dining_room = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function guild_dining_room.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init guild_dining_room <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function guild_dining_room.Enter(map)
    guild_dining_room.PlotScripting()
end

function guild_dining_room.Exit(map)
end

function guild_dining_room.Update(map)
end

function guild_dining_room.GameLoad(map)
    guild_dining_room.PlotScripting()
end

function guild_dining_room.GameSave(map)
end

function guild_dining_room.PlotScripting()
    -- Story-specific logic for Guild Dining Room
end

return guild_dining_room
