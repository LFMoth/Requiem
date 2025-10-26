-- Jokers
-- Common Jokers

-- ASCII Joker
SMODS.Joker {
    key = "ascii",
    atlas = "jokers",
    pos = { x = 0, y = 2 },
    rarity = 1,
    blueprint_compat = true,
    immutable = false,
    cost = 4,
    config = { extra = { chance = 1, xmult = 1.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chance, card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() < 11 then -- Every time a card is played
            if SMODS.pseudorandom_probability(card, 'req_ascii', card.ability.extra.chance, 4) then    -- Roll for chance
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
    loc_vars = function(self, info_queue, card)
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
    calculate = function(self, card, context)
        if context.before and next(context.poker_hands['Three of a Kind']) then
            SMODS.add_card({ set = "Joker", rarity = "Common" })
        end
    end
}
-- Uncommon Jokers

-- Heister
SMODS.Joker {
    key = "heister",
    atlas = "jokers",
    pos = { x = 8, y = 0 },
    rarity = 2,
    blueprint_compat = false,
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
    blueprint_compat = true,
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
-- AWESOME FUCKING SKELETON
SMODS.Joker {
    key = "awesomeFuckingSkeleton",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    atlas = "jokers",
    pos = { x = 3, y = 0 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['c_death']
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            SMODS.add_card({ key = "c_death" })
        end
        if context.forcetrigger then
            SMODS.add_card({ key = "c_death" })
        end
    end
}
-- Somebody
SMODS.Joker {
    key = "somebody",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    atlas = "jokers",
    pos = { x = 4, y = 1 },
    config = { extra = { chips = 20 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.post_trigger then
            return { chips = card.ability.chips }
        end
        if context.forcetrigger then
            return { chips = card.ability.chips }
        end
    end
}
-- Pop-tart
SMODS.Joker {
    key = "poptart",
    atlas = "jokers",
    pos = { x = 6, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    immutable = false,
    cost = 4,
    config = { extra = { mult = 0, dollars = 3, uses = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.dollars, card.ability.extra.uses } }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.play then
            card.ability.extra.uses = card.ability.extra.uses - 1
            if card.ability.extra.uses < 1 then
                SMODS.destroy_cards(card)
            end
            return { func = function() mod_mult(card.ability.extra.mult) end }
        end
        if context.individual and context.cardarea == G.play then
            return {
                dollars = card.ability.extra.dollars
            }
        end
        if context.forcetrigger then
            return {
                dollars = card.ability.extra.dollars
            }
        end
    end
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
        if context.forcetrigger then
            local newedition = Cryptid.poll_random_edition()
            card:set_edition(newedition, true, false)
        end
    end
}
-- Investor
SMODS.Joker {
    key = "investor",
    atlas = "jokers",
    pos = { x = 5, y = 1 },
    rarity = 2,
    blueprint_compat = true,
    immutable = false,
    cost = 10,
    config = { extra = { dollars = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        local other_joker = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
        end
        if context.post_trigger and context.cardarea == other_joker then
            return { dollars = card.ability.extra.dollars }
        end
    end
}
-- Bricked-Up Joker
SMODS.Joker {
    key = "brickedup",
    atlas = "jokers",
    pos = { x = 6, y = 1 },
    rarity = 2,
    blueprint_compat = true,
    immutable = false,
    cost = 5,
    enhancement_gate = 'm_req_shingle',
    config = {
        mod_conv = "m_req_shingle",
        extra = {
            durability_inc = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.extra.durability_inc, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and SMODS.has_enhancement(card.ability.mod_conv, other_card) then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                other_card.ability.durability = other_card.ability.durablity + ability.extra.durability_inc
            end
        end
    end,
}

-- I SKIN COMMON JOKERS !!!!
SMODS.Joker {
    key = "skin",
    atlas = "jokers",
    pos = { x = 0, y = 1 },
    rarity = 2,
    blueprint_compat = false,
    immutable = true,
    cost = 4,
    add_to_deck = function(self, card, context)
        G.GAME.common_mod = G.GAME.common_mod - 1 -- Rarity weight multiplier starts at 1
    end,
    remove_from_deck = function(self, card, context)
        G.GAME.common_mod = G.GAME.common_mod + 1
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
        mod_conv = "m_req_cat"
    },
    loc_vars = function(self, info_queue, card)
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
    loc_vars = function(self, info_queue, card)
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
    config = { extra = { chance = 1, discards = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chance } }
    end,
    calculate = function(self, card, context)
        if context.pre_discard and context.cardarea == G.discard then
            if SMODS.pseudorandom_probability(card, 'req_primedSureFooted', card.ability.extra.chance, 4) then
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
    cost = 8,
    config = { extra = { needed = 20, current = 0, increase = 1, discards = 0 } },
    loc_vars = function(self, info_queue, card)
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
