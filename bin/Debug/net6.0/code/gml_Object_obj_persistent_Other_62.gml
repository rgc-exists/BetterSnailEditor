if ds_map_find_value(async_load, "id") == version_file
{
    var status = ds_map_find_value(async_load, "status");
    //show_message(ds_map_find_value(async_load, "http status"))
    if status == 0
    {
        var path = ds_map_find_value(async_load, "result");
        version_file_downloaded = file_text_open_read(path)
        var read_version = string_replace(file_text_read_string(version_file_downloaded), "\n", "")
        if(read_version != global.BSE_version && read_version != "" && string_pos("<html>", read_version) == 0){
            global.update_available = true
            if(room == disclaimer_photoepilepsy)
                room_restart()
            else
                room_goto(disclaimer_photoepilepsy)
        }
        file_text_close(version_file_downloaded)
        
        if(directory_exists(working_directory + "BetterSnailEditor_Temp\\")){
            if(file_exists(path)){
                file_delete(path)
            }
            directory_destroy(working_directory + "BetterSnailEditor_Temp\\")
        }
    }
}