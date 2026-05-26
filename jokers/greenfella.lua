
SMODS.Joker{ --Green Fella
    key = "greenfella",
    config = {
        extra = {
            fellacount = 0,
            workingcount = 0,
            emult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Green Fella',
        ['text'] = {
            [1] = '{C:inactive}Hello friend!',
            [2] = 'Friend has message for you!',
            [3] = 'Here is message!{}',
            [4] = 'This joker triplicates all listed probabilities.',
            [5] = 'It also provides {X:mult,C:white}x2{} Mult for every other {C:attention}Fella{} you own.',
            [6] = '{C:inactive}That was message!',
            [7] = 'Message sounded important...',
            [8] = 'Goodbye!{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = "elwatro_fella",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["elwatro_elwatro_jokers"] = true },
    soul_pos = {
        x = 9,
        y = 0
    },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.fellacount, card.ability.extra.workingcount}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.fellacount or 0)) > to_big(1) then
                local workingcount_value = card.ability.extra.workingcount
                card.ability.extra.workingcount = card.ability.extra.fellacount
                card.ability.extra.workingcount = math.max(0, (card.ability.extra.workingcount) - 1)
                card.ability.extra.workingcount = (card.ability.extra.workingcount) * 2
                return {
                    Xmult = workingcount_value,
                }
        end
        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator * 3
            }
        end
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            if (function()
                local count = 0
                for _, joker_owned in pairs(G.jokers.cards or {}) do
                    if joker_owned.config.center.rarity == "elwatro_fella" then
                        count = count + 1
                    end
                end
                return to_big(count) > to_big(card.ability.extra.fellacount)
            end)() then
                return {
                    func = function()
                        card.ability.extra.fellacount = (card.ability.extra.fellacount) + 1
                        return true
                    end
                }
            elseif (function()
                local count = 0
                for _, joker_owned in pairs(G.jokers.cards or {}) do
                    if joker_owned.config.center.rarity == "elwatro_fella" then
                        count = count + 1
                    end
                end
                return to_big(count) < to_big(card.ability.extra.fellacount)
            end)() then
                return {
                    func = function()
                        card.ability.extra.fellacount = math.max(0, (card.ability.extra.fellacount) - 1)
                        return true
                    end
                }
            end
        end
    end
}