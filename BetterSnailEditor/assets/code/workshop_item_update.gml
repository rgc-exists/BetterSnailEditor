var update_handle = steam_ugc_start_item_update(1115050, argument0)
var curCampaignMap = ds_map_find_value(global.campaignMap, global.currentCampaign)
curCampaignMap.uploadId = argument0
var title = curCampaignMap.campName
var description = curCampaignMap.description
var visibility = 0
var tags = global.current_upload_tags
curCampaignMap.tags = tags
save_leveleditor_campaign(global.currentCampaign)
var content_path = ("Community Levels/" + global.currentCampaign)
if(global.setting_custom_thumbnails){
    if(!global.has_set_thumbnail){
        workshop_save_level_screenshot()
    }
}
var preview_image = (("Community Levels/" + global.currentCampaign) + "/Thumbnail.png")
var change_note = ""
steam_ugc_set_item_title(update_handle, title)
steam_ugc_set_item_visibility(update_handle, visibility)
steam_ugc_set_item_tags(update_handle, tags)
steam_ugc_set_item_content(update_handle, content_path)
steam_ugc_set_item_preview(update_handle, preview_image)
steam_ugc_submit_item_update(update_handle, change_note)