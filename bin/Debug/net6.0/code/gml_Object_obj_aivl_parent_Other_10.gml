global.destroy_this_obj = 0
current_keyword = ds_list_find_value(li_loca_keywords, 0)
if (ds_list_size(li_loca_keywords) <= 0)
{
    global.destroy_this_obj = 1
    return;
}
aivl_queue_into = self
for (i = 0; i < instance_number(obj_aivl_parent); i++)
{
    id_aivl = instance_find(obj_aivl_parent, i)
    if (id_aivl != id)
    {
        if (interrupt == 0)
        {
            global.destroy_this_obj = 1
            return;
        }
        else if (interrupt == 1)
        {
            if (id_aivl.importance <= importance)
                instance_destroy(id_aivl)
            else
            {
                global.destroy_this_obj = 1
                return;
            }
        }
        else if (interrupt == 2)
        {
            if (id_aivl.sound_playing != -1)
                aivl_queue_into = id_aivl
        }
    }
}
ds_list_add(obj_persistent.list_last_aivl_timings, obj_persistent.time)
if (interrupt == 2 && aivl_queue_into != self)
{
    for (i = 0; i < ds_list_size(li_loca_keywords); i++)
    {
        ds_list_add(aivl_queue_into.li_loca_keywords, ds_list_find_value(li_loca_keywords, i))
        ds_list_add(aivl_queue_into.li_moods, ds_list_find_value(li_moods, i))
        ds_list_add(aivl_queue_into.li_script_start, ds_list_find_value(li_script_start, i))
        ds_list_add(aivl_queue_into.li_script_end, ds_list_find_value(li_script_end, i))
    }
    global.has_successfully_been_queued = 1
    global.destroy_this_obj = 1
    return;
}
else {
    switch (global.setting_voiceline_mode){
        case 0: //Default
            subtitle = loca_text(current_keyword)
            sound_stream = loca_sound(current_keyword)
            sound_playing = audio_play_sound(sound_stream, 0.99, false)
            execute_script = ds_list_find_value(li_script_start, current_index)
            break;
        case 1: //Yo
            subtitle = loca_text("squid_yo")
            sound_stream = loca_sound("squid_yo")
            sound_playing = audio_play_sound(sound_stream, 0.99, false)
            execute_script = ds_list_find_value(li_script_start, current_index)
            break;
        case 2: //KYS please
            subtitle = "Kill yourself please."
            sound_stream = loca_sound("levelstart_C10_shootdown_A")
            sound_playing = audio_play_sound(sound_stream, 0.99, false)
            audio_sound_set_track_position(sound_playing, 2.38)
            execute_script = ds_list_find_value(li_script_start, current_index)
            break;
        case 3: //HAHAHAHAHAHA
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
    obj_ai_representation.mood = mood
    global.last_called_voice_line = current_keyword
    enddelay = line_end_delay
}
