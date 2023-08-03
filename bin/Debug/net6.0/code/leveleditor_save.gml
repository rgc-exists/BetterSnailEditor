if (time == 0)
{
    display_text = "SAVING"
    file = file_text_open_write(saveName)
    return 0;
}
//show_message("A")
file_text_write_string(file, "Version 1.9-BETA_16")
file_text_writeln(file)
LVLX1 = obj_level_editor.level_bound_x1
LVLY1 = obj_level_editor.level_bound_y1
LVLW = (obj_level_editor.level_bound_x2 - obj_level_editor.level_bound_x1)
LVLH = (obj_level_editor.level_bound_y2 - obj_level_editor.level_bound_y1)
//show_message("B")
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
file_text_write_real(file, ds_list_size(global.li_level_editor_database) - 2)
file_text_writeln(file)
//show_message("C")
for (li = 0; li < ds_list_size(global.li_level_editor_database); li++)
{
    dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)
    if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") != "models_tool" && variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") != "inspector_tool"){
        file_text_write_string(file, variable_struct_get(dataBaseStruct, "custom_tool_or_object_id"))
        file_text_writeln(file)
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
//show_message("D")
file_text_writeln(file)
file_text_write_string(file, "QUICK SLOTS:")
file_text_writeln(file)
for (li = 0; li < 10; li++)
{
    dataBaseStruct = ds_list_find_value(obj_level_editor.li_quicktool_slots, li)
    if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") != "models_tool" && variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") != "inspector_tool"){
        file_text_write_string(file, variable_struct_get(dataBaseStruct, "custom_tool_or_object_id"))
        file_text_writeln(file)
    } else {
        file_text_write_string(file, "wall")
        file_text_writeln(file)
    }
}
//show_message("E")
file_text_writeln(file)
file_text_write_string(file, "PLACED OBJECTS:")
file_text_writeln(file)
file_text_write_real(file, ds_list_size(global.li_level_editor_database) - 2)
file_text_writeln(file)
for (li = 0; li < ds_list_size(global.li_level_editor_database); li++)
{
    //show_message("F")
    dataBaseStruct = ds_list_find_value(global.li_level_editor_database, li)
    //show_message("G")
    if(variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") != "models_tool" && variable_struct_get(dataBaseStruct, "custom_tool_or_object_id") != "inspector_tool"){
        //show_message("H")
        file_text_write_string(file, dataBaseStruct.custom_tool_or_object_id)
        file_text_writeln(file)
        //show_message("I")
        file_text_write_real(file, ds_list_size(dataBaseStruct.li_placed_instances))
        file_text_writeln(file)
        for (ti = 0; ti < ds_list_size(dataBaseStruct.li_placed_instances); ti++)
        {
            //show_message("J")
            thisInst = ds_list_find_value(dataBaseStruct.li_placed_instances, ti)
            file_text_write_real(file, (thisInst.x - LVLX1))
            file_text_writeln(file)
            //show_message("K")
            file_text_write_real(file, (thisInst.y - LVLY1))
            file_text_writeln(file)
            file_text_write_real(file, thisInst.image_angle)
            file_text_writeln(file)
            file_text_write_real(file, thisInst.image_xscale)
            file_text_writeln(file)
            file_text_write_real(file, thisInst.image_yscale)
            file_text_writeln(file)
            //show_message("L")
            if (!(variable_instance_exists(thisInst, "map_properties")))
            {
                //show_message("M1")
                file_text_write_real(file, 0)
                file_text_writeln(file)
            }
            else if (!(ds_exists(thisInst.map_properties, 1)))
            {
                //show_message("M2")
                file_text_write_real(file, 0)
                file_text_writeln(file)
            }
            else
            {
                //show_message("M3")
                file_text_write_real(file, ds_map_size(thisInst.map_properties))
                file_text_writeln(file)
                thisKey = ds_map_find_first(thisInst.map_properties)
                for (pri = 0; pri < ds_map_size(thisInst.map_properties); pri++)
                {
                    //show_message("N")
                    file_text_write_string(file, thisKey)
                    file_text_writeln(file)
                    file_text_write_real(file, ds_map_find_value(thisInst.map_properties, thisKey))
                    file_text_writeln(file)
                    thisKey = ds_map_find_next(thisInst.map_properties, thisKey)
                    //show_message("O")
                }
            }
        }
    }
}
//show_message("P")
file_text_writeln(file)
file_text_write_string(file, "WIRES:")
file_text_writeln(file)
file_text_write_real(file, ds_list_size(global.lvl_wires))
file_text_writeln(file)
//show_message("Q")
for (li = 0; li < ds_list_size(global.lvl_wires); li++)
{
    //show_message("R")
    thisWire = ds_list_find_value(global.lvl_wires, li)
    //show_message("S")
    fromObj = thisWire.from_obj
    //show_message("T")
    fromObjToolStruct = fromObj.toolStruct
    //show_message("T.1")
    fromObj_indexInList = ds_list_find_index(variable_struct_get(fromObjToolStruct, "li_placed_instances"), fromObj)
    //show_message("U")
    file_text_write_string(file, variable_struct_get(fromObjToolStruct, "custom_tool_or_object_id"))
    //show_message("V")
    file_text_writeln(file)
    file_text_write_real(file, fromObj_indexInList)
    //show_message("W")
    file_text_writeln(file)
    toObj = thisWire.to_obj
    //show_message("W.1")
    toObjToolStruct = toObj.toolStruct
    //show_message("X")
    toObj_indexInList = ds_list_find_index(variable_struct_get(toObjToolStruct, "li_placed_instances"), toObj)
    //show_message("Y")
    file_text_write_string(file, variable_struct_get(toObjToolStruct, "custom_tool_or_object_id"))
    file_text_writeln(file)
    //show_message("Z")
    file_text_write_real(file, toObj_indexInList)
    file_text_writeln(file)
    //show_message("1")
}
//show_message("2")
file_text_close(file)
return 1;

