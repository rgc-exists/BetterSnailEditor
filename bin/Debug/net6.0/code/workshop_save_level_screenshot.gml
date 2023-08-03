#orig#()
if(global.setting_custom_thumbnails){
    var answer = show_question("You have turned the custom thumbnails setting on.\n\nWould you like to choose a custom thumbnail for this level?")
    if(answer){
        if(global.new_thumnbnail_image_path == ""){
            global.new_thumnbnail_image_path = get_open_filename_ext(" Image File|*.png;*.jpeg;*.jpg", "", program_directory, "Choose a thumbnail to load.")
        }
        if(global.new_thumnbnail_image_path != ""){
            if(file_exists(global.new_thumnbnail_image_path)){
                var thumb_file = file_bin_open(global.new_thumnbnail_image_path, 0)
                if(file_bin_size(thumb_file) < 1000000){
                    file_copy(global.new_thumnbnail_image_path, (("Community Levels/" + global.currentCampaign) + "/Thumbnail.png"))
                } else {
                    show_message("Sorry, the file size of the image must be less than one megabyte.")
                }
                file_bin_close(thumb_file)
            }
        }
    }
}