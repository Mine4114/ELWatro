
SMODS.Back {
    key = 'missing_deck',
    pos = { x = 0, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Missing Deck',
        text = {
            [1] = 'Start with a {C:attention}Fella{} and a {C:tarot}The Friend{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_elwatro_fella' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Tarot', key = 'c_elwatro_thefriend'
                    })
                    return true
                end
            }))
        end
    end
}