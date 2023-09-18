    level_icon_property = 0
    if (time == 0)
    {
        display_text = "SAVING"
        return 0;
    }
    var levelData = ds_map_find_value(global.campaignMap, array_get(info, 0)).levels[info[1]]
    if (levelData.isModded && (!global.isEditorModded))
    {
        show_debug_message("Can't save a modded level!")
        return 1;
    }
    var has_exploration_point = 0
    var player_tool_struct = undefined
    var object_count_map = ds_map_create()
    var uses_modded_elements = 0
    fileBuffer = buffer_create(1, buffer_grow, 1)
    levelsInfo = ds_map_find_value(global.campaignMap, global.currentCampaign)
    lvlInfo = levelsInfo.levels[global.campaignLevelIndex]
    lvlName = lvlInfo.fileName
    bseSettingsSaveName = (((((get_campaigns_load_path_prefix() + "Community Levels/") + global.currentCampaign) + "/") + lvlName) + ".BSEsettings")
    bseSettingsFile = buffer_create(1, buffer_grow, 1)
    ////show_message("A")
    var levelData = ds_map_find_value(global.campaignMap, array_get(info, 0)).levels[info[1]]
    if (levelData.isModded && (!global.isEditorModded))
    {
        show_debug_message("Can't save a modded level!")
        return 1;
    }
    var has_exploration_point = 0
    var player_tool_struct = undefined
    var object_count_map = ds_map_create()
    var uses_modded_elements = 0
    li = 0
    while (li < ds_list_size(global.li_level_editor_database))
    {
        dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)
        var doContinue = true
        for(var e = 0; e < array_length(global.dont_save_these_objects); e++){
            if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") == global.dont_save_these_objects[e]){
                doContinue = false
            }
        }
        if(doContinue){
            if dataBaseStruct.modded
            {
                uses_modded_elements = 1
                break
            }
            else
            {
                li++
                continue
            }
        } else {
            li++
        }
    }
    buffer_write(fileBuffer, buffer_text, (global.game_build_version + (uses_modded_elements ? "_MODDED" : "")))
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(bseSettingsFile, buffer_text, global.BSE_version)
    buffer_write(bseSettingsFile, buffer_text, "\n")
    LVLX1 = obj_level_editor.level_bound_x1
    LVLY1 = obj_level_editor.level_bound_y1
    LVLW = (obj_level_editor.level_bound_x2 - obj_level_editor.level_bound_x1)
    LVLH = (obj_level_editor.level_bound_y2 - obj_level_editor.level_bound_y1)
    ////show_message("B")
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, "LEVEL DIMENSIONS:")
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, string(LVLW))
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, string(LVLH))
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, "TOOL DATA:")
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, string(ds_list_size(global.li_level_editor_database) - array_length(global.dont_save_these_objects)))
    buffer_write(fileBuffer, buffer_text, "\n")
    ////show_message("C")
    buffer_write(bseSettingsFile, buffer_text, "LEVEL SETTINGS")
    buffer_write(bseSettingsFile, buffer_text, "\n")
    for (li = 0; li < ds_list_size(global.li_level_editor_database); li++)
    {
        dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)
        if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") == "BSE_settings"){
            buffer_write(bseSettingsFile, buffer_text, string(array_length(variable_struct_get(dataBaseStruct, "tool_properties")) + 1))
            buffer_write(bseSettingsFile, buffer_text, "\n")
        }
    }
    for (li = 0; li < ds_list_size(global.li_level_editor_database); li++)
    {
        dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)

        var doContinue = true
        for(var e = 0; e < array_length(global.dont_save_these_objects); e++){
            if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") == global.dont_save_these_objects[e]){
                doContinue = false
            }
        }
        if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") == "Level_Icon"){
            var toolPropsLol = variable_struct_get(dataBaseStruct,"tool_properties")
            thsToolProp = toolPropsLol[1]
            level_icon_property = thsToolProp.value
            buffer_write(bseSettingsFile, buffer_text, "icon")
            buffer_write(bseSettingsFile, buffer_text, "\n")
            buffer_write(bseSettingsFile, buffer_text, string(level_icon_property))
            buffer_write(bseSettingsFile, buffer_text, "\n")

        } else if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") == "BSE_settings"){
            buffer_write(bseSettingsFile, buffer_text, array_length(variable_struct_get(dataBaseStruct, "tool_properties")))
            buffer_write(bseSettingsFile, buffer_text, "\n")
            for (ti = 0; ti < array_length(variable_struct_get(dataBaseStruct, "tool_properties")); ti++)
            {
                var toolPropsLol = variable_struct_get(dataBaseStruct,"tool_properties")
                thsToolProp = toolPropsLol[ti]
                buffer_write(bseSettingsFile, buffer_text, thsToolProp.key)
                buffer_write(bseSettingsFile, buffer_text, "\n")
                buffer_write(bseSettingsFile, buffer_text, thsToolProp.value)
                buffer_write(bseSettingsFile, buffer_text, "\n")
            }

        } else if(doContinue){
            buffer_write(fileBuffer, buffer_text, variable_struct_get(dataBaseStruct, "custom_tool_or_object_id"))
            buffer_write(fileBuffer, buffer_text, "\n")
            if (dataBaseStruct.custom_tool_or_object_id == "exploration_point")
                has_exploration_point = ds_list_size(dataBaseStruct.li_placed_instances) > 0
            else if (dataBaseStruct.custom_tool_or_object_id == "player")
                player_tool_struct = dataBaseStruct
            ds_map_set(object_count_map, dataBaseStruct.custom_tool_or_object_id, ds_list_size(dataBaseStruct.li_placed_instances))
            buffer_write(fileBuffer, buffer_text, string(variable_struct_get(dataBaseStruct, "image_angle")))
            buffer_write(fileBuffer, buffer_text, "\n")
            buffer_write(fileBuffer, buffer_text, string(variable_struct_get(dataBaseStruct, "image_xscale")))
            buffer_write(fileBuffer, buffer_text, "\n")
            buffer_write(fileBuffer, buffer_text, string(variable_struct_get(dataBaseStruct, "image_yscale")))
            buffer_write(fileBuffer, buffer_text, "\n")
            buffer_write(fileBuffer, buffer_text, string(array_length(variable_struct_get(dataBaseStruct, "tool_properties"))))
            buffer_write(fileBuffer, buffer_text, "\n")
            for (ti = 0; ti < array_length(variable_struct_get(dataBaseStruct, "tool_properties")); ti++)
            {
                var toolPropsLol = variable_struct_get(dataBaseStruct,"tool_properties")
                thsToolProp = toolPropsLol[ti]
                buffer_write(fileBuffer, buffer_text, variable_struct_get(thsToolProp, "key"))
                buffer_write(fileBuffer, buffer_text, "\n")
                buffer_write(fileBuffer, buffer_text, string(variable_struct_get(thsToolProp, "value")))
                buffer_write(fileBuffer, buffer_text, "\n")
            }
        }
    }
    ////show_message("D")
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, "QUICK SLOTS:")
    buffer_write(fileBuffer, buffer_text, "\n")
    for (li = 0; li < 10; li++)
    {
        dataBaseStruct = ds_list_find_value(obj_level_editor.li_quicktool_slots, li)

        var doContinue = true
        for(var e = 0; e < array_length(global.dont_save_these_objects); e++){
            if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") == global.dont_save_these_objects[e]){
                doContinue = false
            }
        }
        if(doContinue){
            buffer_write(fileBuffer, buffer_text, variable_struct_get(dataBaseStruct, "custom_tool_or_object_id"))
            buffer_write(fileBuffer, buffer_text, "\n")
        } else {
            buffer_write(fileBuffer, buffer_text, "wall")
            buffer_write(fileBuffer, buffer_text, "\n")
        }
    }
    ////show_message("E")
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, "PLACED OBJECTS:")
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, string(ds_list_size(global.li_level_editor_database) - array_length(global.dont_save_these_objects)))
    buffer_write(fileBuffer, buffer_text, "\n")
    for (li = 0; li < ds_list_size(global.li_level_editor_database); li++)
    {
        ////show_message("F")
        dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)

        var doContinue = true
        for(var e = 0; e < array_length(global.dont_save_these_objects); e++){
            if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") == global.dont_save_these_objects[e]){
                doContinue = false
            }
        }
        if(doContinue){
            ////show_message("G")
            if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") != "models_tool" && variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") != "inspector_tool"){
                ////show_message("H")
                buffer_write(fileBuffer, buffer_text, variable_struct_get(dataBaseStruct, "custom_tool_or_object_id"))
                buffer_write(fileBuffer, buffer_text, "\n")
                ////show_message("I")
                buffer_write(fileBuffer, buffer_text, string(ds_list_size(dataBaseStruct.li_placed_instances)))
                buffer_write(fileBuffer, buffer_text, "\n")
                for (ti = 0; ti < ds_list_size(dataBaseStruct.li_placed_instances); ti++)
                {
                    ////show_message("J")
                    thisInst = ds_list_find_value(dataBaseStruct.li_placed_instances, ti)
                    //show_message("thisInst.x - LVLX1")
                    buffer_write(fileBuffer, buffer_text, string((thisInst.x - LVLX1)))
                    buffer_write(fileBuffer, buffer_text, "\n")
                    ////show_message("K")
                    //show_message("thisInst.y - LVLY1")
                    buffer_write(fileBuffer, buffer_text, string((thisInst.y - LVLY1)))
                    buffer_write(fileBuffer, buffer_text, "\n")
                    //show_message("thisInst.image_angle")
                    buffer_write(fileBuffer, buffer_text, string(thisInst.image_angle))
                    buffer_write(fileBuffer, buffer_text, "\n")
                    //show_message("thisInst.image_xscale")
                    buffer_write(fileBuffer, buffer_text, string(thisInst.image_xscale))
                    buffer_write(fileBuffer, buffer_text, "\n")
                    //show_message("thisInst.image_yscale")
                    buffer_write(fileBuffer, buffer_text, string(thisInst.image_yscale))
                    buffer_write(fileBuffer, buffer_text, "\n")
                    ////show_message("L")
                    if (!(variable_instance_exists(thisInst, "map_properties")))
                    {
                        ////show_message("M1")
                        //show_message("Map properties (0) A")
                        buffer_write(fileBuffer, buffer_text, string(0))
                        buffer_write(fileBuffer, buffer_text, "\n")
                    }
                    else if (!(ds_exists(thisInst.map_properties, 1)))
                    {
                        ////show_message("M2")
                        //show_message("Map properties (0) B")
                        buffer_write(fileBuffer, buffer_text, string(0))
                        buffer_write(fileBuffer, buffer_text, "\n")
                    }
                    else
                    {
                        ////show_message("M3")
                        //show_message("Map properties")
                        buffer_write(fileBuffer, buffer_text, string(ds_map_size(thisInst.map_properties)))
                        buffer_write(fileBuffer, buffer_text, "\n")
                        thisKey = ds_map_find_first(thisInst.map_properties)
                        for (pri = 0; pri < ds_map_size(thisInst.map_properties); pri++)
                        {
                            ////show_message("N")
                            buffer_write(fileBuffer, buffer_text, thisKey)
                            buffer_write(fileBuffer, buffer_text, "\n")
                            //show_message("Map properties: " + thisKey)
                            buffer_write(fileBuffer, buffer_text, string(ds_map_find_value(thisInst.map_properties, thisKey)))
                            buffer_write(fileBuffer, buffer_text, "\n")
                            thisKey = ds_map_find_next(thisInst.map_properties, thisKey)
                            ////show_message("O")
                        }
                    }
                }
            }
        }
    }
    ////show_message("P")
    buffer_write(fileBuffer, buffer_text, "\n")
    buffer_write(fileBuffer, buffer_text, "WIRES:")
    buffer_write(fileBuffer, buffer_text, "\n")
    //show_message("WireSize")
    buffer_write(fileBuffer, buffer_text, string(ds_list_size(global.lvl_wires)))
    buffer_write(fileBuffer, buffer_text, "\n")
    ////show_message("Q")
    for (li = 0; li < ds_list_size(global.lvl_wires); li++)
    {
        ////show_message("R")
        thisWire = ds_list_find_value(global.lvl_wires, li)
        ////show_message("S")
        fromObj = thisWire.from_obj
        ////show_message("T")
        fromObjToolStruct = fromObj.toolStruct
        ////show_message("T.1")
        fromObj_indexInList = ds_list_find_index(variable_struct_get(fromObjToolStruct, "li_placed_instances"), fromObj)
        ////show_message("U")
        buffer_write(fileBuffer, buffer_text, variable_struct_get(fromObjToolStruct, "custom_tool_or_object_id"))
        ////show_message("V")
        buffer_write(fileBuffer, buffer_text, "\n")
        //show_message("fromObj_indexInList")
        buffer_write(fileBuffer, buffer_text, string(fromObj_indexInList))
        ////show_message("W")
        buffer_write(fileBuffer, buffer_text, "\n")
        toObj = thisWire.to_obj
        ////show_message("W.1")
        toObjToolStruct = toObj.toolStruct
        ////show_message("X")
        toObj_indexInList = ds_list_find_index(variable_struct_get(toObjToolStruct, "li_placed_instances"), toObj)
        ////show_message("Y")
        buffer_write(fileBuffer, buffer_text, variable_struct_get(toObjToolStruct, "custom_tool_or_object_id"))
        buffer_write(fileBuffer, buffer_text, "\n")
        ////show_message("Z")
        //show_message("toObj_indexInList")
        buffer_write(fileBuffer, buffer_text, string(toObj_indexInList))
        buffer_write(fileBuffer, buffer_text, "\n")
        ////show_message("1")
    }
    ////show_message("2")
    buffer_save(fileBuffer, saveName)
    buffer_delete(fileBuffer)
    buffer_save(bseSettingsFile, bseSettingsSaveName)
    buffer_delete(bseSettingsFile)    var hasexplo = variable_struct_get(levelData, "hasExplorationPoint")
    var levelico = variable_struct_get(levelData, "levelIcon")
    var ismodded = variable_struct_get(levelData, "isModded")
    var is_different = 0
    if is_undefined(hasexplo)
        hasexplo = ""
    if is_undefined(levelico)
        levelico = ""
    if is_undefined(ismodded)
        ismodded = ""
    levelData.hasExplorationPoint = has_exploration_point
    if(level_icon_property == 0){
        levelData.levelIcon = leveleditor_determine_level_icon(object_count_map, player_tool_struct)
    } else {
        var iconList = [
            "normal",
            "normal",
            "puzzle", 
            "spike", 
            "fish", 
            "ball", 
            "bomb", 
            "conveyor", 
            "tower_defense", 
            "evil_snail", 
            "laser", 
            "bubble", 
            "protector", 
            "baby_squid", 
            "thin_spike", 
            "shooter", 
            "winter",
            "stars"
        ]
        levelData.levelIcon = iconList[level_icon_property]
    }
    levelData.isModded = uses_modded_elements
    is_different = (hasexplo != has_exploration_point || levelico != levelData.levelIcon || ismodded != uses_modded_elements)
    if is_different
        save_leveleditor_campaign(info[0])
    return 1;