SMODS.Rarity {
    key = "fella",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('d90303'),
    loc_txt = {
        name = "Fella"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}