switch argument1
{
    case 0:
        hlp_toolplace_start_dragging_box(argument0)
        break
    case 1:
        hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_bubbles, 31, 0.7, 0.1)
        break
    case 2:
        mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60)
        mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60)
        mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60)
        mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60)
        li_objects_in_box = ds_list_create()
        collision_rectangle_list((mouse_drag_box_xmin + 2), (mouse_drag_box_ymin + 2), (mouse_drag_box_xmax - 2), (mouse_drag_box_ymax - 2), obj_lvlobj_parent, 1, 1, li_objects_in_box, 0)
        clipboard_model = []
        clipboard_model_for_json = []
        for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
        {
            inst_check = ds_list_find_value(li_objects_in_box, indx)
            var clipStruct = scr_create_clipboard_struct_from_object((mouse_drag_box_start_x * 60), (mouse_drag_box_start_y * 60), inst_check)
            array_push(clipboard_model, clipStruct)
            
            var struct_for_json = modhelper_create_struct()
            names = variable_struct_get_names(clipStruct)
            for(var i = 0; i < variable_struct_names_count(clipStruct); i += 1){
                variable_struct_set(struct_for_json, names[i], variable_struct_get(clipStruct, names[i]))
            }
            variable_struct_remove(struct_for_json, "toolStruct")
            var toolStruct = variable_struct_get(clipStruct, "toolStruct")
            variable_struct_set(struct_for_json, "custom_tool_or_object_id", variable_struct_get(toolStruct, "custom_tool_or_object_id"))
            //variable_struct_set(struct_for_json, "image_xscale", variable_struct_get(toolStruct, "image_xscale"))
            //variable_struct_set(struct_for_json, "image_yscale", variable_struct_get(toolStruct, "image_yscale"))
            var li_properties = variable_struct_get(struct_for_json, "properties")
            var properties_struct = modhelper_create_struct()
            var cur_key = ds_map_find_first(li_properties)
            var list_size = ds_map_size(li_properties)
            for(var p = 0; p < list_size; p++){
                variable_struct_set(properties_struct, cur_key, ds_map_find_value(li_properties, cur_key))

                cur_key = ds_map_find_next(li_properties, cur_key)
            }
            variable_struct_set(struct_for_json, "properties", properties_struct)
            array_push(clipboard_model_for_json, struct_for_json)
            variable_struct_set(clipStruct, "custom_tool_or_object_id", variable_struct_get(toolStruct, "custom_tool_or_object_id"))
        }
        if (ds_list_size(li_objects_in_box) > 0)
        {
        }
        if(variable_global_exists("current_model_wires")){
            if(ds_exists(global.current_model_wires, ds_type_list)){
                ds_list_destroy(global.current_model_wires)
            }
        }
        li_wires_in_box = ds_list_create()
        for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
        {
            from_obj = ds_list_find_value(li_objects_in_box, indx)
            if(object_is_ancestor(from_obj.object_index, obj_lvlobj_wireable_parent) || from_obj.object_index == obj_lvlobj_wireable_parent){
                for(var w = 0; w < ds_list_size(global.lvl_wires); w++){
                    var connection = ds_list_find_value(global.lvl_wires, w)
                    if(connection.from_obj == from_obj){
                        to_obj = connection.to_obj
                        if(ds_list_find_index(li_objects_in_box, to_obj) != -1){
                            ds_list_add(li_wires_in_box, [indx, ds_list_find_index(li_objects_in_box, to_obj)])
                        }
                    }
                }
            }
        }
        clipboard_model_wires = li_wires_in_box
        if (ds_list_size(li_objects_in_box) > 0)
        {
        }
        ds_list_destroy(li_objects_in_box)
        lvlwire_delete_non_valids()
        
        global.current_model = clipboard_model
        global.current_model_wires = li_wires_in_box
        
        current_model_wires_array = []
        for(var w = 0; w < ds_list_size(global.current_model_wires); w++){
            array_push(current_model_wires_array, ds_list_find_value(global.current_model_wires, w))
        }
        var model_json = json_stringify(clipboard_model_for_json)        
        var model_wires_json = json_stringify(current_model_wires_array)
        var model_path = get_save_filename_ext("WYS Model File | *.wysmdl", "MyFirstModel.wysmdl", "", "Choose a place to save your model.")
        /*
        if(string_pos(model_path, ".wysmdl") == string_length(model_path) - 7){
            model_path = model_path + ".wysmdl"
        }
        */
        var do_save = true
        if(do_save){
            //show_message("WHAT ARE YOU DOIIING 2")
            if(string_length(model_path) > 0){
                //show_message("WHAT ARE YOU DOIIING 3")
                //clipboard_set_text(model_path)
                model_file = file_text_open_write(model_path)
                //show_message(string(model_file))
                file_text_write_string(model_file, "2.0.0a")
                file_text_writeln(model_file)
                file_text_write_string(model_file, "OBJECTS")
                file_text_writeln(model_file)
                file_text_write_string(model_file, model_json)
                file_text_writeln(model_file)
                file_text_write_string(model_file, "WIRES")
                file_text_writeln(model_file)
                file_text_write_string(model_file, model_wires_json)
                file_text_close(model_file)
            }
        }
        
        
        global.cur_model_is_text = false
        break
    case 4:
        break
}

return 1;


