-- load hooks file for funnies
SMODS.load_file("lib/hooks.lua")()
-- enable optional stuff for funnies
SMODS.current_mod.optional_features = function()
    return {
        quantum_enhancements = true,
        post_trigger = true,
        retrigger_joker = true,
        cardareas = {discard = true}
    }
end

-- globals
Requiem = SMODS.current_mod
Requiem.path = "" .. SMODS.current_mod.path

-- Load main files
SMODS.load_file("items/atlases.lua")()
SMODS.load_file("items/jokers.lua")()
SMODS.load_file("items/enhancements.lua")()
SMODS.load_file("items/tarots.lua")()
SMODS.load_file("items/decks.lua")()
SMODS.load_file("items/vouchers.lua")()

-- credits stolen from valkarri
SMODS.load_file("lib/credits_ui.lua")()

-- Extra tabs for the mod's menu
SMODS.current_mod.extra_tabs = function()
    return {
        {
            label = "Credits",
            tab_definition_function = Requiem.credits_ui_def
        },
    }
end

-- Load crossmod files
if next(SMODS.find_mod("entr")) then
    SMODS.load_file("items/crossmod/entropy/enhancements.lua")()
    SMODS.load_file("items/crossmod/entropy/frauds.lua")()
    SMODS.load_file("items/crossmod/entropy/decks.lua")()
end
if next(SMODS.find_mod("Cryptid")) then
    SMODS.load_file("items/crossmod/cryptid/decks.lua")()
end
