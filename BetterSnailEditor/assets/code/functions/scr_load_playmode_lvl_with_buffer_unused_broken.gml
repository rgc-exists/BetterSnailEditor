
/*
hacked_file = 0
if (time == 0)
{
    display_text = "LOADING"
    return 0;
}
else if (time == 1)
{
    room_goto(empty_black_room)
    return 0;
}
else if (time == 2)
{
    fileBuffer = buffer_load(saveName)
    var entireString = buffer_read(fileBuffer, buffer_text)
    file = file_text_open_from_string(entireString)
    buffer_delete(fileBuffer)
    hacked_file = 0
    gameVersion = file_text_readln(file)
    file_text_read_string(file)
    if string_ends_with(gameVersion, "_MODDED")
    {
        saveName = "fallback.lvl"
        time--
        return 0;
    }
    gameVersion = file_text_read_string(file)
    file_text_readln(file)
    if string_ends_with(gameVersion, "_MODDED")
    {
        file_text_close(file)
        file = file_text_open_read("fallback.lvl")
        time--
        return 0;
    }
    leveleditor_database_ini()
    ini_leveleditor_wires()
    file_text_readln(file)
    file_text_read_string(file)
    file_text_readln(file)
    lvl_width = file_text_read_real(file)
    file_text_readln(file)
    lvl_height = file_text_read_real(file)
    file_text_readln(file)
    room_set_width(level_editor_play_mode, lvl_width)
    room_set_height(level_editor_play_mode, lvl_height)
    file_text_readln(file)
    file_text_read_string(file)
    file_text_readln(file)
    listSize = file_text_read_real(file)
    file_text_readln(file)
    for (li = 0; li < listSize; li++)
    {
        var elementToPlace = file_text_read_string(file)
        if (elementToPlace == "spike_rusty")
            elementToPlace = "spike"
        dataBaseStruct = get_leveleditor_database_element(elementToPlace)
        file_text_readln(file)
        dataBaseStruct.image_angle = file_text_read_real(file)
        file_text_readln(file)
        dataBaseStruct.image_xscale = file_text_read_real(file)
        file_text_readln(file)
        dataBaseStruct.image_yscale = file_text_read_real(file)
        file_text_readln(file)
        arraySize = file_text_read_real(file)
        file_text_readln(file)
        for (ti = 0; ti < arraySize; ti++)
        {
            thsToolKey = file_text_read_string(file)
            file_text_readln(file)
            thsToolValue = file_text_read_real(file)
            file_text_readln(file)
            thsToolProp = ds_map_find_value(dataBaseStruct.ds_map_tool_properties, thsToolKey)
            if is_undefined(thsToolProp)
                show_debug_message((((("Property " + thsToolKey) + " in element ") + elementToPlace) + " is undefined."))
            else
                thsToolProp.value = thsToolValue
        }
    }
    room_goto(level_editor_play_mode)
    return 0;
}
else if (time == 3)
{
    playerToolStruct = get_leveleditor_database_element("player")
    lvlColorScheme = ds_map_find_value(playerToolStruct.ds_map_tool_properties, "ltyp").value
    lvlDarkMode = ds_map_find_value(playerToolStruct.ds_map_tool_properties, "ldrk").value
    lvlBgVisible = ds_map_find_value(playerToolStruct.ds_map_tool_properties, "bgvis").value
    wallVisible = ds_map_find_value(playerToolStruct.ds_map_tool_properties, "wlvis").value
    if lvlDarkMode
        instance_create_layer(0, 0, "FadeOutIn", obj_dark_level)
    switch lvlColorScheme
    {
        case 0:
            instance_create_layer(0, 0, "FadeOutIn", obj_levelstyler)
            break
        case 1:
            instance_create_layer(0, 0, "FadeOutIn", obj_levelstyler_disco)
            break
        case 2:
            instance_create_layer(0, 0, "FadeOutIn", obj_levelstyler_underwater)
            break
        case 3:
            instance_create_layer(0, 0, "FadeOutIn", obj_levelstyler_bubblegum)
            break
        case 4:
            instance_create_layer(0, 0, "FadeOutIn", obj_levelstyler_winter)
            break
        case 5:
            instance_create_layer(0, 0, "FadeOutIn", obj_levelstyler_brain)
            break
    }

    if (lvlBgVisible == 0)
    {
        obj_levelstyler.enable_back_particle_spawn = 0
        instance_destroy(obj_backdraw)
    }
    else if (lvlBgVisible == 2)
        obj_backdraw.glitchy = 1
    else if (lvlBgVisible == 3)
    {
        obj_levelstyler.enable_back_particle_spawn = 0
        instance_destroy(obj_backdraw)
        instance_create_layer(0, 0, "BackPatterns", obj_light_stars_background)
    }
    else if (lvlBgVisible == 4)
    {
        obj_levelstyler.enable_back_particle_spawn = 0
        instance_destroy(obj_backdraw)
        instance_create_layer(0, 0, "BackPatterns", obj_light_ocean_background)
    }
    obj_levelstyler.rythmic_changes_enabled = 1
    lvlSquidVisible = ds_map_find_value(playerToolStruct.ds_map_tool_properties, "sv").value
    if (!lvlSquidVisible)
        instance_create_layer(0, 0, "FadeOutIn", obj_no_squid_in_this_level)
    leveleditor_spawn_music(lvlColorScheme == 2, playerToolStruct)
    instance_create_layer(0, 0, "PostProcessing", obj_post_processing_draw)
    global.conveyor_belt_speed = ds_map_find_value(get_leveleditor_database_element("conveyor").ds_map_tool_properties, "conveyspeed").value
    file_text_readln(file)
    file_text_read_string(file)
    file_text_readln(file)
    for (li = 0; li < 10; li++)
    {
        file_text_read_string(file)
        file_text_readln(file)
    }
    return 0;
}
leveleditor_database_prepare()
ini_leveleditor_paths()
global.lvlchecksum = ""
temp_map_properties = ds_map_create()
file_text_readln(file)
file_text_read_string(file)
file_text_readln(file)
listSize = file_text_read_real(file)
file_text_readln(file)
for (li = 0; li < listSize; li++)
{
    var itemToLoad = file_text_read_string(file)
    show_message(itemToLoad)
    if (itemToLoad == "spike_rusty")
        itemToLoad = "spike"
    dataBaseStruct = get_leveleditor_database_element(itemToLoad)
    file_text_readln(file)
    instListSize = file_text_read_real(file)
    file_text_readln(file)
    global.lvlchecksum += (string(instListSize) + "|")
    for (ti = 0; ti < instListSize; ti++)
    {
        this_x = file_text_read_real(file)
        file_text_readln(file)
        this_y = file_text_read_real(file)
        file_text_readln(file)
        var objectToSpawn = (is_method(dataBaseStruct.object_index_in_game) ? script_execute(dataBaseStruct.object_index_in_game, dataBaseStruct) : dataBaseStruct.object_index_in_game)
        if (itemToLoad == "spike" && lvlDarkMode)
            objectToSpawn = 222
        thisInst = instance_create_layer(this_x, this_y, dataBaseStruct.preview_layer, objectToSpawn)
        thisInst.image_angle = file_text_read_real(file)
        file_text_readln(file)
        thisInst.image_xscale = file_text_read_real(file)
        file_text_readln(file)
        thisInst.image_yscale = file_text_read_real(file)
        file_text_readln(file)
        ds_list_add(dataBaseStruct.li_placed_instances, thisInst)
        ds_map_clear(temp_map_properties)
        prisize = file_text_read_real(file)
        file_text_readln(file)
        for (pri = 0; pri < prisize; pri++)
        {
            thisKey = file_text_read_string(file)
            file_text_readln(file)
            thisValue = file_text_read_real(file)
            file_text_readln(file)
            thsToolProp = ds_map_find_value(dataBaseStruct.ds_map_tool_properties, thisKey)
            leveleditor_set_hacked_if_invalid(thsToolProp)
            ds_map_add(temp_map_properties, thisKey, thisValue)
        }
        script_execute(dataBaseStruct.prepforplay, thisInst, temp_map_properties, dataBaseStruct)
    }
}
ds_map_destroy(temp_map_properties)
if (!is_allowed_checksum(global.lvlchecksum))
{
    show_error("It seems like this level was modified. Revert this level back into its original state to play.", 1)
    game_end()
}
instance_create_layer(0, 0, "Player", obj_ai_level_editor)
scr_create_wall_lines()
global.collision_grid_filled = 0
scr_colgrid_fill()
ds_list_clear(obj_in_community_level.li_power_connections_at_start)
file_text_readln(file)
file_text_read_string(file)
file_text_readln(file)
listSize = file_text_read_real(file)
file_text_readln(file)
for (li = 0; li < listSize; li++)
{
    toolFrom = get_leveleditor_database_element(file_text_read_string(file))
    file_text_readln(file)
    iFrom = file_text_read_real(file)
    file_text_readln(file)
    objFrom = ds_list_find_value(toolFrom.li_placed_instances, iFrom)
    toolTo = get_leveleditor_database_element(file_text_read_string(file))
    file_text_readln(file)
    objTo = ds_list_find_value(toolTo.li_placed_instances, file_text_read_real(file))
    file_text_readln(file)
    var structWireHFrom = -4
    var structWireHTo = -4
    if variable_struct_exists(toolFrom, "custom_wire_handler")
        structWireHFrom = toolFrom.custom_wire_handler
    if variable_struct_exists(toolTo, "custom_wire_handler")
        structWireHTo = toolTo.custom_wire_handler
    if (structWireHTo == -4 && structWireHFrom == -4)
        leveleditor_connectwires_default(objFrom, objTo, toolFrom, toolTo)
    else if (structWireHFrom != -4 && structWireHTo == -4)
        script_execute(structWireHFrom, objFrom, objTo, toolFrom, toolTo)
    else if (structWireHFrom == -4 && structWireHTo != -4)
        script_execute(structWireHTo, objTo, objFrom, toolTo, toolFrom)
    else if (structWireHFrom != -4 && structWireHTo != -4)
    {
        script_execute(structWireHFrom, objFrom, objTo, toolFrom, toolTo)
        script_execute(structWireHTo, objTo, objFrom, toolTo, toolFrom)
    }
}
enemySpawnerStruct = get_leveleditor_database_element("td_enemy_spwaner")
bombSpawnerStruct = get_leveleditor_database_element("bomb_spawner")
gunStruct = get_leveleditor_database_element("playergun")
obj_in_community_level.bomb_degrees = ds_map_find_value(enemySpawnerStruct.ds_map_tool_properties, "bomb_degrees").value
obj_in_community_level.bomb_speed = ds_map_find_value(enemySpawnerStruct.ds_map_tool_properties, "bomb_speed").value
obj_in_community_level.bomb_p_grav = ds_map_find_value(bombSpawnerStruct.ds_map_tool_properties, "bomb_speed").value
obj_in_community_level.gun_speed_mult = ds_map_find_value(gunStruct.ds_map_tool_properties, "gun_speed").value
obj_in_community_level.gun_cooldown = ds_map_find_value(gunStruct.ds_map_tool_properties, "gun_cooldown").value
lvl_convertpaths()
scr_set_up_or_reset_power_grid()
if (ds_map_find_value(get_leveleditor_database_element("conveyor").ds_map_tool_properties, "conveystate").value == 0)
    global.conveyor_belt_direction *= -1
scr_update_conveyor_visuals()
if instance_exists(obj_dark_level)
    scr_create_floor_lights()
if (ds_list_size(playerToolStruct.li_placed_instances) == 0)
    instance_create_layer(0, 0, "Player", obj_player)
if (!wallVisible)
{
    with (obj_wall)
    {
        if (object_index == obj_destructable_wall)
        {
        }
        else if (object_index == obj_explosive_wall)
        {
        }
        else
            visible = false
    }
}
obj_player.first_spawn_in_community = 1
file_text_close(file)
return 1;
*/