if (room == menu)
{
    if audio_is_playing(sound_playing)
        audio_pause_sound(sound_playing)
}
else if (!audio_is_playing(sound_playing))
    enddelay--
if (enddelay <= 0 || global.input_skipvoice_pressed)
{
    if global.input_skipvoice_pressed
    {
        global.skipped_voice_lines_in_this_playsession++
        if (global.skipped_voice_lines_in_this_playsession >= 10)
            aivl_play_queue("squid_when_skipped", 3)
    }
    global.input_skipvoice_pressed = 0
    if audio_is_playing(sound_playing)
        audio_stop_sound(sound_playing)
    if (sound_stream != -1)
    {
        if (sound_stream != basic_placeholder)
        {
        }
        sound_stream = -1
    }
    execute_script = ds_list_find_value(li_script_end, current_index)
    if (execute_script != -1)
        script_execute(execute_script)
    current_index++
    if (current_index >= ds_list_size(li_loca_keywords)){
        instance_destroy()
        return false;
    }

    switch (global.setting_voiceline_mode){
        case 0: //Default
            current_keyword = ds_list_find_value(li_loca_keywords, current_index)
            subtitle = loca_text(current_keyword)
            sound_stream = loca_sound(current_keyword)
            sound_playing = audio_play_sound(sound_stream, 0.99, false)
            execute_script = ds_list_find_value(li_script_start, current_index)
            break;
        case 1: //Yo
            current_keyword = ds_list_find_value(li_loca_keywords, current_index)
            subtitle = loca_text("squid_yo")
            sound_stream = loca_sound("squid_yo")
            sound_playing = audio_play_sound(sound_stream, 0.99, false)
            execute_script = ds_list_find_value(li_script_start, current_index)
            break;
        case 2: //KYS please
            current_keyword = ds_list_find_value(li_loca_keywords, current_index)
            subtitle = "Kill yourself please."
            sound_stream = loca_sound("levelstart_C10_shootdown_A")
            sound_playing = audio_play_sound(sound_stream, 0.99, false)
            audio_sound_set_track_position(sound_playing, 2.38)
            execute_script = ds_list_find_value(li_script_start, current_index)
            break;
        case 3: //HAHAHAHAHAHA
            current_keyword = ds_list_find_value(li_loca_keywords, current_index)
            possible_keywords = ["filler_no_talky_crazy_001_A", "basketball_death_togoal_001", "welcome_back_001_A", "story_history_04_B", "boss_final_75_hp_left_002", "boss_dance_helicopter_002", "boss_splitty_death_close_001_A", "story_evolution_05_B", "story_intro-10_B", "death_reusable_laugnther_002", "death_chapterX_001", "levelstart_D10_jumpyenemies_A", "death_staticspike_ceiling_003", "nestedsim_nested-sim_03_C"]
            possible_subtitles = ["HAHAHAHAHAHAHAHAHAHAHAHAH!!!!", "Ahaha!!", "Hahaha.", "Ahahahahahaha!", "Hahaha!!!", "Ahahahah!", "AAhahaha!", "Ahahahahaha!", "Hahahahahahaha.", "Hahahaha", "AHAHAHA!", "Hahaha...", "Haha.", "Ahahahahaha."]
            vl_start_times = [0, 2.94, 3, 0, 1.95, 1.85, 0, 0, 0, 0, 0.625, 1.425, 2.6, 0]
            cur_vlmode_keyword = irandom(array_length(possible_keywords) - 1)
            subtitle = possible_subtitles[cur_vlmode_keyword]
            sound_stream = loca_sound(possible_keywords[cur_vlmode_keyword])
            sound_playing = audio_play_sound(sound_stream, 0.99, false)
            audio_sound_set_track_position(sound_playing, vl_start_times[cur_vlmode_keyword])
            execute_script = ds_list_find_value(li_script_start, current_index)
            break;
    }

    if(global.setting_funny_squid){
        audio_sound_pitch(sound_playing, 2)
    }
    
    if (execute_script != -1)
        script_execute(execute_script)
    audio_sound_gain_voice(sound_playing, 1, 0)
    mood = ds_list_find_value(li_moods, current_index)
    if instance_exists(obj_ai_representation)
        obj_ai_representation.mood = mood
    global.last_called_voice_line = current_keyword
    enddelay = line_end_delay
    time = 0
}
else
    audio_sound_gain_voice(sound_playing, 1, 0.016666666666666666)
