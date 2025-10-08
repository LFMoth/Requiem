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
SMODS.Atlas {
    key = "tarots",
    path = "tarots.png",
    px = 71,
    py = 95
}
-- Jokers
-- Common Jokers

-- Uncommon Jokers

-- Heister
SMODS.Joker {
    key = "heister",
    cry_credits = {
		idea = {
			"LFMoth",
		},
		art = {
			"LFMoth",
		},
		code = {
			"LFMoth",
		},
	},
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
    cry_credits = {
		idea = {
			"LFMoth",
		},
		art = {
			"LFMoth",
		},
		code = {
			"LFMoth",
		},
	},
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
-- Pop-tart
SMODS.Joker {
    key = "poptart",
    cry_credits = {
		idea = {
			"starlightclovers",
		},
		art = {
			"LFMoth",
		},
		code = {
			"LFMoth",
		},
	},
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
    end
}
-- Forecast (WIP)
SMODS.Joker {
    key = "forecast",
    cry_credits = {
		idea = {
			"LFMoth",
		},
		art = {
			"LFMoth",
		},
		code = {
			"LFMoth",
		},
	},
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
     cry_credits = {
		idea = {
			"LFMoth",
		},
		art = {
			"LFMoth",
		},
		code = {
			"LFMoth",
		},
	},
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
    cry_credits = {
		idea = {
			"LFMoth",
		},
		art = {
			"LFMoth",
		},
		code = {
			"LFMoth",
		},
	},
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
    cry_credits = {
		idea = {
			"LFMoth",
		},
		art = {
			"LFMoth",
		},
		code = {
			"LFMoth",
		},
	},
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
        if context.drawing_cards then
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
        end
    end
}
-- Wish
SMODS.Joker {
    key = "wish",
    cry_credits = {
		idea = {
			"LFMoth",
		},
		art = {
			"LFMoth",
		},
		code = {
			"somethingcom",
		},
	},
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
    cry_credits = {
		idea = {
			"LFMoth",
		},
		art = {
			"LFMoth",
		},
		code = {
			"LFMoth + somethingcom",
		},
	},
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
SMODS.Enhancement {
    key = 'shingle',
    cry_credits = {
		idea = {
			"LFMoth",
		},
		art = {
			"LFMoth",
		},
		code = {
			"LFMoth",
		},
	},
    atlas = "enhancements",
    pos = { x = 2, y = 0 },
    config = { durability = 3 },
    replace_base_card = false,
    no_rank = false,
    overrides_base_rank = false,
    no_suit = false,
    always_scores = true,
    shatters = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.durability, card.ability.durability * 1.2 } }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.play then
            card.ability.durability = card.ability.durability - 1
            if card.ability.durability < 1 then
                SMODS.destroy_cards(card)
            end
        end
        if context.cardarea == G.play and context.main_scoring then
            return { mult = card.ability.durability * 1.2 }
        end
    end
}

--Tarots

SMODS.Consumable {
    key = 'colossus',
    set = 'Tarot',
    atlas = "tarots",
    pos = { x = 2, y = 0 },
    config = { max_highlighted = 1, mod_conv = 'm_req_shingle', durability_inc = 5 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv }, card.ability.durability_inc } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if SMODS.has_enhancement(G.hand.highlighted[i], "m_req_shingle") == false then
                    G.hand.highlighted[i]:set_ability(card.ability.mod_conv)
                    return true
                    end
                    if SMODS.has_enhancement(G.hand.highlighted[i], "m_req_shingle") == true then
                    G.hand.highlighted[i].ability.durability = G.hand.highlighted[i].ability.durability + card.ability.durability_inc
                    return true
                    end
                end
            }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.highlighted[i]:flip()
                    play_sound('tarot2', percent, 0.6)
                    G.hand.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))
        delay(0.5)
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0 and #G.hand.highlighted <= card.ability.max_highlighted
    end

}
