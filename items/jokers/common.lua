-- ASCII Joker
SMODS.Joker {
    key = "ascii",
    atlas = "jokers",
    pos = { x = 0, y = 2 },
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    rarity = 1,
    blueprint_compat = true,
    immutable = false,
    cost = 4,
    config = { extra = { odds = 1, denominator = 4, xmult = 1.5 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
        return { vars = { card.ability.extra.odds, card.ability.extra.xmult, card.ability.extra.denominator } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() < 11 then -- Every time a card is played
            if SMODS.pseudorandom_probability(card, 'req_ascii', card.ability.extra.odds, card.ability.extra.denominator) then    -- Roll for chance
                return { xmult = card.ability.extra.xmult }
            end
        end
        if context.forcetrigger then
            return { xmult = card.ability.extra.xmult }
        end
    end
}
-- Bait
SMODS.Joker {
    key = "bait",
    atlas = "jokers",
    pos = { x = 8, y = 1 },
    rarity = 1,
    blueprint_compat = false,
    immutable = true,
    cost = 4,
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
    end,
    add_to_deck = function(self, card, context)
        G.GAME.rare_mod = G.GAME.rare_mod + 0.5 -- Rarity weight multiplier starts at 1
    end,
    remove_from_deck = function(self, card, context)
        G.GAME.rare_mod = G.GAME.rare_mod - 0.5
    end
}
-- Metajoker
SMODS.Joker {
    key = "metajoker",
    atlas = "jokers",
    pos = { x = 1, y = 2 },
    rarity = 1,
    blueprint_compat = true,
    immutable = false,
    cost = 8,
    config = { extra = { mult = 1 } },
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.post_trigger then
            return { mult = card.ability.extra.mult }
        end
        if context.forcetrigger then
            return { mult = card.ability.extra.mult }
        end
    end
}
-- Captain Jimbo
SMODS.Joker {
    key = "captain",
    atlas = "jokers",
    pos = { x = 1, y = 1 },
    rarity = 1,
    blueprint_compat = false,
    immutable = false,
    cost = 3,
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
    end,
    calculate = function(self, card, context)
        if context.before and next(context.poker_hands['Three of a Kind']) then
            SMODS.add_card({ set = "Joker", rarity = "Common" })
        end
    end
}
-- Evolved Joker
SMODS.Joker {
    key = "evolved",
    atlas = "jokers",
    pos = { x = 2, y = 1 },
    rarity = 1,
    blueprint_compat = true,
    immutable = false,
    cost = 3,
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    config = { extra = { chips = 0, increase = 10 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
        return { vars = { card.ability.extra.chips, card.ability.extra.increase } }
    end,
    calculate = function(self, card, context)
        if context.playing_card_added and not context.blueprint then           
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.increase
                    return true
                end
            }))
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
        if context.forcetrigger then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.increase
                    return true
                end
            }))
            return{
                chips = card.ability.extra.chips
            }
        end
    end
}