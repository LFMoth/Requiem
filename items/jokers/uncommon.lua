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
        if context.final_scoring_step then
            local cards = {}
            for _, v in ipairs(context.scoring_hand) do
                if v:get_id() <= 10 and
                v:get_id() >= 0 and
                v:get_id() % 2 == 0 then
                    cards[#cards + 1] = v end -- get all scoring cards that are even           
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5) -- juice up the joker
                    return true
                end
            }))

            for _, v in ipairs(cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        v:flip() -- flip every cycled card after eachother
                        play_sound('cardSlide1', 1, 0.6)
                        return true
                    end
                }))
            end

            delay(0.4)

            for _, v in ipairs(cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        assert(SMODS.modify_rank(v, card.ability.extra.increase)) -- +1 to rank of every even card
                        play_sound('tarot2', 1, 0.6)
                        v:juice_up() -- juice up every card after eachother
                        return true
                    end
                }))
            end

            delay(0.4)

            for _, v in ipairs(cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        v:flip()
                        play_sound('cardSlide1', 1, 0.6)
                        return true
                    end
                }))
            end

            delay(0.5)
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
    config = { extra = { mult = 0, dollars = 2, uses = 1 } },
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
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then  --when boss blind is defeated
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
        if context.post_trigger and context.other_card == other_joker then
            ease_dollars(card.ability.extra.dollars)
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
        if context.final_scoring_step and G.GAME.current_round.hands_played == 0 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.play.cards[1]:flip()
                    play_sound('card1', 1)
                    G.play.cards[1]:juice_up(0.3, 0.3)

                    G.play.cards[#G.play.cards]:flip()
                    play_sound('card1', 1)
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
            delay(0.5)
        end
    end,
}

-- Arcing Orbit
SMODS.Joker {
    key = "arc",
    atlas = "jokers",
    pos = { x = 5, y = 2 },
    rarity = 2,
    blueprint_compat = false,
    immutable = false,
    cost = 5,
    req_credits = {
        art = "LFMoth",
        code = "LFMoth",
        idea = "LFMoth"
    },
    config = { extra = { odds = 1, denominator = 4, denominator2 = 2} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "req_credits", vars = { self.req_credits.art, self.req_credits.code, self.req_credits.idea } }
        return { vars = {card.ability.extra.odds, card.ability.extra.denominator, card.ability.extra.denominator2}}
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            if SMODS.pseudorandom_probability(card, 'req_arc', card.ability.extra.odds, card.ability.extra.denominator) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.6,
                    func = function()
                        add_tag(Tag('tag_rare'))
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end
                }))
            elseif SMODS.pseudorandom_probability(card, 'req_arc', card.ability.extra.odds, card.ability.extra.denominator2) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.6,
                    func = function()
                        add_tag(Tag('tag_rare'))
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end
                }))
            else
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.SECONDARY_SET.Tarot,
                    message_card = card
                }
            end
        end
        if context.forcetrigger then
            if SMODS.pseudorandom_probability(card, 'req_arc', card.ability.extra.odds, card.ability.extra.denominator) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.6,
                    func = function()
                        add_tag(Tag('tag_rare'))
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end
                }))
            elseif SMODS.pseudorandom_probability(card, 'req_arc', card.ability.extra.odds, card.ability.extra.denominator2) then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.6,
                    func = function()
                        add_tag(Tag('tag_rare'))
                        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                        return true
                    end
                }))
            else
                return {
                    message = localize('k_nope_ex'),
                    colour = G.C.SECONDARY_SET.Tarot,
                    message_card = card
                }
            end
        end
    end
}
