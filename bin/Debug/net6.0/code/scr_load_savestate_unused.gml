//This script is unused because I couldn't get it to work.

audio_stop_all()
game_load(working_directory + "BSE_SaveState.wyssavestate2")
var f = file_text_open_read(working_directory + "BSE_SaveState.wyssavestate1")
var json = file_text_read_string(f)
file_text_close(f)
var saveState = json_parse(json)
for(var list = 0; list < 10000; list++){
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
var dsMaps = variable_struct_get(saveState, "DsMaps")
var dsLists = variable_struct_get(saveState, "DsLists")
var dsGrids = variable_struct_get(saveState, "DsGrids")

for(var list = 0; list < 10000; list++){
    if(variable_struct_exists(dsMaps, string(list))){
        var curMap = ds_map_create()
        var ds_struct = variable_struct_get(dsMaps, string(list))
        var ds_array = variable_struct_get_names(ds_struct)
        for(var i = 0; i < array_length(ds_array); i++){
            ds_map_add(curMap, ds_array[i], variable_struct_get(ds_struct, ds_array[i]))
        }
    }
    if(variable_instance_exists(id, "prevDsMap")){
        if(ds_exists(prevDsMap, ds_type_map)){
            ds_map_destroy(prevDsMap)
        }
    }
    if(!variable_struct_exists(dsMaps, string(list))){
        prevDsMap = ds_map_create()
    }
    if(variable_struct_exists(dsLists, string(list))){
        var curList = ds_list_create()
        var ds_array = variable_struct_get(dsMaps, string(list))
        for(var i = 0; i < array_length(ds_array); i++){
            ds_list_add(curList, ds_array[i])
        }
        ds_list_destroy(curList)
    }
    if(variable_instance_exists(id, "prevDsList")){
        if(ds_exists(prevDsList, ds_type_list)){
            ds_list_destroy(prevDsList)
        }
    }
    if(!variable_struct_exists(dsLists, string(list))){
        prevDsList = ds_list_create()
    }
    if(variable_struct_exists(dsGrids, string(list))){
        var row = variable_struct_get(dsMaps, string(list))
        var curGrid = ds_grid_create(array_length(row), array_length(row[0]))
        for(var xx = 0; xx < array_length(row); xx++){
            var column = row[xx]
            for(var yy = 0; yy < array_length(column); yy++){
                ds_grid_add(curGrid, xx, yy, row[yy])
            }
        }
    }
    if(variable_instance_exists(id, "prevDsGrid")){
        if(ds_exists(prevDsGrid, ds_type_grid)){
            ds_grid_destroy(prevDsGrid)
        }
    }
    if(!variable_struct_exists(dsLists, string(list))){
        prevDsGrid = ds_grid_create(1, 1)
    }
}


var objSounds = variable_struct_get(saveState, "ObjSounds")
var globalSounds = variable_struct_get(saveState, "GlobalSounds")
var objsKeys = variable_struct_get_names(objSounds)

music_index_ids = [85, 101, 103, 102, 100, 86, 97, 91, 90, 91, 92, 86, 93, 95, 88, 89, 4, 95, 94, 320, 87]

for(var o = 0; o < array_length(objsKeys); o++){
    obj = variable_struct_get(objSounds, objsKeys[o])
    oKeys = variable_struct_get_names(obj)
    for(var v = 0; v < array_length(oKeys); v++){
        var soundInfo = variable_struct_get(obj, oKeys[v])
        var is_music = false
        for(var m = 0; m < array_length(music_index_ids); m++){
            if(soundInfo[1] == music_index_ids[m]){
                is_music = true
            }
        }
        if is_music
            variable_instance_set(real(string_replace(objsKeys[o], "ref ", "")), oKeys[v],  audio_play_sound(soundInfo[1], 0, true))
        else
            variable_instance_set(real(string_replace(objsKeys[o], "ref ", "")), oKeys[v],  audio_play_sound(soundInfo[1], 0, false))
        audio_sound_set_track_position(variable_instance_get(real(string_replace(objsKeys[o], "ref ", "")), oKeys[v]), soundInfo[2])
        audio_sound_gain(variable_instance_get(real(string_replace(objsKeys[o], "ref ", "")), oKeys[v]), soundInfo[3], 0)
        audio_sound_pitch(variable_instance_get(real(string_replace(objsKeys[o], "ref ", "")), oKeys[v]), soundInfo[4])
        audio_sound_set_listener_mask(variable_instance_get(real(string_replace(objsKeys[o], "ref ", "")), oKeys[v]), soundInfo[5])
    }
}


var globalKeys = variable_struct_get_names(globalSounds)
for(var v = 0; v < array_length(globalKeys); v++){
    var soundInfo = variable_struct_get(obj, globalKeys[v])
    var is_music = false
    for(var m = 0; m < array_length(music_index_ids); m++){
        if(soundInfo[1] == music_index_ids[m]){
            is_music = true
        }
    }
    if is_music
        variable_global_set(globalKeys[v],  audio_play_sound(soundInfo[1], 0, true))
    else
        variable_global_set(globalKeys[v],  audio_play_sound(soundInfo[1], 0, false))
    audio_sound_set_track_position(variable_global_get(globalKeys[v]), soundInfo[2])
    audio_sound_gain(variable_global_get(globalKeys[v]), soundInfo[3], 0)
    audio_sound_pitch(variable_global_get(globalKeys[v]), soundInfo[4])
    audio_sound_set_listener_mask(variable_global_get(globalKeys[v]), soundInfo[5])
}


