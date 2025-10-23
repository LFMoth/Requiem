SMODS.Back {
    key = "sandbox",
    atlas = "decks",
    pos = { x = 0, y = 0 },
    config = { ante_scaling = 4, joker_slot = 5 },
    unlocked = true,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.joker_slot, self.config.ante_scaling } }
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.6,
            func = function()
                add_tag(Tag('tag_buffoon'))
                add_tag(Tag('tag_buffoon'))
                play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                return true
            end
        }))
    end,
}
SMODS.Back {
    key = "handful",
    atlas = "decks",
    pos = { x = 1, y = 0 },
    config = {hands = 46, extra_hand_bonus = 0},
    unlocked = true,
    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.joker_slot, self.config.ante_scaling } }
    end,
    apply = function(self, back)
        G.GAME.banned_keys['bl_needle'] = true
    end,
    calculate = function(self, card, context)
        if context.pre_discard and context.cardarea == G.discard then
                ease_discard(1)
        end
        if context.end_of_round then
            G.GAME.round_resets.hands = G.GAME.current_round.hands_left
        end
    end,
}