hacked_file = 0
if (time == 0)
{
    display_text = "LOADING"
    if (room != level_editor)
        room_goto(level_editor)
    return 0;
}
else if (time <= 2)
    return 0;
if(!file_exists(saveName)){
    clear_existing_level()
    show_debug_message("Level file does not exist, stopping loading and showing empty level.")
    return 1;
}
fileBuffer = buffer_load(saveName)
var entireString = buffer_read(fileBuffer, buffer_text)
splitLines = string_split(entireString, "\n")
buffer_delete(fileBuffer)
curLine = 0
levelData = ds_map_find_value(global.campaignMap, array_get(info, 0)).levels[info[1]]
if (levelData.isModded && (!global.isEditorModded))
{
    clear_existing_level()
    obj_level_editor.level_bound_x1 = 0
    obj_level_editor.level_bound_y1 = 0
    obj_level_editor.level_bound_x2 = 0
    obj_level_editor.level_bound_y2 = 0
    show_debug_message("Level is modded while the game is not, refusing to load!")
    return 1;
}
clear_existing_level()
gameVersion = gml_Script_read_string_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
gml_Script_read_string_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
obj_level_editor.level_bound_x1 = 0
obj_level_editor.level_bound_y1 = 0
obj_level_editor.level_bound_x2 = gml_Script_read_real_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
obj_level_editor.level_bound_y2 = gml_Script_read_real_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
gml_Script_read_string_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
listSize = gml_Script_read_real_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
for (li = 0; li < listSize; li++)
{
    var toLoad = gml_Script_read_string_in_split_buffer_string()
    if (toLoad == "spike_rusty")
        toLoad = "spike"
    dataBaseStruct = get_leveleditor_database_element(toLoad)
    gml_Script_read_next_index_in_split_buffer_string()
    dataBaseStruct.image_angle = gml_Script_read_real_in_split_buffer_string()
    gml_Script_read_next_index_in_split_buffer_string()
    dataBaseStruct.image_xscale = gml_Script_read_real_in_split_buffer_string()
    gml_Script_read_next_index_in_split_buffer_string()
    dataBaseStruct.image_yscale = gml_Script_read_real_in_split_buffer_string()
    gml_Script_read_next_index_in_split_buffer_string()
    arraySize = gml_Script_read_real_in_split_buffer_string()
    gml_Script_read_next_index_in_split_buffer_string()
    for (ti = 0; ti < arraySize; ti++)
    {
        thsToolKey = gml_Script_read_string_in_split_buffer_string()
        gml_Script_read_next_index_in_split_buffer_string()
        thsToolValue = gml_Script_read_real_in_split_buffer_string()
        gml_Script_read_next_index_in_split_buffer_string()
        thsToolProp = ds_map_find_value(dataBaseStruct.ds_map_tool_properties, thsToolKey)
        if (!is_undefined(thsToolProp))
        {
            variable_struct_set(thsToolProp, "value", thsToolValue)
            if (thsToolKey == "tex")
            {
                variable_struct_set(dataBaseStruct, "preview_sprite_index", script_execute(variable_struct_get(thsToolProp, "CurrentPreviewSprite")))
                variable_struct_set(dataBaseStruct, "preview_sprite_index_once_placed", script_execute(variable_struct_get(thsToolProp, "CurrentPreviewSprite")))
                if(toLoad == "wall" || toLoad == "wall_gl" || toLoad == "walkthr_wall")
                {
                    var wall_sprite_textures = [gml_Script_wallspr_normal, gml_Script_wallspr_bridge, gml_Script_wallspr_vertical, gml_Script_wallspr_horizontal, gml_Script_wallspr_white, gml_Script_wallspr_grey]
                    variable_struct_set(dataBaseStruct, "preview_sprite_index", script_execute(wall_sprite_textures[thsToolValue], 1))
                    variable_struct_set(dataBaseStruct, "preview_sprite_index_once_placed", script_execute(wall_sprite_textures[thsToolValue], 1))
                } else if(toLoad == "wall_cr")
                {
                    var wall_sprite_textures = [gml_Script_wallspr_brain, gml_Script_wallspr_braintop, gml_Script_wallspr_black]
                    variable_struct_set(dataBaseStruct, "preview_sprite_index", script_execute(wall_sprite_textures[thsToolValue], 1))
                    variable_struct_set(dataBaseStruct, "preview_sprite_index_once_placed", script_execute(wall_sprite_textures[thsToolValue], 1))
                }
            }
            leveleditor_set_hacked_if_invalid(thsToolProp)
        }
    }
}
gml_Script_read_next_index_in_split_buffer_string()
gml_Script_read_string_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
for (li = 0; li < 10; li++)
{
    var slotToSet = gml_Script_read_string_in_split_buffer_string()
    if (slotToSet == "spike_rusty")
        slotToSet = "spike"
    ds_list_replace(obj_level_editor.li_quicktool_slots, li, get_leveleditor_database_element(slotToSet))
    gml_Script_read_next_index_in_split_buffer_string()
}
gml_Script_read_next_index_in_split_buffer_string()
gml_Script_read_string_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
listSize = gml_Script_read_real_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
for (li = 0; li < listSize; li++)
{
    var dataBaseEntryToLoad = gml_Script_read_string_in_split_buffer_string()
    if (dataBaseEntryToLoad == "spike_rusty")
        dataBaseEntryToLoad = "spike"
    dataBaseStruct = get_leveleditor_database_element(dataBaseEntryToLoad)
    gml_Script_read_next_index_in_split_buffer_string()
    instListSize = gml_Script_read_real_in_split_buffer_string()
    gml_Script_read_next_index_in_split_buffer_string()
    for (ti = 0; ti < instListSize; ti++)
    {
        this_x = gml_Script_read_real_in_split_buffer_string()
        gml_Script_read_next_index_in_split_buffer_string()
        this_y = gml_Script_read_real_in_split_buffer_string()
        gml_Script_read_next_index_in_split_buffer_string()
        thisInst = instance_create_layer(this_x, this_y, dataBaseStruct.preview_layer, variable_struct_get(dataBaseStruct, "object_index_in_editor"))
        thisInst.sprite_index = dataBaseStruct.preview_sprite_index_once_placed
        thisInst.image_index = dataBaseStruct.preview_image_index
        thisInst.image_speed = 0
        thisInst.image_blend = dataBaseStruct.preview_color
        thisInst.image_angle = gml_Script_read_real_in_split_buffer_string()
        gml_Script_read_next_index_in_split_buffer_string()
        thisInst.image_xscale = gml_Script_read_real_in_split_buffer_string()
        gml_Script_read_next_index_in_split_buffer_string()
        thisInst.image_yscale = gml_Script_read_real_in_split_buffer_string()
        gml_Script_read_next_index_in_split_buffer_string()
        thisInst.toolStruct = dataBaseStruct
        ds_list_add(dataBaseStruct.li_placed_instances, thisInst)
        prisize = gml_Script_read_real_in_split_buffer_string()
        gml_Script_read_next_index_in_split_buffer_string()
        thisInst.map_properties = ds_map_create()
        for (pri = 0; pri < prisize; pri++)
        {
            thisKey = gml_Script_read_string_in_split_buffer_string()
            gml_Script_read_next_index_in_split_buffer_string()
            thisValue = gml_Script_read_real_in_split_buffer_string()
            gml_Script_read_next_index_in_split_buffer_string()
            ds_map_add(thisInst.map_properties, thisKey, thisValue)
            thsToolProp = ds_map_find_value(dataBaseStruct.ds_map_tool_properties, thisKey)
            leveleditor_set_hacked_if_invalid(thsToolProp)
            if (thisKey == "tex")
            {
                temp_map_properties = ds_map_create()
                ds_map_add(temp_map_properties, "tex", thisValue)
                script_execute(dataBaseStruct.prepforplay, thisInst, temp_map_properties, dataBaseStruct)
                ds_map_destroy(temp_map_properties)
            }
        }
        for (i = 0; i < array_length(dataBaseStruct.tool_properties); i++)
        {
            var tool_cur_prop = dataBaseStruct.tool_properties[i]
            if (tool_cur_prop.copy_property_to_placed_obj && (!(ds_map_exists(thisInst.map_properties, tool_cur_prop.key))))
                ds_map_add(thisInst.map_properties, tool_cur_prop.key, tool_cur_prop.def_value)
        }
    }
}
gml_Script_read_next_index_in_split_buffer_string()
gml_Script_read_string_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
listSize = gml_Script_read_real_in_split_buffer_string()
gml_Script_read_next_index_in_split_buffer_string()
for (li = 0; li < listSize; li++)
{
    toolFrom = get_leveleditor_database_element(gml_Script_read_string_in_split_buffer_string())
    gml_Script_read_next_index_in_split_buffer_string()
    objFrom = ds_list_find_value(toolFrom.li_placed_instances, gml_Script_read_real_in_split_buffer_string())
    gml_Script_read_next_index_in_split_buffer_string()
    toolTo = get_leveleditor_database_element(gml_Script_read_string_in_split_buffer_string())
    gml_Script_read_next_index_in_split_buffer_string()
    objTo = ds_list_find_value(toolTo.li_placed_instances, gml_Script_read_real_in_split_buffer_string())
    gml_Script_read_next_index_in_split_buffer_string()
    lvlwire_create(objFrom, objTo)
}
if hacked_file
{
}
return 1;