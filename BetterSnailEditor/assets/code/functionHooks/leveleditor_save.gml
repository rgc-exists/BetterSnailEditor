if campaign_is_readonly(info[0])
{
    show_debug_message("Cant save a readonly campaign's level!")
    return 1;
}
if(global.setting_betterSaving){
    return gml_Script_scr_save_lvl_with_buffer()
} else {
    level_icon_property = 0
    if (time == 0)
    {
        display_text = "SAVING"
        file = file_text_open_write(saveName)
        levelsInfo = ds_map_find_value(global.campaignMap, global.currentCampaign)
        lvlInfo = levelsInfo.levels[global.campaignLevelIndex]
        lvlName = lvlInfo.fileName
        bseSettingsSaveName = (((((get_campaigns_load_path_prefix() + "Community Levels/") + global.currentCampaign) + "/") + lvlName) + ".BSEsettings")
        bseSettingsFile = file_text_open_write(bseSettingsSaveName)
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
            if(dataBaseStruct.custom_tool_or_object_id == global.dont_save_these_objects[e]){
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
        } else{
            li++
        }
    }
    file_text_write_string(file, (global.game_build_version + (uses_modded_elements ? "_MODDED" : "")))
    file_text_writeln(file)
    file_text_write_string(bseSettingsFile, global.BSE_version)
    file_text_writeln(bseSettingsFile)
    LVLX1 = obj_level_editor.level_bound_x1
    LVLY1 = obj_level_editor.level_bound_y1
    LVLW = (obj_level_editor.level_bound_x2 - obj_level_editor.level_bound_x1)
    LVLH = (obj_level_editor.level_bound_y2 - obj_level_editor.level_bound_y1)
    ////show_message("B")
    file_text_writeln(file)
    file_text_write_string(file, "LEVEL DIMENSIONS:")
    file_text_writeln(file)
    file_text_write_real(file, LVLW)
    file_text_writeln(file)
    file_text_write_real(file, LVLH)
    file_text_writeln(file)
    file_text_writeln(file)
    file_text_write_string(file, "TOOL DATA:")
    file_text_writeln(file)
    file_text_write_real(file, ds_list_size(global.li_level_editor_database) - array_length(global.dont_save_these_objects))
    file_text_writeln(file)
    file_text_write_string(bseSettingsFile, "LEVEL SETTINGS")
    file_text_write_string(bseSettingsFile, "\n")
    for (li = 0; li < ds_list_size(global.li_level_editor_database); li++)
    {
        dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)
        if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") == "BSE_settings"){
            file_text_write_real(bseSettingsFile, array_length(variable_struct_get(dataBaseStruct, "tool_properties")) + 1)
            file_text_write_string(bseSettingsFile, "\n")
        }
    }
    ////show_message("C")
    for (li = 0; li < ds_list_size(global.li_level_editor_database); li++)
    {
        dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)
        var doContinue = true
        for(var e = 0; e < array_length(global.dont_save_these_objects); e++){
            if(dataBaseStruct.custom_tool_or_object_id == global.dont_save_these_objects[e]){
                doContinue = false
            }
        }
        
        if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") == "Level_Icon"){
            var toolPropsLol = variable_struct_get(dataBaseStruct,"tool_properties")
            thsToolProp = toolPropsLol[1]
            level_icon_property = thsToolProp.value
            file_text_write_string(bseSettingsFile, "icon")
            file_text_write_string(bseSettingsFile, "\n")
            file_text_write_real(bseSettingsFile, level_icon_property)
            file_text_write_string(bseSettingsFile, "\n")

        } else if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") == "BSE_settings"){
            for (ti = 0; ti < array_length(variable_struct_get(dataBaseStruct, "tool_properties")); ti++)
            {
                var toolPropsLol = variable_struct_get(dataBaseStruct,"tool_properties")
                thsToolProp = toolPropsLol[ti]
                file_text_write_string(bseSettingsFile, thsToolProp.key)
                file_text_write_string(bseSettingsFile, "\n")
                file_text_write_real(bseSettingsFile, thsToolProp.value)
                file_text_write_string(bseSettingsFile, "\n")
            }

        } else if(doContinue){
            file_text_write_string(file, variable_struct_get(dataBaseStruct, "custom_tool_or_object_id"))
            file_text_writeln(file)
            if (dataBaseStruct.custom_tool_or_object_id == "exploration_point")
                has_exploration_point = ds_list_size(dataBaseStruct.li_placed_instances) > 0
            else if (dataBaseStruct.custom_tool_or_object_id == "player")
                player_tool_struct = dataBaseStruct
            ds_map_set(object_count_map, dataBaseStruct.custom_tool_or_object_id, ds_list_size(dataBaseStruct.li_placed_instances))
            file_text_write_real(file, variable_struct_get(dataBaseStruct, "image_angle"))
            file_text_writeln(file)
            file_text_write_real(file, variable_struct_get(dataBaseStruct, "image_xscale"))
            file_text_writeln(file)
            file_text_write_real(file, variable_struct_get(dataBaseStruct, "image_yscale"))
            file_text_writeln(file)
            file_text_write_real(file, array_length(variable_struct_get(dataBaseStruct, "tool_properties")))
            file_text_writeln(file)
            for (ti = 0; ti < array_length(variable_struct_get(dataBaseStruct, "tool_properties")); ti++)
            {
                var toolPropsLol = variable_struct_get(dataBaseStruct,"tool_properties")
                thsToolProp = toolPropsLol[ti]
                file_text_write_string(file, variable_struct_get(thsToolProp, "key"))
                file_text_writeln(file)
                file_text_write_real(file, variable_struct_get(thsToolProp, "value"))
                file_text_writeln(file)
            }
        }
    }
    ////show_message("D")
    file_text_writeln(file)
    file_text_write_string(file, "QUICK SLOTS:")
    file_text_writeln(file)
    for (li = 0; li < 10; li++)
    {
        dataBaseStruct = ds_list_find_value(obj_level_editor.li_quicktool_slots, li)
        
        var doContinue = true
        for(var e = 0; e < array_length(global.dont_save_these_objects); e++){
            if(dataBaseStruct.custom_tool_or_object_id == global.dont_save_these_objects[e]){
                doContinue = false
            }
        }
        if(doContinue){
            file_text_write_string(file, variable_struct_get(dataBaseStruct, "custom_tool_or_object_id"))
            file_text_writeln(file)
        } else {
            file_text_write_string(file, "wall")
            file_text_writeln(file)
        }
    
    }
    ////show_message("E")
    file_text_writeln(file)
    file_text_write_string(file, "PLACED OBJECTS:")
    file_text_writeln(file)
    file_text_write_real(file, ds_list_size(global.li_level_editor_database) - array_length(global.dont_save_these_objects))
    file_text_writeln(file)
    for (li = 0; li < ds_list_size(global.li_level_editor_database); li++)
    {
        ////show_message("F")
        dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)
        var doContinue = true
        for(var e = 0; e < array_length(global.dont_save_these_objects); e++){
            if(dataBaseStruct.custom_tool_or_object_id == global.dont_save_these_objects[e]){
                doContinue = false
            }
        }
        if(doContinue){
            ////show_message("G")
            if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") != "models_tool" && variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") != "inspector_tool"){
                ////show_message("H")
                file_text_write_string(file, dataBaseStruct.custom_tool_or_object_id)
                file_text_writeln(file)
                ////show_message("I")
                file_text_write_real(file, ds_list_size(dataBaseStruct.li_placed_instances))
                file_text_writeln(file)
                for (ti = 0; ti < ds_list_size(dataBaseStruct.li_placed_instances); ti++)
                {
                    ////show_message("J")
                    thisInst = ds_list_find_value(dataBaseStruct.li_placed_instances, ti)
                    //show_message("thisInst.x - LVLX1")
                    file_text_write_real(file, (thisInst.x - LVLX1))
                    file_text_writeln(file)
                    ////show_message("K")
                    //show_message("thisInst.y - LVLY1")
                    file_text_write_real(file, (thisInst.y - LVLY1))
                    file_text_writeln(file)
                    //show_message("thisInst.image_angle")
                    file_text_write_real(file, thisInst.image_angle)
                    file_text_writeln(file)
                    //show_message("thisInst.image_xscale")
                    file_text_write_real(file, thisInst.image_xscale)
                    file_text_writeln(file)
                    //show_message("thisInst.image_yscale")
                    file_text_write_real(file, thisInst.image_yscale)
                    file_text_writeln(file)
                    ////show_message("L")
                    if (!(variable_instance_exists(thisInst, "map_properties")))
                    {
                        ////show_message("M1")
                        //show_message("Map properties (0) A")
                        file_text_write_real(file, 0)
                        file_text_writeln(file)
                    }
                    else if (!(ds_exists(thisInst.map_properties, 1)))
                    {
                        ////show_message("M2")
                        //show_message("Map properties (0) B")
                        file_text_write_real(file, 0)
                        file_text_writeln(file)
                    }
                    else
                    {
                        ////show_message("M3")
                        //show_message("Map properties")
                        file_text_write_real(file, ds_map_size(thisInst.map_properties))
                        file_text_writeln(file)
                        thisKey = ds_map_find_first(thisInst.map_properties)
                        for (pri = 0; pri < ds_map_size(thisInst.map_properties); pri++)
                        {
                            ////show_message("N")
                            file_text_write_string(file, thisKey)
                            file_text_writeln(file)
                            //show_message("Map properties: " + thisKey)
                            file_text_write_real(file, ds_map_find_value(thisInst.map_properties, thisKey))
                            file_text_writeln(file)
                            thisKey = ds_map_find_next(thisInst.map_properties, thisKey)
                            ////show_message("O")
                        }
                    }
                }
            }
        }
    }
    ////show_message("P")
    file_text_writeln(file)
    file_text_write_string(file, "WIRES:")
    file_text_writeln(file)
    //show_message("WireSize")
    file_text_write_real(file, ds_list_size(global.lvl_wires))
    file_text_writeln(file)
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
        file_text_write_string(file, variable_struct_get(fromObjToolStruct, "custom_tool_or_object_id"))
        ////show_message("V")
        file_text_writeln(file)
        //show_message("fromObj_indexInList")
        file_text_write_real(file, fromObj_indexInList)
        ////show_message("W")
        file_text_writeln(file)
        toObj = thisWire.to_obj
        ////show_message("W.1")
        toObjToolStruct = toObj.toolStruct
        ////show_message("X")
        toObj_indexInList = ds_list_find_index(variable_struct_get(toObjToolStruct, "li_placed_instances"), toObj)
        ////show_message("Y")
        file_text_write_string(file, variable_struct_get(toObjToolStruct, "custom_tool_or_object_id"))
        file_text_writeln(file)
        ////show_message("Z")
        //show_message("toObj_indexInList")
        file_text_write_real(file, toObj_indexInList)
        file_text_writeln(file)
        ////show_message("1")
    }
    ////show_message("2")
    file_text_close(file)
    file_text_close(bseSettingsFile)
    var hasexplo = variable_struct_get(levelData, "hasExplorationPoint")
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
}
