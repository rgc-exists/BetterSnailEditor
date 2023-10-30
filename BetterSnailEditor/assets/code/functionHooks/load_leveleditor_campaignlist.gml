if (argument0 == undefined)
    argument0 = 0
campaignListDirectory = (get_campaigns_load_path_prefix() + "Community Levels/_CampaignList.nlkvp")
if file_exists(campaignListDirectory)
{
    var tempList = global.campaignList
    tempList = nlkvp_read_file(campaignListDirectory)
    for (filename = file_find_first((get_campaigns_load_path_prefix() + "Community Levels/*"), 16); filename != ""; filename = file_find_next())
    {
        if file_exists((((get_campaigns_load_path_prefix() + "Community Levels/") + filename) + "/_CampaignInfo.nlkvp"))
        {
            var current_check_filename = filename
            var tempFile = file_text_open_read((((get_campaigns_load_path_prefix() + "Community Levels/") + filename) + "/_CampaignInfo.nlkvp"))
            var lineCount = 0
            while(lineCount < 3 && !file_text_eof(tempFile)){
                file_text_readln(tempFile)
                lineCount++;
            }
            file_text_close(tempFile)
            if(lineCount < 3){
                var answer = show_question("BETTER SNAIL EDITOR ERROR:\nLooks like on of your campaigns got corrupted and the _CampaignInfo.nlkvp file is empty.\n\nWe don't know why this glitch happens and this is a temporary fix.\n\nWould you like to delete this folder?\nIf you press no, the game will likely crash. Only press no if you would like to see if you can salvage any of the files. Note that they might be empty as well.\n\nFolder path: " + ((get_campaigns_load_path_prefix() + "Community Levels/") + filename))
                if(answer){
                    directory_destroy((get_campaigns_load_path_prefix() + "Community Levels/") + filename)
                    show_message("Successfully deleted corrupted folder.")
                }
            }
        }
    }
}

return #orig#(argument0)