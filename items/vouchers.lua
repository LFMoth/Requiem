-- Membership
SMODS.Voucher {
    key = 'membership',
    atlas = "vouchers",
    pos = { x = 1, y = 0 },
    config = { extra = { active = false } },
    calculate = function(self, card, context)
        if context.starting_shop and not G.GAME.shop_free then -- Check if entering the shop
            card.ability.extra.active = true 
        end
        if context.buying_card and card.ability.extra.active then
            ease_dollars(context.card.cost)
            card.ability.extra.active = false
        end
    end,
}
-- VIP
SMODS.Voucher {
    key = 'vip',
    atlas = "vouchers",
    pos = { x = 2, y = 0 },
    requires = { 'v_req_membership' },
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and context.beat_boss then
            add_tag(Tag('tag_coupon'))
        end
    end,
}
-- GLOP!!!
SMODS.Voucher {
    key = 'glop',
    atlas = "vouchers",
    pos = { x = 3, y = 0 },
    config = { extra = { xmult = 1.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step then
            return {xmult = card.ability.extra.xmult }
        end
    end,
}
-- SFARK!!!
SMODS.Voucher {
    key = 'sfark',
    atlas = "vouchers",
    pos = { x = 4, y = 0 },
    requires = { 'v_req_glop' },
    config = { extra = { xchips = 1.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips } }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step then
            return {xchips = card.ability.extra.xchips }
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
                G.GAME.common_mod = G.GAME.common_mod - 0.3
                return true
            end
        }))
    end
}
