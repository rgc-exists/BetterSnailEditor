var model_path = get_open_filename_ext("WYS Model File | *.wysmdl", "", program_directory, "Choose a model to load.")

if(string_length(model_path) > 0){

    model_file = file_text_open_read(model_path)
    var first_line = file_text_read_string(model_file)
    var model_json = first_line
    file_text_readln(model_file)
    file_text_readln(model_file)
    model_json = file_text_read_string(model_file)
    file_text_readln(model_file)
    file_text_readln(model_file)
    model_wires_json = file_text_read_string(model_file)
    //show_message(model_wires_json)
    current_model_wires_array = json_parse(model_wires_json)
    if(!variable_global_exists("current_model_wires")){
        global.current_model_wires = ds_list_create()
    } else {
        ds_list_clear(global.current_model_wires)
    }
    for(var w = 0; w < array_length(current_model_wires_array); w++){
        ds_list_add(global.current_model_wires, current_model_wires_array[w])
    }
    file_text_close(model_file)
    global.current_model = json_parse(model_json)
    for(var m = 0; m < array_length(global.current_model); m++){
        var current_model_obj = global.current_model[m]
        variable_struct_set(current_model_obj, "toolStruct", get_leveleditor_database_element(variable_struct_get(current_model_obj, "custom_tool_or_object_id")))
        var li_properties = ds_map_create()
        var properties_struct = variable_struct_get(current_model_obj, "properties")
        names = variable_struct_get_names(properties_struct)
        for(var i = 0; i < variable_struct_names_count(properties_struct); i += 1){
            ds_map_add(li_properties, names[i], variable_struct_get(properties_struct, names[i]))
        }
        variable_struct_get(current_model_obj, "properties", li_properties)
    }
    global.cur_model_is_text = false
}