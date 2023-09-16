global.new_thumnbnail_image_path = get_open_filename_ext(" Image File|*.png;*.jpeg;*.jpg", "", program_directory, "Choose a thumbnail to load.")

if(global.new_thumnbnail_image_path != ""){
    if(file_exists(global.new_thumnbnail_image_path)){
        var thumb_file = file_bin_open(global.new_thumnbnail_image_path, 0)
        if(file_bin_size(thumb_file) < 1000000){
            file_copy(global.new_thumnbnail_image_path, (("Community Levels/" + global.currentCampaign) + "/CustomThumbnail.png"))
            file_copy(global.new_thumnbnail_image_path, (("Community Levels/" + global.currentCampaign) + "/Thumbnail.png"))
        } else {
            show_message("Sorry, the file size of the image must be less than one megabyte.")
        }
        file_bin_close(thumb_file)
        global.current_thumbnail = sprite_add("Community Levels/" + global.currentCampaign + "/CustomThumbnail.png", 0, false, false, 0, 0)
        global.has_set_thumbnail = true
    }
}