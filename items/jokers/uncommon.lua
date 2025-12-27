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
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
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
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
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
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['c_death']
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
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
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
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
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "StarlightClovers"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
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
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
    end,
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
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
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
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
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
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
    end,
    add_to_deck = function(self, card, context)
        G.GAME.common_mod = G.GAME.common_mod - 1 -- Rarity weight multiplier starts at 1
    end,
    remove_from_deck = function(self, card, context)
        G.GAME.common_mod = G.GAME.common_mod + 1
    end
}

-- Mountaineer
SMODS.Joker {
    key = "mountaineer",
    atlas = "jokers",
    pos = { x = 9, y = 1 },
    rarity = 2,
    blueprint_compat = false,
    immutable = true,
    cost = 6,
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn and not context.blueprint then
            local eval = function() return G.GAME.current_round.hands_played == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.before and G.GAME.current_round.hands_played == 0 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            local percent = 1.15 - (1 - 0.999) / (#G.play.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.play.cards[1]:flip()
                    play_sound('card1', percent)
                    G.play.cards[1]:juice_up(0.3, 0.3)

                    G.play.cards[#G.play.cards]:flip()
                    play_sound('card1', percent)
                    G.play.cards[#G.play.cards]:juice_up(0.3, 0.3)
                    return true
                end
            }))
            delay(0.2)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if G.play.cards[1] ~= G.play.cards[#G.play.cards] then
                        copy_card(G.play.cards[1], G.play.cards[#G.play.cards])
                    end
                    return true
                end
            }))
            local percent = 0.85 + (1 - 0.999) / (#G.play.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.play.cards[1]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.play.cards[1]:juice_up(0.3, 0.3)

                    G.play.cards[#G.play.cards]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.play.cards[#G.play.cards]:juice_up(0.3, 0.3)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
}