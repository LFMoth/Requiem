local catcardgetid = Card.get_id -- Code to make Card Cat count as a Jack
function Card:get_id(...)
    if SMODS.has_enhancement(self, 'm_req_cat') then
        return 11
    end
    return catcardgetid(self, ...)
end
local catcardisface = Card.is_face -- Code to make Card Cat count as a face card
function Card:is_face(...)
    if SMODS.has_enhancement(self, 'm_req_cat') then
        return true
    end
    return catcardisface(self, ...)
end
