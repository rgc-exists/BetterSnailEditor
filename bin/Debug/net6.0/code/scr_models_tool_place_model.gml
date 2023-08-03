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

    case 2:
    
        created_inst_x = (mouse_drag_box_current_x * 60)
        created_inst_y = (mouse_drag_box_current_y * 60)
        created_instances = ds_list_create()
        for (i = 0; i < array_length(clipboard_model); i++)
        {
            var clip_entry = clipboard_model[i]
            var _Ts = get_leveleditor_database_element(variable_struct_get(clipboard_model[i], "custom_tool_or_object_id"))
            //show_message("test 1") 
            var test = variable_struct_get(argument0, "image_angle")
            //show_message("test 2") 
            test = variable_struct_get(clip_entry, "toolStruct")
            //show_message("test 3") 
            rot_data = hlp_rotate_object_data(created_inst_x, created_inst_y, (created_inst_x + clip_entry.x), (created_inst_y + clip_entry.y), variable_struct_get(argument0, "image_angle"), variable_struct_get(clip_entry, "toolStruct"), clip_entry, x_off, y_off)
            //show_message("b")
            created_inst = instance_create_layer(rot_data.x, rot_data.y, variable_struct_get(_Ts, "preview_layer"), variable_struct_get(_Ts, "object_index_in_editor"))
            //show_message("c")
            created_inst.sprite_index = variable_struct_get(_Ts, "preview_sprite_index_once_placed")
            created_inst.image_index = variable_struct_get(_Ts, "preview_image_index")
            created_inst.image_blend = variable_struct_get(_Ts, "preview_color")
            created_inst.image_angle = rot_data.image_angle
            //show_message("d")
            if(global.cur_model_is_text && variable_struct_get(_Ts, "custom_tool_or_object_id") == "anchor"){
                created_inst.image_xscale = 0.1
                created_inst.image_yscale = 0.1
            } else {
                created_inst.image_xscale = rot_data.image_xscale
                created_inst.image_yscale = rot_data.image_yscale
            }
            //show_message("e")
            ds_list_add(_Ts.li_placed_instances, created_inst)
            //show_message("f")
            ds_list_add(created_instances, created_inst)
            /*
            for(var e = 0; e < ds_list_size(global.li_level_editor_database); e++){
                var cur_database_obj = ds_list_find_value(global.li_level_editor_database, e)
                if(cur_database_obj.custom_tool_or_object_id == _Ts.custom_tool_or_object_id){
                    var cur_placed_instances = cur_database_obj.li_placed_instances
                    ds_list_add(cur_placed_instances, created_inst)
                    variable_struct_set(cur_database_obj, "li_placed_instances", cur_placed_instances)
                    ds_list_replace(global.li_level_editor_database, e, cur_database_obj)
                }
            }
            */
            //show_message("g")
            if(typeof(clip_entry.properties) == "struct"){
                /*
                if(variable_instance_exists(id, "clip_entry_prop_map")){
                    ds_map_clear(clip_entry_prop_map)
                } else {
                    clip_entry_prop_map = ds_map_create()
                }
                */
                clip_entry_prop_map = ds_map_create()
                for(var p = 0; p < variable_struct_names_count(clip_entry.properties); p++){
                    var curNames = variable_struct_get_names(clip_entry.properties)
                    var curName = curNames[p]
                    ds_map_add(clip_entry_prop_map, curName, variable_struct_get(clip_entry.properties, curName))
                }
                created_inst.map_properties = clip_entry_prop_map
            } else {
                created_inst.map_properties = clip_entry.properties
            }
            //show_message("h")
            created_inst.toolStruct = _Ts
            //show_message("i")
            call_after_initializing_new_level_editor_object(created_inst)
            //show_message("j")
            if(!global.cur_model_is_text){
                toolplace_delete_similar(created_inst)
            }
        }
        if(variable_instance_exists(id, "clipboard_model_wires")){
            for(i = 0; i < ds_list_size(clipboard_model_wires); i++){
                var ww = ds_list_find_value(clipboard_model_wires, i)
                lvlwire_create(ds_list_find_value(created_instances, ww[0]), ds_list_find_value(created_instances, ww[1]))
            }
        }
        //show_message("k")
        ds_list_destroy(created_instances)
        break
}

return 1;


