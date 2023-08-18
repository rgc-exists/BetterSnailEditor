if (global.onscreen_keyboard_enabled || global.editor_input_disabled)
    return false;


if (snailax_counter == -1)
{
    return false;
}
var continue_script = true
if(global.setting_snailax_full){
    if (snailax_counter == 7)
    {
        continue_script = false
        snailax_counter = 0
        var sd = ds_list_find_value(global.li_level_editor_database, 0)
        sd.preview_sprite_index = spr_player
        sd.preview_sprite_index_once_placed = spr_player
        var snailax_stream = audio_create_stream(global.betterSE_assets + "audio/" + "Snailax Editor Theme.ogg")
        //clipboard_set_text(global.betterSE_assets + "audio/" + "Snailax Editor Theme.ogg")
        var sound = audio_play_sound(snailax_stream, 0.5, false)
        audio_sound_gain(sound, 0.8, 0)
        audio_sound_pitch(sound, 1)
        sd.preview_color = c_white
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
        global.snailax_playing = true
        alarm[1] = 182 * 60
    }
}
if(continue_script){
    #orig#()
}
if(global.setting_snailax_forever){
    var sd = ds_list_find_value(global.li_level_editor_database, 0)
    sd.preview_color = c_white
}