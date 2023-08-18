#orig#()
if(global.setting_snailax_full){
    if(object_index == obj_music_level_editor){
        if(global.snailax_playing){
            current_volume = 0
        } else if(global.snailax_just_finished){
            global.snailax_just_finished = false
            current_volume = 1
        }
    }
}