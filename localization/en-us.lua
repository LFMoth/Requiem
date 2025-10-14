return {
    descriptions = {
        Joker = {
            j_req_cat = {
                name = "Cat Joker",
                text = {
                    {
                        "After playing a hand,",
                        "deploy a {C:attention}Card Cat{}",
                        "into your hand",
                    },
                    {
                        "Evolves after 2 boss blinds",
                        "{C:inactive}(#1#/2){}",
                    }
                },
            },
            j_req_machocat = {
                name = "Macho Cat Joker",
                text = {
                    "After playing a hand,",
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
                    {
                        "Mult is set to {C:mult}#1#{} after scoring",
                        "Gain {C:money}$#2#{} when a card is scored",
                    },
                    {
                        "{C:inactive}(Self-destructs in #3# hands){}",
                    }
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
            j_req_awesomeFuckingSkeleton = {
                name = "AWESOME FUCKING SKELETON JOKER",
                text = {
                    {
                        "Playing your last {C:attention}hand{}",
                        "creates a {C:attention}Death{} tarot"
                    },
                },
            },
            j_req_somebody = {
                name = "Somebody",
                text = {
                    {
                        "+{C:chips}#1#{} chips",
                        "every time a {C:chips}Joker{}",
                        "triggers"
                    },
                },
            },
            j_req_primedSureFooted = {
                name = "Primed Sure Footed",
                text = {
                    {
                        "On {C:mult}discard{},",
                        "{C:attention}#1# in 4{} chance",
                        "to {C:attention}refund{} the discard"
                    },
                },
            },
            j_req_investor = {
                name = "Investor",
                text = {
                    {
                        "When the {C:attention}joker{},",
                        "to the {C:attention}left{} triggers,",
                        "grant {C:money}$#1#{}"
                    },
                },
            },
            j_req_brickedup = {
                name = "Bricked-up Joker",
                text = {
                    {
                        "Unplayed {C:attention}#2#s{}",
                        "gain {C:attention}#1#{} durability"
                    },
                },
            },
            j_req_metajoker = {
                name = "Metajoker",
                text = {
                    {
                        "Grants {C:mult}+#1#{} mult",
                        "every time a",
                        "{C:attention}Joker{} triggers"
                    },
                },
            },
            j_req_mountaineer = {
                name = "Mountaineer",
                text = {
                    {
                        "In the {C:attention}first hand{} of",
                        "the round, converts",
                        "the {C:attention}rightmost{} played card",
                        "into the {C:attention}leftmost{} played card"
                    },
                },
            },
            j_req_bait = {
                name = "Bait",
                text = {
                    {
                        "{C:hearts}Rare{} Jokers become",
                        "easier to find"
                    },
                },
            },
            j_req_ascii = {
                name = "ASCII Joker",
                text = {
                    {
                        "Scored {C:attention}numbered cards{}",
                        "have a {C:attention}#1# in 4{} chance",
                        "to give {X:mult,C:white}X#2#{} mult"
                    },
                },
            },

        },
        Enhanced = {
            m_req_cat = {
                name = "Card Cat",
                text = {
                    {
                        "{C:mult}+#1#{} Mult",
                    },
                    {
                        "Suitless, counts as a {C:attention}Jack{}"
                    },
                    {
                        "{C:mult}Self-destructs after end of round{}"
                    },
                },
            },
            m_req_shingle = {
                name = "Shingle Card",
                text = {
                    {
                        "{}{C:mult}+#2#{} Mult",
                    },
                    {

                        "{C:attention}Durability{} goes down",
                        "every time its played",
                        "{C:inactive}({}{C:attention}#1#{}{C:inactive} uses remaining){}",
                    },
                    {
                        "Grants {C:mult}Mult{} equal to {C:attention}1.2{} times",
                        "the current {C:attention}durability{}",
                        "{C:inactive}(Currently {}{C:mult}+#2#{}{C:inactive}){}",
                    },
                },
            },
            m_req_exalted = {
                name = "Exalted Card",
                text = {
                    {
                        "{C:chips}+#1#{} extra chips",
                        "Uses {C:chips}#2#{} hand",
                    },
                },
            },
        },
        Tarot = {
            c_req_colossus = {
                name = "The Colossus",
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
            },
            c_req_archon = {
                name = "The Archon",
                text = {
                    {
                        "{C:inactive}(Currently reworking){}",
                        "{C:inactive}(Not implemented){}",
                    },
                },
            }
        },
        Fraud = {
            c_req_knight = {
                name = "The Knight",
                text = {
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_req_citadel = {
                name = "The Citadel",
                text = {
                    "Destroys {C:attention}#1#{} selected",
                    "{C:attention}Shingle Card{} and grats its",
                    "{C:attention}Durability{} as {C:money}${}"
                },
            }
        }
    }
}
