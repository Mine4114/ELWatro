if Malverk then
    AltTexture({
        key = 'alt_fella',
        set = 'Joker',
        path = 'alt_fella.png',
        keys = {
            'j_elwatro_fella',
            'j_elwatro_bluefella',
            'j_elwatro_whitefella',
            'j_elwatro_slatefella',
            'j_elwatro_greenfella',
        },
        soul_keys = {
            'j_elwatro_fella',
            'j_elwatro_bluefella',
            'j_elwatro_whitefella',
            'j_elwatro_slatefella',
            'j_elwatro_greenfella',
        }
    })
    TexturePack({
        key = 'elwatro_mossfella',
        toggle_textures = {'alt_fella'},
        loc_txt = {
        name = 'Moss Fellas', 
        text = {'Alternate textures for the Fella rarity jokers.', 'Art by Moss in the ELW discord.'},
        },
    })
end