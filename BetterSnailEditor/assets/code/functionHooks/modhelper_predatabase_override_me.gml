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
tool_properties_copy[0] = modhelper_createprop_help("hlp", "editor_prop_info", spr_propico_help, "models_tool_help")
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
var toolProps = [modhelper_createprop_help("hlp", "editor_prop_info", spr_propico_help, "inspector_tool_help")]
variable_struct_set(copy_tool_copy_2, "tool_properties", toolProps)

ds_list_add(global.li_level_editor_database, copy_tool_copy_2)


lvleditor_database_addition = modhelper_create_struct()
lvleditor_database_addition.custom_tool_or_object_id = "Level_Icon"
lvleditor_database_addition.preview_sprite_index = spr_lvlico_normal
lvleditor_database_addition.preview_image_index = 0
lvleditor_database_addition.preview_color = "col_light_ocean"
lvleditor_database_addition.quickrotation_script = gml_Script_toolrotate_impossible
lvleditor_database_addition.placement_script = gml_Script_toolplace_nothing_happens
lvleditor_database_addition.placement_offset_x = 0
lvleditor_database_addition.placement_offset_y = 0
lvleditor_database_addition.deletion_script = gml_Script_toolplace_nothing_happens
lvleditor_database_addition.tool_properties = [modhelper_createprop_help("hlp", "editor_prop_info", spr_propico_help, "level_icon_help"), modhelper_createprop_sprite("icon", "level_icon_title", spr_propico_global, 0, "level_icon_tooltip", gml_Script_level_icon_spr_collection())]

ds_list_add(global.li_level_editor_database, lvleditor_database_addition)


/*
global.communityLevelIcons = ds_map_create()
ds_map_add(global.communityLevelIcons, "normal", spr_lvlico_normal)
ds_map_add(global.communityLevelIcons, "bubble", spr_lvlico_poisonbubbles)
ds_map_add(global.communityLevelIcons, "spike", spr_lvlico_spike)
ds_map_add(global.communityLevelIcons, "thin_spike", spr_lvlico_sharpspike)
ds_map_add(global.communityLevelIcons, "bomb", spr_lvlico_bombs)
ds_map_add(global.communityLevelIcons, "fish", spr_lvlico_fish)
ds_map_add(global.communityLevelIcons, "winter", spr_lvlico_snow)
ds_map_add(global.communityLevelIcons, "evil_snail", spr_lvlico_evilsnail)
ds_map_add(global.communityLevelIcons, "shooter", spr_lvlico_shooter)
ds_map_add(global.communityLevelIcons, "laser", spr_lvlico_lasers)
ds_map_add(global.communityLevelIcons, "puzzle", spr_lvlico_puzzle)
ds_map_add(global.communityLevelIcons, "baby_squid", spr_lvlico_race)
ds_map_add(global.communityLevelIcons, "stars", spr_lvlico_space)
ds_map_add(global.communityLevelIcons, "conveyor", spr_lvlico_conveyor)
ds_map_add(global.communityLevelIcons, "tower_defense", spr_lvlico_defense)
ds_map_add(global.communityLevelIcons, "ball", spr_lvlico_ball)
ds_map_add(global.communityLevelIcons, "protector", spr_lvlico_protector)
*/


lvleditor_database_addition = modhelper_create_struct()
lvleditor_database_addition.custom_tool_or_object_id = "BSE_settings"
lvleditor_database_addition.preview_sprite_index = global.king_snail_sprite
lvleditor_database_addition.preview_image_index = 0
lvleditor_database_addition.preview_color = "col_light_ocean"
lvleditor_database_addition.quickrotation_script = gml_Script_toolrotate_impossible
lvleditor_database_addition.placement_script = gml_Script_toolplace_nothing_happens
lvleditor_database_addition.placement_offset_x = 0
lvleditor_database_addition.placement_offset_y = 0
lvleditor_database_addition.deletion_script = gml_Script_toolplace_nothing_happens
lvleditor_database_addition.tool_properties = [modhelper_createprop_help("hlp", "editor_prop_info", spr_propico_help, "BSE_settings_help"), modhelper_createprop_int_as_string("resizable_boundaries", false, "BSE_resizeable_boundaries", spr_propico_global, 1, "BSE_resizeable_boundaries_tooltip", ["editor_prop_opt_false", "editor_prop_opt_true"])]

ds_list_add(global.li_level_editor_database, lvleditor_database_addition)



global.dont_save_these_objects = ["models_tool", "inspector_tool", "BSE_settings", "Level_Icon"]