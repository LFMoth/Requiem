-- Membership
SMODS.Voucher {
    key = 'membership',
    atlas = "vouchers",
    pos = { x = 1, y = 0 },
    config = { extra = { active = false } },
    calculate = function(self, card, context)
        if context.type == 'shop_final_pass' and G.shop and not G.GAME.shop_free then -- Check if entering the shop
            card.ability.extra.active = true 
        end
        if context.buying_card and card.ability.extra.active then
            ease_dollars(context.card.cost)
            card.ability.extra.active = false
        end
    end,
}
-- GLOP!!!
SMODS.Voucher {
    key = 'glop',
    atlas = "vouchers",
    pos = { x = 3, y = 0 },
    config = { extra = { xmult = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step then
            return {xmult = card.ability.extra.xmult }
        end
    end,
}

-- Prism
SMODS.Voucher {
    key = 'prism',
    atlas = "vouchers",
    pos = { x = 5, y = 0 },
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.uncommon_mod = G.GAME.uncommon_mod + 0.4
                G.GAME.rare_mod = G.GAME.rare_mod + 0.2
                return true
            end
        }))
    end
}
