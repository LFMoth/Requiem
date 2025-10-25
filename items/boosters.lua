-- Voucher Packs
SMODS.Booster {
    key = "voucher_normal_1",
    weight = 0.5,
    kind = 'req_Voucher', -- You can also use Spectral if you want it to belong to the vanilla kind
    cost = 12,
    atlas = "boosters",
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 1 },
    group_key = "k_voucher_pack",
    draw_hand = false,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
            key = self.key:sub(1, -3), -- This uses the description key of the booster without the number at the end
        }
    end,
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.SPECTRAL_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.1,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        return {
            set = "Voucher",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append =
            "req_voucherpack"
        }
    end,
}
