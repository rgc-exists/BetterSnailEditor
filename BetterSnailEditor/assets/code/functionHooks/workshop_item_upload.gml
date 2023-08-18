if global.currentlyUploadingOrUpdatingALevel
    return false;
global.currentlyUploadingOrUpdatingALevel = 1
if(global.setting_custom_thumbnails){
    if(!global.has_set_thumbnail){
        workshop_save_level_screenshot()
    }
}
steam_ugc_create_item(1115050, ugc_filetype_community)
saveloader = instance_create_depth(0, 0, -100, obj_lvledit_save_loader)
saveloader.scrypt = gml_Script_wait_for_steamworks