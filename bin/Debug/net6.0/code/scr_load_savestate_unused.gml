audio_stop_all()
for(var list = 400000; list < 500000; list++){
    if(audio_is_playing(list)){
        audio_stop_sound(list)
    }
}
game_load(working_directory + "BSE_SaveState.wyssavestate2")
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
    if(ds_exists(list, ds_type_stack)){
        ds_stack_destroy(list)
    }
    if(ds_exists(list, ds_type_queue)){
        ds_queue_destroy(list)
    }
    if(ds_exists(list, ds_type_priority)){
        ds_priority_destroy(list)
    }
}

var dsMaps = variable_struct_get(saveState, "DsMaps")
var dsLists = variable_struct_get(saveState, "DsLists")
var dsGrids = variable_struct_get(saveState, "DsGrids")
var dsStacks = variable_struct_get(saveState, "DsStacks")
var dsQueues = variable_struct_get(saveState, "DsQueues")
var dsPriorities = variable_struct_get(saveState, "DsPriorities")

var last_map = 0
var last_list = 0
var last_grid = 0
var last_stack = 0
var last_queue = 0
var last_priority = 0

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

    if(variable_struct_exists(dsStacks, string(list))){
        last_stack = list
    }

    if(variable_struct_exists(dsQueues, string(list))){
        last_queue = list
    }

    if(variable_struct_exists(dsPriorities, string(list))){
        last_priority = list
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
    } else if(list < last_map){
        ds_list_create()
    }

    
    if(variable_struct_exists(dsLists, string(list))){
        var curList = ds_list_create()
        var ds_array = variable_struct_get(dsLists, string(list))
        for(var i = 0; i < array_length(ds_array); i++){
            ds_list_add(curList, ds_array[i])
        }
    } else if(list < last_list){
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
    } else if(list < last_grid){
        ds_grid_create(0, 0)
    }

    
    if(variable_struct_exists(dsStacks, string(list))){
        var curList = ds_stack_create()
        var ds_array = variable_struct_get(dsStacks, string(list))
        for(var i = 0; i < array_length(ds_array); i++){
            ds_stack_push(curList, ds_array[i])
        }
    } else if(list < last_stack){
        ds_stack_create()
    }

    
    if(variable_struct_exists(dsQueues, string(list))){
        var curList = ds_queue_create()
        var ds_array = variable_struct_get(dsQueues, string(list))
        for(var i = 0; i < array_length(ds_array); i++){
            ds_queue_enqueue(curList, ds_array[i])
        }
    } else if(list < last_queue){
        ds_queue_create()
    }
    
    if(variable_struct_exists(dsPriorities, string(list))){
        var curList = ds_priority_create()
        var ds_array = variable_struct_get(dsPriorities, string(list))
        var priorities = ds_array[0]
        var values = ds_array[1]
        for(var i = 0; i < array_length(values); i++){
            ds_priority_add(curList, values[i], priorities[i])
        }
    } else if(list < last_priority){
        ds_priority_create()
    }

}



var globalVars = variable_struct_get(saveState, "GlobalVars")

var globalNames = variable_struct_get_names(globalVars)
for(var g = 0; g < array_length(globalNames); g++){
    var globalName = globalNames[g]
    var globalValue = variable_struct_get(globalVars, globalName)
    variable_global_set(globalName, globalValue)
}

gml_Script_keybinding_ini_defaults()
gml_Script_keybinding_load()
gml_Script_loca_text_load()
gml_Script_loca_load_all_audio_into_memory()
if(variable_global_exists("li_level_editor_database")){
    if(ds_exists(global.li_level_editor_database, ds_type_list)){
        gml_Script_leveleditor_database_ini()
    }
}
global.model_tool_sprite = sprite_add(global.betterSE_assets + "sprites/" + "spr_models_tool_v3.png", 0, 0, 0, 0, 0)
global.inspector_tool_sprite = sprite_add(global.betterSE_assets + "sprites/" + "inspector_tool_v2.png", 0, 0, 0, 0, 0)



/*
gml_Script_keybinding_ini_defaults()
gml_Script_keybinding_load()
gml_Script_scr_level_dat_ini()
*/