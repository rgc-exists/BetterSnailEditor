
if(global.setting_autosave_level){
    answer = show_question("Do you want to save your level before exiting?")

    if(answer){
        var curDat = ds_map_find_value(global.campaignMap, global.currentCampaign)
        var curLevelName = variable_struct_get(curDat.levels[global.campaignLevelIndex], "fileName")
        levelPath = leveleditor_get_filepath(global.currentCampaign, curLevelName)
        scrypt = gml_Script_leveleditor_save
        saveName = levelPath
        enterPlayModeAfter = 0
        levelIndexToLoadAfter = 0
        AfterPost = 0
        uploadLevelTosteamworksAfter = (argument5 ? 0 : 0)
        loadlevelafter = 0
        file = file_text_open_write(saveName)
        time = 1
        leveleditor_save()
        show_message("Level successfully saved!")
    }
}
