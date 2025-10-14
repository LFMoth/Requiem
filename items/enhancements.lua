-- Enhancements
-- Card Cat
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
-- Shingle
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
    always_scores = false,
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
-- Stacked cards
SMODS.Enhancement {
    key = 'stacked',
    atlas = "enhancements",
    pos = { x = 3, y = 0 },
    config = { count = 5 },
    replace_base_card = false,
    no_rank = false,
    overrides_base_rank = false,
    no_suit = false,
    always_scores = false,
    shatters = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.count } }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then return {repetitions = card.ability.count} end
    end
}