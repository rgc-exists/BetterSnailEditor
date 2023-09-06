
if(global.setting_autosave_level){
    if(global.setting_betterSaving){
        show_message("Autosave does not work when optimized saving is on, for now at least.")
    } else {
        answer = show_question("Do you want to save your level before exiting?")

        if(answer){
            var curDat = ds_map_find_value(global.campaignMap, global.currentCampaign)
            var curLevelName = variable_struct_get(curDat.levels[global.campaignLevelIndex], "fileName")
            levelPath = leveleditor_get_filepath(global.currentCampaign, curLevelName)
            scrypt = gml_Script_leveleditor_save
            lvlnametemp = curLevelName
            saveName = levelPath
            enterPlayModeAfter = 0
            levelIndexToLoadAfter = 0
            AfterPost = 0
            uploadLevelTosteamworksAfter = (argument5 ? 0 : 0)
            loadlevelafter = 0
            file = file_text_open_write(saveName)
            levelsInfo = ds_map_find_value(global.campaignMap, global.currentCampaign)
            lvlInfo = levelsInfo.levels[global.campaignLevelIndex]
            lvlName = lvlInfo.fileName
            bseSettingsSaveName = (((((get_campaigns_load_path_prefix() + "Community Levels/") + global.currentCampaign) + "/") + lvlName) + ".BSEsettings")
            bseSettingsFile = file_text_open_write(bseSettingsSaveName)
            time = 1
            info = [global.currentCampaign, array_find_index(ds_map_find_value(global.campaignMap, global.currentCampaign).levels, gml_Script_anon_call_leveleditor_save_gml_GlobalScript_leveleditor_save_load_13140_call_leveleditor_save_gml_GlobalScript_leveleditor_save_load)]
            leveleditor_save()
            show_message("Level successfully saved!")
        }
    }
}
