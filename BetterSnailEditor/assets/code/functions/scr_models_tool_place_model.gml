var x_off = variable_struct_get(ds_map_find_value(variable_struct_get(argument0, "ds_map_tool_properties"), "copyxoff"), "value")
var y_off = variable_struct_get(ds_map_find_value(variable_struct_get(argument0, "ds_map_tool_properties"), "copyyoff"), "value")
clipboard_model = []
if(variable_global_exists("current_model")){
    clipboard_model = global.current_model
}
if(variable_global_exists("current_model_wires")){
    clipboard_model_wires = global.current_model_wires
}
switch argument1
{
    case 0:
        hlp_toolplace_start_dragging_box(argument0)
        break
    case 1:
        hlp_toolplace_drag_box_step_one_by_one(argument0, 4, 16777215, 107, 1.3, 0.1)
        var mx = mouse_drag_box_current_x
        var my = mouse_drag_box_current_y
        if(variable_global_exists("current_model")){
            for (i = 0; i < array_length(global.current_model); i++)
                hlp_show_copy_preview((mx * 60), (my * 60), clipboard_model[i], variable_struct_get(argument0, "image_angle"), x_off, y_off)
        }
        if(variable_instance_exists(id, "clipboard_model_wires")){
            for(var w = 0; w < ds_list_size(clipboard_model_wires); w++){
                thisWire = ds_list_find_value(clipboard_model_wires, w)
                var thisWireFrom = clipboard_model[thisWire[0]]
                var thisWireTo = clipboard_model[thisWire[1]]
                twX1 = mx * 60 + x_off + variable_struct_get(thisWireFrom, "x")
                twY1 = my * 60 + y_off + variable_struct_get(thisWireFrom, "y")
                twX2 = mx * 60 + x_off + variable_struct_get(thisWireTo, "x")
                twY2 = my * 60 + y_off + variable_struct_get(thisWireTo, "y")
                draw_set_color(c_white)
                draw_set_alpha(.8)
                scr_draw_puzzle_laser(twX1, twY1, twX2, twY2, 12, obj_levelstyler.col_snail, 1)
            }
        }
        break
    case 4:
        mx = floor((global.cursor_in_level_x / 60))
        my = floor((global.cursor_in_level_y / 60))
        if(variable_global_exists("current_model")){
            for (i = 0; i < array_length(clipboard_model); i++)
            {
                var _Ts = clipboard_model[i].toolStruct
                if variable_struct_exists(_Ts, "can_be_copied")
                {
                    if (_Ts.can_be_copied == 4 && (clipboard_model[i].scaleX != 1 || clipboard_model[i].scaleY != 1) && argument0.image_angle != 0)
                    {
                    }
                    else if (_Ts.can_be_copied == 2 && argument0.image_angle != 0)
                    {
                    }
                    else
                        hlp_show_copy_preview((mx * 60), (my * 60), clipboard_model[i], argument0.image_angle, x_off, y_off)
                }
                else
                    hlp_show_copy_preview((mx * 60), (my * 60), clipboard_model[i], argument0.image_angle, x_off, y_off)
            }
       }
        if(variable_instance_exists(id, "clipboard_model_wires")){
            for(var w = 0; w < ds_list_size(clipboard_model_wires); w++){
                thisWire = ds_list_find_value(clipboard_model_wires, w)
                var thisWireFrom = clipboard_model[thisWire[0]]
                var thisWireTo = clipboard_model[thisWire[1]]
                twX1 = mx * 60 + x_off + variable_struct_get(thisWireFrom, "x")
                twY1 = my * 60 + y_off + variable_struct_get(thisWireFrom, "y")
                twX2 = mx * 60 + x_off + variable_struct_get(thisWireTo, "x")
                twY2 = my * 60 + y_off + variable_struct_get(thisWireTo, "y")
                draw_set_color(c_white)
                draw_set_alpha(.8)
                scr_draw_puzzle_laser(twX1, twY1, twX2, twY2, 12, obj_levelstyler.col_snail, 1)
            }
        }
        break

    case 2:
    
        var created_instances = ds_list_create()
        created_inst_x = (mouse_drag_box_current_x * 60)
        created_inst_y = (mouse_drag_box_current_y * 60)
        for (i = 0; i < array_length(clipboard_model); i++)
        {
            var clip_entry = clipboard_model[i]
            _Ts = clipboard_model[i].toolStruct
            if variable_struct_exists(_Ts, "can_be_copied")
            {
                if (_Ts.can_be_copied == 2 && argument0.image_angle != 0)
                {
                }
                else
                {
                    rot_data = hlp_rotate_object_data(created_inst_x, created_inst_y, (created_inst_x + clip_entry.x), (created_inst_y + clip_entry.y), argument0.image_angle, clip_entry.toolStruct, clip_entry, x_off, y_off)
                    created_inst = instance_create_layer(rot_data.x, rot_data.y, _Ts.preview_layer, _Ts.object_index_in_editor)
                    ds_list_add(created_instances, created_inst)
                    created_inst.sprite_index = _Ts.preview_sprite_index_once_placed
                    created_inst.image_index = _Ts.preview_image_index
                    created_inst.image_blend = _Ts.preview_color
                    created_inst.image_angle = rot_data.image_angle
                    created_inst.image_xscale = rot_data.image_xscale
                    created_inst.image_yscale = rot_data.image_yscale
                    if(global.cur_model_is_text){
                        if(_Ts.custom_tool_or_object_id == "anchor"){
                            created_inst.image_xscale = 0.1
                            created_inst.image_yscale = 0.1
                            ds_map_replace(clip_entry.properties, "visible", true)
                        }
                    }
                    ds_list_add(_Ts.li_placed_instances, created_inst)
                    created_inst.map_properties = clip_entry.properties
                    created_inst.toolStruct = _Ts
                    call_after_initializing_new_level_editor_object(created_inst)
                    toolplace_delete_similar(created_inst)
                }
            }
            else
            {
                rot_data = hlp_rotate_object_data(created_inst_x, created_inst_y, (created_inst_x + clip_entry.x), (created_inst_y + clip_entry.y), argument0.image_angle, clip_entry.toolStruct, clip_entry, x_off, y_off)
                created_inst = instance_create_layer(rot_data.x, rot_data.y, _Ts.preview_layer, _Ts.object_index_in_editor)
                ds_list_add(created_instances, created_inst)
                created_inst.sprite_index = _Ts.preview_sprite_index_once_placed
                created_inst.image_index = _Ts.preview_image_index
                created_inst.image_blend = _Ts.preview_color
                created_inst.image_angle = rot_data.image_angle
                created_inst.image_xscale = rot_data.image_xscale
                created_inst.image_yscale = rot_data.image_yscale
                ds_list_add(_Ts.li_placed_instances, created_inst)
                created_inst.map_properties = clip_entry.properties
                created_inst.toolStruct = _Ts
                call_after_initializing_new_level_editor_object(created_inst)
                toolplace_delete_similar(created_inst)
            }
        }
        if(variable_instance_exists(id, "clipboard_model_wires")){
            for(i = 0; i < ds_list_size(clipboard_model_wires); i++){
                var ww = ds_list_find_value(clipboard_model_wires, i)
                lvlwire_create(ds_list_find_value(created_instances, ww[0]), ds_list_find_value(created_instances, ww[1]))
            }
        }
        ds_list_destroy(created_instances)
        for(var m = 0; m < array_length(clipboard_model); m++){
            var current_model_obj = clipboard_model[m]
            variable_struct_set(current_model_obj, "toolStruct", get_leveleditor_database_element(variable_struct_get(current_model_obj, "custom_tool_or_object_id")))
            var li_properties = ds_map_create()
            var properties_struct = variable_struct_get(current_model_obj, "properties")
            names = variable_struct_get_names(properties_struct)
            for(var i = 0; i < variable_struct_names_count(properties_struct); i += 1){
                ds_map_add(li_properties, names[i], variable_struct_get(properties_struct, names[i]))
            }
            variable_struct_get(current_model_obj, "properties", li_properties)
            global.cur_model_is_text = true
        }
        break
}

return 1;


