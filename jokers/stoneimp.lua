
SMODS.Joker{ --Stone Imp
    key = "stoneimp",
    config = {
        extra = {
            chips0 = -50,
            mult0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Stone Imp',
        ['text'] = {
            [1] = '{C:blue}-50{} Chips, {C:red}+1{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'Joker',
    pools = { ["modprefix_elwatro_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = -50,
                extra = {
                    mult = 1
                }
            }
        end
    end
}