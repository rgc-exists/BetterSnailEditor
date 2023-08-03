    hacked_file = 0
    if (time == 0)
    {
        display_text = "LOADING"
        file = file_text_open_read(saveName)
        if (room != level_editor)
            room_goto(level_editor)
        return 0;
    }
    else if (time <= 2)
        return 0;
    if (file == -1)
    {
        show_debug_message("Level file does not exist, stopping loading and showing empty level.")
        return 1;
    }
    clear_existing_level()
    gameVersion = file_text_read_string(file)
    file_text_readln(file)
    file_text_readln(file)
    file_text_read_string(file)
    file_text_readln(file)
    obj_level_editor.level_bound_x1 = 0
    obj_level_editor.level_bound_y1 = 0
    obj_level_editor.level_bound_x2 = file_text_read_real(file)
    file_text_readln(file)
    obj_level_editor.level_bound_y2 = file_text_read_real(file)
    file_text_readln(file)
    file_text_readln(file)
    file_text_read_string(file)
    file_text_readln(file)
    listSize = file_text_read_real(file)
    file_text_readln(file)
    for (li = 0; li < listSize; li++)
    {
        var toLoad = file_text_read_string(file)
        if (toLoad == "spike_rusty")
            toLoad = "spike"
        dataBaseStruct = get_leveleditor_database_element(toLoad)
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
            if (!is_undefined(thsToolProp))
            {
                thsToolProp.value = thsToolValue
                if (thsToolKey == "tex")
                {
                    dataBaseStruct.preview_sprite_index = thsToolProp.thsToolProp.CurrentPreviewSprite()
                    dataBaseStruct.preview_sprite_index_once_placed = thsToolProp.thsToolProp.CurrentPreviewSprite()
                }
                leveleditor_set_hacked_if_invalid(thsToolProp)
            }
        }
    }
    file_text_readln(file)
    file_text_read_string(file)
    file_text_readln(file)
    for (li = 0; li < 10; li++)
    {
        var slotToSet = file_text_read_string(file)
        if (slotToSet == "spike_rusty")
            slotToSet = "spike"
        ds_list_replace(obj_level_editor.li_quicktool_slots, li, get_leveleditor_database_element(slotToSet))
        file_text_readln(file)
    }
    file_text_readln(file)
    file_text_read_string(file)
    file_text_readln(file)
    listSize = file_text_read_real(file)
    file_text_readln(file)
    for (li = 0; li < listSize; li++)
    {
        var dataBaseEntryToLoad = file_text_read_string(file)
        if (dataBaseEntryToLoad == "spike_rusty")
            dataBaseEntryToLoad = "spike"
        dataBaseStruct = get_leveleditor_database_element(dataBaseEntryToLoad)
        file_text_readln(file)
        instListSize = file_text_read_real(file)
        file_text_readln(file)
        for (ti = 0; ti < instListSize; ti++)
        {
            this_x = file_text_read_real(file)
            file_text_readln(file)
            this_y = file_text_read_real(file)
            file_text_readln(file)
            thisInst = instance_create_layer(this_x, this_y, dataBaseStruct.preview_layer, dataBaseStruct.object_index_in_editor)
            thisInst.sprite_index = dataBaseStruct.preview_sprite_index_once_placed
            thisInst.image_index = dataBaseStruct.preview_image_index
            thisInst.image_speed = 0
            thisInst.image_blend = dataBaseStruct.preview_color
            thisInst.image_angle = file_text_read_real(file)
            file_text_readln(file)
            thisInst.image_xscale = file_text_read_real(file)
            file_text_readln(file)
            thisInst.image_yscale = file_text_read_real(file)
            file_text_readln(file)
            thisInst.toolStruct = dataBaseStruct
            ds_list_add(dataBaseStruct.li_placed_instances, thisInst)
            prisize = file_text_read_real(file)
            file_text_readln(file)
            thisInst.map_properties = ds_map_create()
            for (pri = 0; pri < prisize; pri++)
            {
                thisKey = file_text_read_string(file)
                file_text_readln(file)
                thisValue = file_text_read_real(file)
                file_text_readln(file)
                ds_map_add(thisInst.map_properties, thisKey, thisValue)
                thsToolProp = ds_map_find_value(dataBaseStruct.ds_map_tool_properties, thisKey)
                leveleditor_set_hacked_if_invalid(thsToolProp)
                if (thisKey == "tex")
                {
                    temp_map_properties = ds_map_create()
                    ds_map_add(temp_map_properties, "tex", thisValue)
                    script_execute(dataBaseStruct.prepforplay, thisInst, temp_map_properties)
                    ds_map_destroy(temp_map_properties)
                }
            }
            for (i = 0; i < array_length(dataBaseStruct.tool_properties); i++)
            {
                var tool_cur_prop = dataBaseStruct.tool_properties[i]
                if (tool_cur_prop.copy_property_to_placed_obj && (!(ds_map_exists(thisInst.map_properties, tool_cur_prop.key))))
                    ds_map_add(thisInst.map_properties, tool_cur_prop.key, tool_cur_prop.def_value)
            }
            if (ds_map_size(thisInst.map_properties) == 0)
                ds_map_destroy(thisInst.map_properties)
        }
    }
    file_text_readln(file)
    file_text_read_string(file)
    file_text_readln(file)
    listSize = file_text_read_real(file)
    file_text_readln(file)
    for (li = 0; li < listSize; li++)
    {
        toolFrom = get_leveleditor_database_element(file_text_read_string(file))
        file_text_readln(file)
        objFrom = ds_list_find_value(toolFrom.li_placed_instances, file_text_read_real(file))
        file_text_readln(file)
        toolTo = get_leveleditor_database_element(file_text_read_string(file))
        file_text_readln(file)
        objTo = ds_list_find_value(toolTo.li_placed_instances, file_text_read_real(file))
        file_text_readln(file)
        lvlwire_create(objFrom, objTo)
    }
    file_text_close(file)
    if hacked_file
    {
    }
    return 1;