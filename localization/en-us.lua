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
                        "{C:green}#1# in 4{} chance",
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
                        "{T:req_credits}Scored {C:attention}numbered cards{}",
                        "have a {C:green}#1# in 4{} chance",
                        "to give {X:mult,C:white}X#2#{} mult"
                    },
                },
            },
            j_req_skin = {
                name = "I SKIN COMMON JOKERS!!!",
                text = {
                    {
                        "{C:attention}Common{} Jokers",
                        "no longer appear",
                    },
                },
            },
            j_req_captain = {
                name = "Captain Jimbo",
                text = {
                    {
                        "Playing a {C:attention}Three of a Kind{}",
                        "creates a random {C:blue}Common{} Joker",
                    },
                },
            },
            j_req_evolved = {
                name = "Evolved Joker",
                text = {
                    {
                        "Whenever a {C:attention}playing card",
                        "is added to deck   ",
                        "gains {C:chips)+#1#{} chips",
                        "{C:inactive}(Currently {C:chips}+#2#{C:inactive})",
                    },
                },
            },
            j_req_weirdo = {
                name = "Weirdo",
                text = {
                    {
                        "Whenever a {C:mult)Joker is obtained",
                        "gains {C:mult)+#1#{} mult",
                        "{C:inactive}(Currently {C:red}+#2#{C:inactive})",
                    },
                },
            },
            j_req_constipated = {
                name = "Constipated Joker",
                text = {
                    {
                        "For every {C:attention}#1#{C:inactive} (#2#/#1#) {}cards {C:attention}sold{}",
                        "gains {C:red}+#3# discards{}",
                        "{C:inactive}(Currently {C:red}+#4#{C:inactive})",
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
            m_req_stacked = {
                name = "Stacked Cards",
                text = {
                    {
                        "Retriggers {C:attention}#1#{} times",
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
                        "{C:attention}#2#{}",
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
                        "Enhances {C:attention}#1#{} selected",
                        "card into a",
                        "{C:attention}#2#{}",
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
        },
        Back = {
            b_req_sandbox = {
                name = "Sandbox Deck",
                text = {
                    "{C:attention}+#1# Joker slots",
                    "{X:red,C:white}X#2#{C:red} Blind Scaling",
                    "{s:0.7}Start with {s:0.7,C:attention,T:tag_buffoon}2 Buffoon Tags"
                },
            },
            b_req_handful = {
                name = "Handful Deck",
                text = {
                    "Start with {C:blue}#1# hands",
                    "{C:blue}Hands {C:red}never {}reset",
                    "{C:red}Discards {}are not consumed",
                    "{s:0.6,C:inactive}(No hand bonus)"
                },
            },
            b_req_lonely = {
                name = "Lonely Deck",
                text = {
                    "Start with a single",
                    "{C:attention,T:m_stone}Holographic Red-Sealed Stone Card",
                    "{C:attention}#1# hand size"
                },
            },
            b_req_inbetween = {
                name = "Inbetween Deck",
                text = {
                    "Start with a {C:dark_edition}Aleph, Negative{C:attention}Flipside",
                },
            }
        },
        Voucher = {
            v_req_membership = {
                name = "Membership",
                text = {
                    "{C:attention}First{} bought item in the {C:attention}shop{} is {C:attention}free{}",
                },
            },
            v_req_glop = {
                name = "Glop",
                text = {
                    "{X:mult,C:white}X#1#{C:mult} Mult{} after scoring",
                },
            },
            v_req_prism = {
                name = "Prism",
                text = {
                    "{C:blue}Common {C:attention}Jokers{} appear",
                    "less often"
                },
            },
            v_req_sfark = {
                name = "Sfark",
                text = {
                    "{X:chips,C:white}X#1#{C:chips} chips{} after scoring",
                },
            },
            v_req_vip = {
                name = "V.I.P. Membership",
                text = {
                    "After beating a {}Boss Blind{},",
                    "gain a {T:tag_coupon,C:attention} Coupon Tag"
                },
            },
        },
        Spectral = {
            c_req_guardian = {
                name = "Guardian",
                text = {
                    "Apply {C:edition}Protected{} to a joker",
                    "or playing card",
                },
            },
            c_req_evolution = {
                name = "Evolution",
                text = {
                    "{C:attention}Redeem{} a random {C:attention}Deck",
                    "{C:red}Destroy{} a random {C:attention}Voucher"
                },
            },
        },
        Other = {
            p_req_voucher_normal = {
                name = "Voucher Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:attention} Vouchers{} to",
                    "be redeemed immediately",
                },
            },
            req_credits = {
                name = "Credits",
                text = {
                    "Art: {C:attention} #1#",
                    "Code: {C:attention} #2#",
                    "Idea: {C:attention} #3#",
                },
            }
        }
    }
}
