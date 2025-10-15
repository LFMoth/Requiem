SMODS.Atlas {
    key = "frauds",
    path = "crossmod/entropy/frauds.png",
    px = 71,
    py = 95
}
-- Knight
SMODS.Consumable {
    key = 'knight',
    set = 'Fraud',
    atlas = 'frauds',
    inversion = "c_req_archon",
    pos = { x = 3, y = 0 },
    set_badges = function(self, card, badges)
        SMODS.create_mod_badges({ mod = SMODS.find_mod("entr")[1] }, badges)
    end,
    config = { max_highlighted = 1, mod_conv = 'm_req_exalted' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
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
                    G.hand.highlighted[i]:set_ability(card.ability.mod_conv)
                    return true
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
SMODS.Consumable {
    key = 'citadel',
    set = 'Fraud',
    atlas = 'frauds',
    inversion = "c_req_colossus",
    pos = { x = 2, y = 0 },
    set_badges = function(self, card, badges)
        SMODS.create_mod_badges({ mod = SMODS.find_mod("entr")[1] }, badges)
    end,
    config = { max_highlighted = 1 },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_req_shingle']
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = 'm_req_shingle' } } }
    end,
    use = function(self, card, area, copier)
        if SMODS.has_enhancement(G.hand.highlighted[i], "m_req_shingle") == true then
            local durability = G.hand.highlighted[i].ability.durability
            SMODS.destroy_cards(G.hand.highlighted[i])
            return { dollars = durability }
        end
    end,
    can_use = function(self, card)
        return G.hand and #G.hand.highlighted > 0
        and #G.hand.highlighted <= card.ability.max_highlighted
        and SMODS.has_enhancement(G.hand.highlighted[i], "m_req_shingle")
    end
}
