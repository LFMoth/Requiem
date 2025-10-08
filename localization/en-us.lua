return {
    descriptions = {
        Joker = {
            j_req_cat = {
                name = "Cat Joker",
                text = {
                    "When drawing cards",
                    "deploy a {C:attention}Card Cat{}",
                    "into your hand",
                    "evolves after 2 boss blinds {C:inactive}(#1#/2){}",
                },
            },
            j_req_machocat = {
                name = "Macho Cat Joker",
                text = {
                    "When drawing cards",
                    "deploy two {C:attention}Card Cats{}",
                    "into your hand",
                },
            },
            j_req_wish = {
                name = "Wish",
                text = {
                    "Playing your least played {C:attention}hand{}",
                    "levels it up",
                },
            },
            j_req_retro = {
                name = "Retro Joker",
                text = {
                    "Played even-numbered cards",
                    "increase their rank by {C:attention}#1#{}",
                },
            },
            j_req_poptart = {
                name = "Pop-tart",
                text = {
                    "Mult. is set to {C:mult}#1#{} after scoring",
                    "Gain {C:money}$#2#{} when a card is scored",
                    "{C:inactive}(Self destructs in #3# hands){}",
                },
            },
            j_req_forecast = {
                name = "Forecast",
                text = {
                    "{C:inactive}(To be implemented){}",
                },
            },
            j_req_heister = {
                name = "Heister",
                text = {
                    "{C:attention}Gold{} cards count",
                    "as {C:attention}Steel{} cards",
                },
            },
            j_req_extreme = {
                name = "Extreme Joker",
                text = {
                    "Beating the boss blind",
                    "randomizes this",
                    "card's {C:attention}edition{}",
                },
            },

        },
        Enhanced = {
            m_req_cat = {
                name = "Card Cat",
                text = {
                    "{C:mult}+#1#{} Mult.",
                    "suitless, counts as a {C:attention}Jack{}",
                    "{C:mult}self-destructs after end of round{}",
                },
            },
            m_req_shingle = {
                name = "Shingle Card",
                text = {
                    {
                        "Grants {C:attention}Mult.{} equal to {C:attention}1.2{} times",
                        "the current {C:attention}durability{}",
                        "{C:attention}Durability{} goes down",
                        "every time its played",
                    },
                    {
                        "{C:inactive}({}{C:attention}#1#{}{C:inactive} durability remaining){}",
                        "{C:inactive}(Currently {}{C:mult}+#2#{}{C:inactive}){}",
                    },
                },
            },
        },
        Tarot = {
            c_req_colossus = {
                name = "Colossus",
                text = {
                    {
                        "Enhances {C:attention}#1#{} selected",
                        "card into a",
                        "{C:attention}#2#",
                    },
                    {
                        "Increases durability of {C:attention}#1#{}",
                        "selected {C:attention}#2#{}",
                        "by {C:attention}#3#{}",
                    },
                },
            }
        }
    }
}
