alarm[1] = 300
timings_size = ds_list_size(obj_persistent.list_last_aivl_timings)
if(is_undefined(ds_list_find_value(obj_persistent.list_last_aivl_timings, (timings_size - 1)))){
    show_message(timings_size - 1)
} else {
    time_since_last_voice_line = (obj_persistent.time - ds_list_find_value(obj_persistent.list_last_aivl_timings, (timings_size - 1)))
    if (time_since_last_voice_line >= 7200)
    {
        if (ds_list_find_value(obj_persistent.list_last_aivl_timings, (timings_size - 1)) > 0)
        {
            if (room != T_01_first_contact)
            {
                if (room != AngerManagementRoom)
                {
                    if (scr_level_dat_get_type(room) != 1)
                    {
                        if (scr_level_dat_get_chapter(room) == 5)
                            aivl_play_random("filler_no_talky_crazy", 3, 2)
                        if (!(aivl_play("filler_intro_after_silence", 3)))
                        {
                            if (reading_file == -1)
                                aivl_play_random("filler_when_no_talky", 3, 6)
                        }
                    }
                }
            }
        }
    }
    if (random(1) < 0.001)
        aivl_play_ext("squid_yo", -1, -1, 3, 0, 1)
}