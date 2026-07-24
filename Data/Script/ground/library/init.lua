--[[
    PMD: New Era - Ground Script: Gothitelle Library
    Knowledge center with restricted section.
]]--
require 'common'

local library = {}
local MapStrings = {}

-------------------------------
-- Map Callbacks
-------------------------------
function library.Init(map)
    DEBUG.EnableDbgCoro()
    print('=>> Init library <<=')
    MapStrings = COMMON.AutoLoadLocalizedStrings()
end

function library.Enter(map)
    library.PlotScripting()
end

function library.Exit(map)
end

function library.Update(map)
end

function library.GameLoad(map)
    library.PlotScripting()
end

function library.GameSave(map)
end

function library.PlotScripting()
    -- Story-specific logic for Gothitelle Library
end

return library
