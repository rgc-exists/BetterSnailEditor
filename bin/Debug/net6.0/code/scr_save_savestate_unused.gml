//This script is unused because I couldn't get it to work.

var saveState = modhelper_create_struct()
var list = 0
var dsMaps = modhelper_create_struct()
var dsLists = modhelper_create_struct()
var dsStacks = modhelper_create_struct()
var dsGrids = modhelper_create_struct()
var dsQueues = modhelper_create_struct()
var dsPriorities = modhelper_create_struct()
while(list < 100000){
    if(ds_exists(list, ds_type_map)){
        var keys = ds_map_keys_to_array(list)
        var map = modhelper_create_struct()
        for(var k = 0; k < ds_map_size(list); k++){
            variable_struct_set(map, keys[k], ds_map_find_value(list, keys[k]))
        }
        variable_struct_set(dsMaps, string(list), map)
    }
    if(ds_exists(list, ds_type_list)){
        var curList = []
        for(var k = 0; k < ds_list_size(list); k++){
            array_push(curList, ds_list_find_value(list, k))
        }
        variable_struct_set(dsLists, string(list), curList)
    }
    if(ds_exists(list, ds_type_grid)){
        var curList = []
        for(var xx = 0; xx < ds_grid_width(list); xx++){
            var curColumn = []
            for(var yy = 0; yy < ds_grid_height(list); yy++){
                var value = ds_grid_get(list, xx, yy)
                array_push(curColumn, value)

            }
            array_push(curList, curColumn)
        }
        variable_struct_set(dsGrids, string(list), curList)
    }
    list += 1
}
variable_struct_set(saveState, "DsMaps", dsMaps)
variable_struct_set(saveState, "DsLists", dsLists)
variable_struct_set(saveState, "DsGrids", dsGrids)

var objects = []

with all {
    array_push(objects, id)
}

var objs_sounds = modhelper_create_struct()
for(var o = 0; o < array_length(objects); o++){
    var objLocalNames = variable_instance_get_names(objects[o]);
    var objLocals = modhelper_create_struct()
    for(var i = 0; i < array_length(objLocalNames); i++){
        if(is_real(variable_instance_get(objects[o], objLocalNames[i]))){
            if(audio_is_playing(variable_instance_get(objects[o], objLocalNames[i]))){
                var soundInfo = [variable_instance_get(objects[o], objLocalNames[i]), asset_get_index(audio_get_name(variable_instance_get(objects[o], objLocalNames[i]))), audio_sound_get_track_position(variable_instance_get(objects[o], objLocalNames[i])), audio_sound_get_gain(variable_instance_get(objects[o], objLocalNames[i])), audio_sound_get_pitch(variable_instance_get(objects[o], objLocalNames[i])), audio_sound_get_listener_mask(variable_instance_get(objects[o], objLocalNames[i]))]
                variable_struct_set(objLocals, objLocalNames[i], soundInfo)
            }
        }
    }
    variable_struct_set(objs_sounds, string(objects[i]), objLocals)
}
var globalLocalNames = variable_instance_get_names(global);
var globalLocals = modhelper_create_struct()
for(var i = 0; i < array_length(objLocalNames); i++){
    if(is_real(variable_global_get(globalLocalNames[i]))){
        if(audio_is_playing(variable_global_get(globalLocalNames[i]))){
            var soundInfo = [variable_global_get(globalLocalNames[i]), asset_get_index(audio_get_name(variable_global_get(globalLocalNames[i]))), audio_sound_get_track_position(variable_global_get(globalLocalNames[i])), audio_sound_get_gain(variable_global_get(globalLocalNames[i])), audio_sound_get_pitch(variable_global_get(globalLocalNames[i])), audio_sound_get_listener_mask(variable_global_get(globalLocalNames[i]))]
            variable_struct_set(globalLocals, globalLocalNames[i], soundInfo)
        }
    }
}
variable_struct_set(saveState, "ObjSounds", objs_sounds)
variable_struct_set(saveState, "GlobalSounds", globalLocals)

var json = json_stringify(saveState)
var f = file_text_open_write(working_directory + "BSE_SaveState.wyssavestate1")
file_text_write_string(f, json)
file_text_close(f)
game_save(working_directory + "BSE_SaveState.wyssavestate2")
