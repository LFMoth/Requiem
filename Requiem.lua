-- load hooks file for funnies
SMODS.load_file("lib/hooks.lua")()
-- enable quantum enhancements for enhancement shenanigans
SMODS.current_mod.optional_features = function()
    return {
        quantum_enhancements = true,
        post_trigger = true
    }
end


-- Load main files
SMODS.load_file("items/atlases.lua")()
SMODS.load_file("items/jokers.lua")()
SMODS.load_file("items/enhancements.lua")()
SMODS.load_file("items/tarots.lua")()

-- Entwopy
if next(SMODS.find_mod("entr")) then -- Uses the mod's ID
SMODS.load_file("items/crossmod/entropy/enhancements.lua")()
    SMODS.load_file("items/crossmod/entropy/frauds.lua")()
end