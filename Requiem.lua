-- load hooks file for funnies
SMODS.load_file("lib/hooks.lua")()
-- enable quantum enhancements for enhancement shenanigans
SMODS.current_mod.optional_features = function()
    return {
        quantum_enhancements = true
    }
end

--Atlas
SMODS.Atlas {
    key = "jokers",
    path = "jokers.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "enhancements",
    path = "enhancements.png",
    px = 71,
    py = 95
}
-- Jokers
-- Common Jokers

-- Uncommon Jokers

-- Heister
SMODS.Joker {
    key = "heister",
    atlas = "jokers",
    pos = { x = 8, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    immutable = false,
    cost = 8,
    config = { extra = { dollars = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.check_enhancement and context.other_card.config.center.key == 'm_gold' then
            return {
                m_steel = true
            }
        end
    end
}
-- Retro Joker
SMODS.Joker {
    key = "retro",
    atlas = "jokers",
    pos = { x = 5, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    immutable = false,
    cost = 6,
    config = { extra = { increase = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.increase } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() <= 10 and
                context.other_card:get_id() >= 0 and
                context.other_card:get_id() % 2 == 0 then
                SMODS.modify_rank(context.other_card, card.ability.extra.increase)
            end
        end
    end
}
-- Pop-tart (WIP)
SMODS.Joker {
    key = "poptart",
    atlas = "jokers",
    pos = { x = 6, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    immutable = true,
    cost = 4,
    in_pool = function() return false end,
}
-- Forecast (WIP)
SMODS.Joker {
    key = "forecast",
    atlas = "jokers",
    pos = { x = 9, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    immutable = true,
    cost = 9,
    in_pool = function() return false end,
}
-- Extreme Joker
SMODS.Joker {
    key = "extreme",
    atlas = "jokers",
    pos = { x = 7, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    immutable = true,
    cost = 4,
    calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers and context.beat_boss then
            local newedition = Cryptid.poll_random_edition()
            card:set_edition(newedition, true, false)
        end
    end
}

-- Rare Jokers

-- Joker Cat
SMODS.Joker {
    key = "cat",
    atlas = "jokers",
    pos = { x = 1, y = 0 },
    rarity = 3,
    blueprint_compat = true,
    immutable = true,
    cost = 10,
    config = {
        progress = 0,
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.progress } }
    end,
    calculate = function(self, card, context)
        if context.drawing_cards then
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
        end
        if context.end_of_round and context.cardarea == G.jokers and context.beat_boss then
            card.ability.progress = card.ability.progress + 1
            if card.ability.progress >= 2 then
                SMODS.add_card({key = 'j_req_machocat'})
                SMODS.destroy_cards(card)
            end
        end
    end
}
-- Macho Joker Cat
SMODS.Joker {
    key = "machocat",
    atlas = "jokers",
    pos = { x = 2, y = 0 },
    rarity = 3,
    blueprint_compat = false,
    immutable = true,
    cost = 20,
    in_pool = function() return false end,
    calculate = function(self, card, context)
        if context.drawing_cards then
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
        end
    end
}
-- Crazed Macho Joker Cat (WIP)
-- Wish (WIP)
SMODS.Joker {
    key = "wish",
    atlas = "jokers",
    pos = { x = 4, y = 0 },
    rarity = 3,
    blueprint_compat = false,
    immutable = true,
    cost = 10,
    calculate = function(self, card, context) -- Shoutouts to somethingcom for the code
        if context.before and not context.blueprint then
            if G.GAME.hands[context.scoring_name].played <= 1 then
                return {
                    func = function()
                        SMODS.smart_level_up_hand(card, context.scoring_name)
                    end
                }
            end
            local hands, played = {}, math.huge
            for k, v in pairs(G.GAME.hands) do
                if SMODS.is_poker_hand_visible(k) then
                    if v.played < played then
                        hands = { [k] = true }
                        played = v.played
                    end
                elseif v.played == played then
                    hands[k] = true
                    played = v.played
                end
            end
            if hands[context.scoring_name] then
                return {
                    func = function()
                        SMODS.smart_level_up_hand(card, context.scoring_name)
                    end
                }
            end
        end
    end
}

-- Enhancements
-- Card Cats

SMODS.Enhancement {
    key = 'cat',
    atlas = "enhancements",
    pos = { x = 1, y = 0 },
    config = { mult = 1 },
    replace_base_card = true,
    no_rank = false,
    overrides_base_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.mult } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return { mult = card.ability.mult }
        end
        if context.end_of_round then
            SMODS.destroy_cards(card)
        end
    end
}
