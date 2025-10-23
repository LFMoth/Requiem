SMODS.Back {
    key = "inbetween",
    atlas = "decks",
    pos = { x = 3, y = 0 },
    unlocked = true,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            func = function()
                local c = create_card("Spectral", G.consumeables, nil, nil, nil, nil, "c_entr_flipside") -- Create a negative, aleph flipside
                c.ability.cry_absolute = true
                c.ability.entr_aleph = true
                c.ability.eternal = true
                c:add_to_deck()
                G.consumeables:emplace(c)
                c:set_edition("e_negative")
                return true
            end
        }))
    end,
    calculate = function(self, card, context)
        if  context.using_consumeable and context.consumeable.config.center.key == "c_entr_flipside" then -- check for consumeable being used
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            func = function()
                local c = create_card("Spectral", G.consumeables, nil, nil, nil, nil, "c_entr_flipside") -- Create a negative, aleph flipside
                c.ability.cry_absolute = true
                c.ability.entr_aleph = true
                c.ability.eternal = true
                c:add_to_deck()
                G.consumeables:emplace(c)
                c:set_edition("e_negative")
                return true
            end
        }))
        end
    end,
}
