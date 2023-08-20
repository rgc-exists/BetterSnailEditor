#orig#()


copy_tool = -1
for(var o = 0; o < ds_list_size(global.li_level_editor_database); o += 1){
    copy_tool = ds_list_find_value(global.li_level_editor_database, o)
    if(variable_struct_get(copy_tool, "custom_tool_or_object_id") == "copy_tool"){
        break
    }
}

names = variable_struct_get_names(copy_tool)
copy_tool_copy = modhelper_create_struct()

for(var i = 0; i < variable_struct_names_count(copy_tool); i += 1){
    variable_struct_set(copy_tool_copy, names[i], variable_struct_get(copy_tool, names[i]))
}

variable_struct_set(copy_tool_copy, "custom_tool_or_object_id", "models_tool")
variable_struct_set(copy_tool_copy, "preview_color", "col_bubbles")
variable_struct_set(copy_tool_copy, "preview_sprite_index", global.model_tool_sprite)
variable_struct_set(copy_tool_copy, "placement_script", gml_Script_scr_models_tool_place_model) // gml_Script_scr_temp_models_tool_warning
variable_struct_set(copy_tool_copy, "deletion_script", gml_Script_scr_models_tool_save_model) // gml_Script_scr_temp_models_tool_warning
var toolProps = variable_struct_get(copy_tool_copy, "tool_properties")
var tool_properties_copy = []
for(var tp = 0; tp < array_length(toolProps); tp++){
    array_push(tool_properties_copy, toolProps[tp])
}
array_delete(tool_properties_copy, 0, 1)
variable_struct_set(copy_tool_copy, "tool_properties", tool_properties_copy)

ds_list_add(global.li_level_editor_database, copy_tool_copy)

copy_tool_copy_2 = modhelper_create_struct()

for(var i = 0; i < variable_struct_names_count(copy_tool); i += 1){
    variable_struct_set(copy_tool_copy_2, names[i], variable_struct_get(copy_tool, names[i]))
}

variable_struct_set(copy_tool_copy_2, "custom_tool_or_object_id", "inspector_tool")
variable_struct_set(copy_tool_copy_2, "preview_color", "col_snail")
variable_struct_set(copy_tool_copy_2, "preview_sprite_index", global.inspector_tool_sprite)
variable_struct_set(copy_tool_copy_2, "placement_script", gml_Script_scr_inspector_select_blocks_in_rect)
variable_struct_set(copy_tool_copy_2, "deletion_script", gml_Script_toolplace_nothing_happens)
var toolProps = []
variable_struct_set(copy_tool_copy_2, "tool_properties", toolProps)

ds_list_add(global.li_level_editor_database, copy_tool_copy_2)




if variable_global_exists("map_level_editor_database")
    ds_map_clear(global.map_level_editor_database)
else
    global.map_level_editor_database = ds_map_create()
for (var iprp = 0; iprp < ds_list_size(global.li_level_editor_database); iprp++)
{
    //show_message(string(iprp))
    var lvleditor_database_element = ds_list_find_value(global.li_level_editor_database, iprp)
    variable_struct_set(lvleditor_database_element,"image_angle",0)
    variable_struct_set(lvleditor_database_element,"image_xscale",1)
    variable_struct_set(lvleditor_database_element,"image_yscale",1)
    variable_struct_set(lvleditor_database_element,"li_placed_instances",ds_list_create())
    variable_struct_set(lvleditor_database_element,"selected_property",0)
    variable_struct_set(lvleditor_database_element,"index_of_top_property_in_wndw",0)
    variable_struct_set(lvleditor_database_element,"ds_map_tool_properties",ds_map_create())
    for (ili = 0; ili < array_length(lvleditor_database_element.tool_properties); ili++)
    {
        toolpropili = lvleditor_database_element.tool_properties[ili]
        ds_map_add(variable_struct_get(lvleditor_database_element,"ds_map_tool_properties"), toolpropili.key, toolpropili)
    }
    ds_map_add(global.map_level_editor_database, variable_struct_get(lvleditor_database_element,"custom_tool_or_object_id"), lvleditor_database_element)
    //show_message(string(lvleditor_database_element))
}
//clipboard_set_text(json_encode(global.map_level_editor_database))