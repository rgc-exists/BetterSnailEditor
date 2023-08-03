#orig#()
if(global.setting_fully_reset_new_levels){
    ds_list_replace(obj_level_editor.li_quicktool_slots, 0, get_leveleditor_database_element("player"))
    ds_list_replace(obj_level_editor.li_quicktool_slots, 1, get_leveleditor_database_element("wall"))
    ds_list_replace(obj_level_editor.li_quicktool_slots, 2, get_leveleditor_database_element("wall_gl"))
    ds_list_replace(obj_level_editor.li_quicktool_slots, 3, get_leveleditor_database_element("spike"))
    ds_list_replace(obj_level_editor.li_quicktool_slots, 4, get_leveleditor_database_element("spike_thn"))
    ds_list_replace(obj_level_editor.li_quicktool_slots, 5, get_leveleditor_database_element("door"))
    ds_list_replace(obj_level_editor.li_quicktool_slots, 6, get_leveleditor_database_element("antenna"))
    ds_list_replace(obj_level_editor.li_quicktool_slots, 7, get_leveleditor_database_element("trigg_ai"))
    ds_list_replace(obj_level_editor.li_quicktool_slots, 8, get_leveleditor_database_element("property_picker_tool"))
    ds_list_replace(obj_level_editor.li_quicktool_slots, 9, get_leveleditor_database_element("delete_tool"))
    obj_level_editor.level_bound_x1 = 0
    obj_level_editor.level_bound_y1 = 0
    obj_level_editor.level_bound_x2 = 1920
    obj_level_editor.level_bound_y2 = 1080
}