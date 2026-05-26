
SMODS.Enhancement {
    key = 'missing',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            odds = 255
        }
    },
    loc_txt = {
        name = 'Missing',
        text = {
            [1] = '{C:green}1 in 255{} chance to create a {C:attention}Diolch{} when played {C:inactive}(requires empty slot){}',
            [2] = 'No suit or rank.'
        }
    },
    atlas = 'CustomEnhancements',
    any_suit = false,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    unlocked = true,
    discovered = true,
    no_collection = false,
    weight = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'group_0_3a36d9d2', 1, card.ability.extra.odds, 'j_elwatro_missing', false) then
                local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_elwatro_diolch' })
                            if joker_card then
                                
                                
                            end
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
            end
        end
    end
}