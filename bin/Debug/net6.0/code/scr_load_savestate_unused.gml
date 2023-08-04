//This script is unused because I couldn't get it to work.


audio_stop_all()
for(var list = 400000; list < 500000; list++){
    if(audio_is_playing(list)){
        audio_stop_sound(list)
    }
}

game_load(working_directory + "BSE_SaveState.wyssavestate2")
audio_stop_all()

for(var list = 400000; list < 500000; list++){
    if(audio_is_playing(list)){
        audio_stop_sound(list)
    }
}
audio_stop_all()

var f = file_text_open_read(working_directory + "BSE_SaveState.wyssavestate1")
var json = file_text_read_string(f)
file_text_close(f)
var saveState = json_parse(json)
for(var list = 0; list < 100000; list++){
    if(ds_exists(list, ds_type_list)){
        ds_list_destroy(list)
    }
    if(ds_exists(list, ds_type_map)){
        ds_map_destroy(list)
    }
    if(ds_exists(list, ds_type_grid)){
        ds_grid_destroy(list)
    }
}

music_index_ids = [85, 101, 103, 102, 100, 86, 97, 91, 90, 91, 92, 86, 93, 95, 88, 89, 4, 95, 94, 320, 87]

var dsMaps = variable_struct_get(saveState, "DsMaps")
var dsLists = variable_struct_get(saveState, "DsLists")
var dsGrids = variable_struct_get(saveState, "DsGrids")
var sounds = variable_struct_get(saveState, "Sounds")

var last_map = 0
var last_list = 0
var last_grid = 0

for(var list = 0; list < 100000; list++){
    if(variable_struct_exists(dsMaps, string(list))){
        last_map = list 
    }
    
    if(variable_struct_exists(dsLists, string(list))){
        last_list = list
    }

    if(variable_struct_exists(dsGrids, string(list))){
        last_grid = list
    }
}
for(var list = 0; list < 100000; list++){
    if(variable_struct_exists(dsMaps, string(list))){
        var curMap = ds_map_create()
        var ds_struct = variable_struct_get(dsMaps, string(list))
        var ds_array = variable_struct_get_names(ds_struct)
        for(var i = 0; i < array_length(ds_array); i++){
            ds_map_add(curMap, ds_array[i], variable_struct_get(ds_struct, ds_array[i]))
        }
    } else if(list <= last_map){
        ds_list_create()
    }

    
    if(variable_struct_exists(dsLists, string(list))){
        var curList = ds_list_create()
        var ds_array = variable_struct_get(dsLists, string(list))
        for(var i = 0; i < array_length(ds_array); i++){
            ds_list_add(curList, ds_array[i])
        }
    } else if(list <= last_list){
        ds_list_create()
    }



    if(variable_struct_exists(dsGrids, string(list))){
        var row = variable_struct_get(dsGrids, string(list))
        if(array_length(row) > 0){
            var curGrid = ds_grid_create(array_length(row), array_length(row[0]))
            for(var xx = 0; xx < array_length(row); xx++){
                var column = row[xx]
                for(var yy = 0; yy < array_length(column); yy++){
                    ds_grid_add(curGrid, xx, yy, row[yy])
                }
            }
        } else {
            var curGrid = ds_grid_create(0, 0)
        }
    } else if(list <= last_grid){
        ds_grid_create(0, 0)
    }

    curSoundIndex = list + 400000
    if(variable_struct_exists(sounds, string(curSoundIndex))){
        var soundInfo = variable_struct_get(sounds, string(curSoundIndex))
        var is_music = false
        for(var m = 0; m < array_length(music_index_ids); m++){
            if(soundInfo[1] == music_index_ids[m]){
                is_music = true
            }
        }
        var curSound = -1;
        if is_music {
            curSound = audio_play_sound(soundInfo[1], 0, true)
        }
        else
            curSound = audio_play_sound(soundInfo[1], 0, false)
        audio_sound_set_track_position(curSound, soundInfo[2])
        audio_sound_gain(curSound, soundInfo[3], 0)
        audio_sound_pitch(curSound, soundInfo[4])
        audio_sound_set_listener_mask(curSound, soundInfo[5])
    }

}



/*
gml_Script_keybinding_ini_defaults()
gml_Script_keybinding_load()
gml_Script_scr_level_dat_ini()
*/
