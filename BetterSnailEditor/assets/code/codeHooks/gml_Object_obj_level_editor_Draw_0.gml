var level_bound_x1_remember = level_bound_x1
var level_bound_y1_remember = level_bound_y1
var level_bound_x2_remember = level_bound_x2
var level_bound_y2_remember = level_bound_y2

#orig#()

if(global.inspector_active){
    if(variable_global_exists("inspector_selected_obj")){
        if(!is_undefined(global.inspector_selected_obj)){
            if(instance_exists(global.inspector_selected_obj)){
                hlp_draw_bounding_box_around_obj(global.inspector_selected_obj, 4, c_white)
            }
        }
    }
}
if(variable_instance_exists(id, "inspector_select_cooldown")){
    inspector_select_cooldown--;
}

var BSEsettingsElement = get_leveleditor_database_element("BSE_settings")
var resize_level_enabled = true
for(var toolp = 0; toolp < array_length(BSEsettingsElement.tool_properties); toolp++){
    var thsToolP = BSEsettingsElement.tool_properties[toolp]
    if(thsToolP.key == "resizable_boundaries"){
        resize_level_enabled = thsToolP.value
    }
}
if(variable_instance_exists(id, "selectedToolStruct")){
    if(!is_undefined(selectedToolStruct)){
        if(variable_struct_get(selectedToolStruct, "custom_tool_or_object_id") == "move_tool"){
            if(variable_instance_exists(id, "drag_collision")){
                if(drag_collision <= -69){
                    resize_level_enabled = true
                }
            }
        }
    }
}
if(!resize_level_enabled){
    level_bound_x1 = level_bound_x1_remember
    level_bound_y1 = level_bound_y1_remember
    level_bound_x2 = level_bound_x2_remember
    level_bound_y2 = level_bound_y2_remember
}