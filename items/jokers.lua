-- Jokers
-- Common Jokers
-- Archon shards
SMODS.Joker {
    key = "archonshardCrimson",
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
    pos = { x = 0, y = 1 },
    rarity = 2,
    blueprint_compat = true,
    immutable = false,
    cost = 1,
    in_pool = function() return false end,
    pools = {
        ["archon"] = true,
    },
    config = { extra = { Xmult = 2, suit = 'Hearts' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
        if context.final_scoring_step and context.cardarea == G.jokers then
            SMODS.destroy_cards(card)
        end
    end
}
SMODS.Joker {
    key = "archonshardGreen",
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
    pos = { x = 1, y = 1 },
    rarity = 2,
    blueprint_compat = true,
    immutable = false,
    cost = 1,
    in_pool = function() return false end,
    pools = {
        ["archon"] = true,
    },
    config = { extra = { Xmult = 2, suit = 'Clubs' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
        if context.final_scoring_step and context.cardarea == G.jokers then
            SMODS.destroy_cards(card)
        end
    end
}
SMODS.Joker {
    key = "archonshardSilver",
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
    pos = { x = 2, y = 1 },
    rarity = 2,
    blueprint_compat = true,
    immutable = false,
    cost = 1,
    in_pool = function() return false end,
    pools = {
        ["archon"] = true,
    },
    config = { extra = { Xmult = 2, suit = 'Clubs' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
        if context.final_scoring_step and context.cardarea == G.jokers then
            SMODS.destroy_cards(card)
        end
    end
}
SMODS.Joker {
    key = "archonshardGold",
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
    pos = { x = 3, y = 1 },
    rarity = 2,
    blueprint_compat = true,
    immutable = false,
    cost = 1,
    config = { extra = { Xmult = 2, suit = 'Diamonds' }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, localize(card.ability.extra.suit, 'suits_singular') } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and
            context.other_card:is_suit(card.ability.extra.suit) then
            return {
                Xmult = card.ability.extra.Xmult
            }
        end
        if context.final_scoring_step and context.cardarea == G.jokers then
            SMODS.destroy_cards(card)
        end
    end
}
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
-- AWESOME FUCKING SKELETON
SMODS.Joker {
    key = "awesomeFuckingSkeleton",
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    atlas = "jokers",
    pos = { x = 3, y = 0 },
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
            SMODS.add_card({key = "c_death"})
        end
        if context.forcetrigger then
            SMODS.add_card({key = "c_death"})
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
            return {chips = card.ability.chips}
        end
        if context.forcetrigger then
            return {chips = card.ability.chips}
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
        if context.forcetrigger then
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
        if context.forcetrigger then
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
        if context.forcetrigger then
            SMODS.add_card { set = "Base", enhancement = "m_req_cat", area = G.hand }
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
        if context.forcetrigger then
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
