SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/fella.lua"))()
    assert(SMODS.load_file("jokers/bluefella.lua"))()
    assert(SMODS.load_file("jokers/whitefella.lua"))()
    assert(SMODS.load_file("jokers/slatefella.lua"))()
    assert(SMODS.load_file("jokers/greenfella.lua"))()
    assert(SMODS.load_file("jokers/diolch.lua"))()
    assert(SMODS.load_file("jokers/sawmark.lua"))()
end
-- load the consumables
if true then
    assert(SMODS.load_file("consumables/thefriend.lua"))()
end
-- load the enhancements
if true then
    assert(SMODS.load_file("enhancements/missing.lua"))()
end

-- load the decks
if true then
    assert(SMODS.load_file("decks/missing_deck.lua"))()
end



assert(SMODS.load_file("rarities.lua"))()
-- assert(SMODS.load_file("malverk_compat.lua"))() -- broken somehow, i do not know how to fix it

--load sounds
assert(SMODS.load_file("sounds.lua"))()
SMODS.ObjectType({
    key = "elwatro_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "elwatro_elwatro_jokers",
    cards = {
        ["j_elwatro_fella"] = true,
        ["j_elwatro_bluefella"] = true,
        ["j_elwatro_whitefella"] = true,
        ["j_elwatro_slatefella"] = true,
        ["j_elwatro_greenfella"] = true,
        ["j_elwatro_diolch"] = true,
        ["j_elwatro_sawmark"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end