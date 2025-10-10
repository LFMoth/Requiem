local colours = {
    code = HEX("FFFFFF"),
    art = HEX("FFFFFF"),
    shader = HEX("FFFFFF")
}
local text_scale = 0.30
local scale = 0.5
function Requiem.credits_ui_def()
    local ui = {
        n = G.UIT.ROOT,
        config = { align = "cm", minh = G.ROOM.T.h * scale, minw = G.ROOM.T.w * scale, padding = 0.0, r = 0.1, colour = G.C.GREY },
        nodes = {
            {
                n = G.UIT.R,
                config = {},
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cl", minw = 3, padding = 0.1 },
                        nodes = {
                            { n = G.UIT.R, config = {}, nodes = { { n = G.UIT.T, config = { text = "Programming", colour = colours.code, scale = text_scale * 2, shadow = true, align = "tm" } } } },
                            { n = G.UIT.R, config = {}, nodes = { { n = G.UIT.T, config = { text = "LFMoth", colour = colours.code, scale = text_scale, shadow = true, align = "tm" } } } },
                            { n = G.UIT.R, config = {}, nodes = { { n = G.UIT.T, config = { text = "Somethingcom", colour = colours.code, scale = text_scale, shadow = true, align = "tm" } } } },
                        }
                    },
                    {
                        n = G.UIT.C,
                        config = { align = "cm", minw = 3, padding = 0.1 },
                        nodes = {
                            { n = G.UIT.R, config = {}, nodes = { { n = G.UIT.T, config = { text = "Art", colour = colours.code, scale = text_scale * 2, shadow = true, align = "tm" } } } },
                            { n = G.UIT.R, config = {}, nodes = { { n = G.UIT.T, config = { text = "LFMoth", colour = colours.code, scale = text_scale, shadow = true, align = "tm" } } } },
                        }
                    },
                    {
                        n = G.UIT.C,
                        config = { align = "cr", minw = 3, padding = 0.1 },
                        nodes = {
                            { n = G.UIT.R, config = {}, nodes = { { n = G.UIT.T, config = { text = "Shaders", colour = colours.shader, scale = text_scale * 2, shadow = true, align = "tm" } } } },
                            { n = G.UIT.R, config = {}, nodes = { { n = G.UIT.T, config = { text = "", colour = colours.shader, scale = text_scale, shadow = true, align = "tm" } } } },
                    },
                }
            }

        }
    }
}

    return ui
end