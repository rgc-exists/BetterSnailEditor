if(global.inspector_active){
    global.editor_input_disabled = false
}
global.inspector_active = false

var original_returned = #orig#()
if(original_returned){
    camp_data = ds_map_find_value(global.campaignMap, global.currentCampaign)
    var levelsInfo = ds_map_find_value(global.campaignMap, global.currentCampaign)
    var lvlInfo = levelsInfo.levels[global.campaignLevelIndex]
    var lvlName = lvlInfo.fileName
    var bseSettingsSaveName = (((((get_campaigns_load_path_prefix() + "Community Levels/") + global.currentCampaign) + "/") + lvlName) + ".BSEsettings")
    if(file_exists(bseSettingsSaveName)){
        var bseSettingsFile = file_text_open_read(bseSettingsSaveName)
        version = file_text_read_string(bseSettingsFile)
        file_text_readln(bseSettingsFile)
        file_text_readln(bseSettingsFile)
        arraySize = file_text_read_real(bseSettingsFile)
        file_text_readln(bseSettingsFile)
        dataBaseStruct = get_leveleditor_database_element("BSE_settings")
        for (ti = 0; ti < arraySize; ti++)
        {
            thsToolKey = file_text_read_string(bseSettingsFile)
            file_text_readln(bseSettingsFile)
            thsToolValue = file_text_read_real(bseSettingsFile)
            file_text_readln(bseSettingsFile)
            if(thsToolKey == "icon"){
                lvlIcon_dataBaseStruct = get_leveleditor_database_element("Level_Icon")
                thsToolProp = ds_map_find_value(lvlIcon_dataBaseStruct.ds_map_tool_properties, thsToolKey)
                if (!is_undefined(thsToolProp))
                {
                    thsToolProp.value = thsToolValue
                }
            } else {
                thsToolProp = ds_map_find_value(dataBaseStruct.ds_map_tool_properties, thsToolKey)
                if (!is_undefined(thsToolProp))
                {
                    thsToolProp.value = thsToolValue
                }
            }
        }
        file_text_close(bseSettingsFile)
    }
    return true
} else {
    return false
}




