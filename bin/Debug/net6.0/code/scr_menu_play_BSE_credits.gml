if(global.exits_in_this_level_are_available){
    with (obj_music_parent)
        instance_destroy()
    with (obj_persistent)
    {
        sound = audio_play_sound(sou_game_start, 1, false)
        audio_sound_gain_fx(sound, 1, 0)
        scr_save_settings()
        inMainMenu = 0
        go_to_BSE_credits_next = 1
        room_goto(roomBeforeMenu)
        room_persistent = false
        roomBeforeMenu = -1
        audio_resume_all()
    }
}