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
        mod_conv = "m_req_cat"
    },
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.progress, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers then
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
        end
        if context.end_of_round and context.cardarea == G.jokers and context.beat_boss then
            card.ability.progress = card.ability.progress + 1
            if card.ability.progress >= 2 then
                SMODS.add_card({ key = 'j_req_machocat' })
                SMODS.destroy_cards(card)
            end
        end
        if context.forcetrigger then
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
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
    config = {
        mod_conv = "m_req_cat"
    },
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers then
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
        end
        if context.forcetrigger then
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
        end
    end
}
-- Wish
SMODS.Joker {
    key = "wish",
    atlas = "jokers",
    pos = { x = 4, y = 0 },
    rarity = 3,
    blueprint_compat = false,
    immutable = true,
    cost = 10,
    req_credits = {
        art = "LFMoth",
        code = "somethingcom",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
    end,
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
-- Primed sure footed
SMODS.Joker {
    key = "primedSureFooted",
    atlas = "jokers",
    pos = { x = 7, y = 1 },
    rarity = 3,
    blueprint_compat = true,
    immutable = false,
    cost = 10,
    config = { extra = { odds = 1, discards = 1, denominator = 3 } },
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
        return { vars = { card.ability.extra.odds, card.ability.extra.denominator } }
    end,
    calculate = function(self, card, context)
        if context.pre_discard and context.cardarea == G.discard then
            if SMODS.pseudorandom_probability(card, 'req_primedSureFooted', card.ability.extra.odds, card.ability.extra.denominator) then
                ease_discard(1)
            end
        end
    end
}
-- Constipated Joker
SMODS.Joker {
    key = "constipated",
    atlas = "jokers",
    pos = { x = 2, y = 2 },
    rarity = 3,
    blueprint_compat = false,
    immutable = false,
    cost = 10,
    config = { extra = { needed = 20, current = 0, increase = 1, discards = 0 } },
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
        return { vars = { card.ability.extra.needed, card.ability.extra.current, card.ability.extra.increase, card.ability.extra.discards } }
    end,
    calculate = function(self, card, context)
        if context.selling_card then
            if card.ability.extra.current < card.ability.extra.needed then
                card.ability.extra.current = card.ability.extra.current + 1
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card.ability.extra.current = 0
                        card.ability.extra.discards = card.ability.extra.discards + card.ability.extra.increase
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.increase
                        ease_discard(card.ability.extra.increase)
                        return true
                    end
                }))
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    message_card = card
                }
            end
        end
    end,
    remove_from_deck = function(self, card, context)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discards
        ease_discard(-card.ability.extra.discards)
    end
}
-- Premium Summonable Joker
SMODS.Joker {
    key = "premiumsummonable",
    atlas = "jokers",
    pos = { x = 3, y = 1 },
    rarity = 3,
    blueprint_compat = true,
    immutable = false,
    cost = 10,
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    config = { extra = { mult = 4, hands = 1, h_size = 3 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
        return { vars = { card.ability.extra.mult, card.ability.extra.h_size, card.ability.extra.hands } }
    end,
     add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            ease_hands_played(-card.ability.extra.hands)
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.forcetrigger then
            ease_hands_played(-card.ability.extra.hands)
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}