var selected_font_path = global.betterSE_assets + "WYS_fonts\\WYSFont_Regular\\"
var last_slash_pos = string_last_pos("\\", selected_font_path);
if(string_length(selected_font_path) > 0 && last_slash_pos > 0){
    global.font_path = string_delete(selected_font_path, last_slash_pos + 1, string_length(selected_font_path) - last_slash_pos)
    file_names = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "EXCLAMATION MARK", "QUESTION MARK", "PERIOD", "COMMA", "APOSTROPHE", "QUOTATION MARK", "SPACE", "a_", "b_", "c_", "d_", "e_", "f_", "g_", "h_", "i_", "j_", "k_", "l_", "m_", "n_", "o_", "p_", "q_", "r_", "s_", "t_", "u_", "v_", "w_", "x_", "y_", "z_", "COLON", "SEMICOLON", "DASH", "PARENTHESIS_OPEN", "PARENTHESIS_CLOSE", "SQUAREBRACKET_OPEN", "SQUAREBRACKET_CLOSE", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    characters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "!", "?", ".", ",", "'", "\"", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ":", ";", "-", "(", ")", "[", "]", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    //" I had to put this line here because the gamemaker intellisense/code highlighting extension Im using got confused.
    text_to_write = argument0
    global.font_size = argument1
    global.loaded_font = []
    global.loaded_font_wires = []
    global.font_vertical_size = 7 * 60
    global.font_space_width = 300
    global.font_vertical_spacing = 60
    for(var c = 0; c < array_length(characters); c++){
        var model_path = global.font_path + file_names[c]

        if(!file_exists(model_path + ".wysmdl")){
            model_path = model_path
        } else {
            model_path = model_path + ".wysmdl"
        }

        if(file_exists(model_path)){
            model_file = file_text_open_read(model_path)
            var first_line = file_text_read_string(model_file)
            file_text_readln(model_file)
            file_text_readln(model_file)
            model_json = file_text_read_string(model_file)
            file_text_readln(model_file)
            file_text_readln(model_file)
            current_model_wires_str = file_text_read_string(model_file)
            ////show_message(model_wires_json)
            current_model_wires_array = json_parse(current_model_wires_str)
            file_text_close(model_file)
            current_model_array = json_parse(model_json)
            if(!variable_instance_exists(id, "current_model_wires")){
                current_model_wires = ds_list_create()
            } else {
                ds_list_clear(current_model_wires)
            }
            for(var w = 0; w < array_length(current_model_wires_array); w++){
                ds_list_add(current_model_wires, current_model_wires_array[w])
                //show_message(string(current_model_wires_array[w]))
            }
            file_text_close(model_file)
            for(var m = 0; m < array_length(current_model_array); m++){
                var current_model_obj = current_model_array[m]
                variable_struct_set(current_model_obj, "toolStruct", get_leveleditor_database_element(variable_struct_get(current_model_obj, "custom_tool_or_object_id")))
                var li_properties = ds_map_create()
                var properties_struct = variable_struct_get(current_model_obj, "properties")
                names = variable_struct_get_names(properties_struct)
                for(var i = 0; i < variable_struct_names_count(properties_struct); i += 1){
                    ds_map_add(li_properties, names[i], variable_struct_get(properties_struct, names[i]))
                }
                variable_struct_get(current_model_obj, "properties", li_properties)
            }
        
            /*
            for(var m = 0; m < array_length(current_model_array); m++){
                var current_model_obj = current_model_array[m]
                variable_struct_set(current_model_obj, "toolStruct", get_leveleditor_database_element(variable_struct_get(current_model_obj, "custom_tool_or_object_id")))
                var li_properties = ds_map_create()
                var properties_struct = variable_struct_get(current_model_obj, "properties")
                names = variable_struct_get_names(properties_struct)
                for(var i = 0; i < variable_struct_names_count(properties_struct); i += 1){
                    ds_map_add(li_properties, names[i], variable_struct_get(properties_struct, names[i]))
                }
                variable_struct_get(current_model_obj, "properties", li_properties)
                //show_message(string(current_model_obj))
                current_model_array[m] = current_model_obj
            }
            */
            global.cur_model_is_text = false
            array_push(global.loaded_font, current_model_array)
            array_push(global.loaded_font_wires, current_model_wires)

        } else {
            array_push(global.loaded_font, [])
            array_push(global.loaded_font_wires, ds_list_create())
        }


    }

    global.loaded_text_models = []
    global.loaded_text_models_wires = []

    var newline_spots = []
    if(string_length(text_to_write) > 0 && global.font_size > 0){
        for(var c = 0; c < string_length(text_to_write); c++){
            char = string_char_at(text_to_write, c + 1)
            var has_found_char = false
            for(var i = 0; i < array_length(characters); i++){
                if(char == characters[i]){
                    has_found_char = true
                    break;
                }
            }
            if(has_found_char){
                array_push(global.loaded_text_models, global.loaded_font[i])
                array_push(global.loaded_text_models_wires, global.loaded_font_wires[i])
            } else {
                array_push(global.loaded_text_models, [])
                array_push(global.loaded_text_models_wires, [])
                if(char == "\n"){
                    array_push(newline_spots, c)
                }
            }
        }
        //var test_struct = gml_Script_modhelper_create_struct()
        //variable_struct_set(test_struct, "loaded objects", global.loaded_text_models)
        //variable_struct_set(test_struct, "loaded wires", global.loaded_text_models_wires)
        //clipboard_set_text(json_stringify(test_struct))

        if(variable_global_exists("current_model_wires")){
            if(ds_exists(global.current_model_wires, ds_type_list)){
                ds_list_clear(global.current_model_wires)
            }
        } else {
            global.current_model_wires = ds_list_create()
        }
        global.current_model = []
        var current_newline = 0
        var x_offset = 0;
        var y_offset = 0;
        for(var c = 0; c < array_length(global.loaded_text_models); c++){
            var farthest_x = 0
            var farthest_xscale = 0
            for(var m = 0; m < array_length(global.loaded_text_models[c]); m++){
                current_obj_og = global.loaded_text_models[c][m]
                current_obj = gml_Script_modhelper_create_struct()
                var names = variable_struct_get_names(current_obj_og)
                for(var i = 0; i < array_length(names); i++){
                    var name = names[i]
                    variable_struct_set(current_obj, names[i], variable_struct_get(current_obj_og, names[i]))
                }
                var obj_x = variable_struct_get(current_obj, "x")
                var obj_y = variable_struct_get(current_obj, "y")
                var obj_xscale = variable_struct_get(current_obj, "scaleX")
                var obj_yscale = variable_struct_get(current_obj, "scaleY")
                if(obj_x > farthest_x){
                    farthest_x = obj_x + abs(obj_xscale * 60) + 120
                    farthest_x = obj_x + obj_xscale * 60 
                    farthest_xscale = obj_xscale
                } else if(obj_x == farthest_x){
                    if(obj_xscale > farthest_xscale){
                        farthest_x = obj_x + abs(obj_xscale * 60) + 120
                        farthest_x = obj_x + obj_xscale * 60 
                        farthest_xscale = obj_xscale
                    }
                }
                obj_x += x_offset
                obj_x = obj_x * global.font_size
                obj_y += y_offset
                obj_y = obj_y * global.font_size
                variable_struct_set(current_obj, "scaleX", obj_xscale * global.font_size)
                variable_struct_set(current_obj, "scaleY", obj_yscale * global.font_size)
                variable_struct_set(current_obj, "x", obj_x)
                variable_struct_set(current_obj, "y", obj_y)
                //show_message(current_obj)
                array_push(global.current_model, current_obj)
            }
            if(array_length(global.loaded_text_models[c]) == 0){
                x_offset += global.font_space_width
                if(array_length(newline_spots) > current_newline){
                    if(c == newline_spots[current_newline]){
                        x_offset = 0
                        y_offset += global.font_vertical_size + global.font_vertical_spacing
                        current_newline++
                    }
                }
            } 
            x_offset += farthest_x + 30
        }
        var index_offset = 0
        for(var c = 0; c < array_length(global.loaded_text_models_wires); c++){
            for(var w = 0; w < array_length(global.loaded_text_models_wires[c]); w++;){
                var curWireList = global.loaded_text_models_wires[c][w]
                var from_obj = curWireList[0]
                var to_obj = curWireList[1]
                from_obj += index_offset
                to_obj += index_offset
                var new_wire = [from_obj, to_obj]
                //show_message(string(new_wire))
                ds_list_add(global.current_model_wires, new_wire)
            }
            index_offset += array_length(global.loaded_text_models[c])

        }
        global.cur_model_is_text = true
        //show_message("Text has been saved to your models tool!")
    }
}
