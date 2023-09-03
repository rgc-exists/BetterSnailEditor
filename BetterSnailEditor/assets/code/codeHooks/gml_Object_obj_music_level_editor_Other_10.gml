if(global.setting_snailax_forever){
    play_music = global.snailax_editor_theme
    play_music_volume_multi = 1

    var sd = ds_list_find_value(global.li_level_editor_database, 0)
    sd.preview_sprite_index = spr_player
    sd.preview_sprite_index_once_placed = spr_player
    ds_list_replace(global.li_level_editor_database, 0, sd)
    snailax_counter = -1
    with (obj_lvlobj_parent)
    {
        if (sprite_index == spr_player_level_editor)
        {
            sprite_index = spr_player
            image_blend = c_white
        }
    }
} else {
    #orig#()
}