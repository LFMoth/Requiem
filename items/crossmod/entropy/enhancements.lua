-- Exalted
SMODS.Enhancement {
    key = 'exalted',
    pos = { x = 3, y = 0 },
    atlas = "enhancements",
    in_pool = function() return false end,
    config = { bonus = 100, handu = 1 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus, card.ability.handu } }
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            ease_hands_played(-card.ability.handu)
            return { vars = { card.ability.bonus } }
        end
    end,
}
