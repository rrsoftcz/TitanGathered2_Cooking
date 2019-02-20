TITAN_GATHERED_PLUGIN_ID = "Cooking"
tgcPluginDb = {}

TitanGathered2_Cooking = {}
-- Reduce the chance of functions and variables colliding with another addon.
local tgc = TitanGathered2_Cooking
local infoBoardData = {}
local tg = TitanGathered2

tgc.id = TITAN_GATHERED_PLUGIN_ID
tgc.addon = "TitanGathered2_Cooking"
tgc.email = "bajtlamer@gmail.com"
tgc.www = "www.rrsoft.cz"

--  Get data from the TOC file.
tgc.version = tostring(GetAddOnMetadata(tgc.addon, "Version")) or "Unknown"
tgc.author = tostring(GetAddOnMetadata(tgc.addon, "Author")) or "Unknown"


for _, _category in pairs(TGC_PLUGIN_CATEGORIES) do
    table.insert(TG_CATEGORIES, _category)
end


function tgc.Button_OnLoad(self)
	echo(tgc.addon.." ("..TitanUtils_GetGreenText(tgc.version).."|cffff8020) loaded! Created By "..tgc.author)

	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_LEAVING_WORLD")
    self:RegisterEvent("LOOT_OPENED")
    tgc.registerPlugin()
    tgc.registerPluginMinable()
end

function tgc.registerPlugin()
    table.insert(tgPlugins, tgc)
end

function tgc.registerPluginMinable()
    for _, _m in pairs(TGC_MINABLES)do
        table.insert(TG_MINABLES, _m)
    end
end

-- Event
function tgc.Button_OnEvent(self, event)
    -- EMPTY
end

function tgc.getGatherableSourceObject(objectId)
    for _, _m in pairs(TGC_MINABLES) do
        if (_m.id == objectId) then
            return _m
        end
    end
    return {id = objectId, name = nil}
end
