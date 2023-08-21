if(global.setting_custom_editor_playlist && array_length(global.editor_custom_playlist) > 0){
    if enabled
    {
        current_volume = min((current_volume + fade_in_speed), 1)
    }
    else
    {
        current_volume -= fade_out_speed
        if (current_volume <= 0)
        {
            audio_stop_sound(playing_music)
            instance_destroy()
        }
    }
    if (!audio_is_playing(playing_music)){
        if (current_volume > 0){
            if(variable_instance_exists(id, "musicToPlay")){
                prevMusicToPlay = musicToPlay
            } else {
                prevMusicToPlay = -1
            }
            musicToPlay = global.editor_custom_playlist[irandom(array_length(global.editor_custom_playlist) - 1)]
            while(musicToPlay == prevMusicToPlay){
                musicToPlay = global.editor_custom_playlist[irandom(array_length(global.editor_custom_playlist) - 1)]
            }
            playing_music = audio_play_sound(musicToPlay, 1, false)
        }
    }

    if (play_music != -1)
    {
        audio_sound_gain_music(playing_music, ((current_volume * current_volume) * play_music_volume_multi), 0.016666666666666666)
        audio_sound_pitch(playing_music, (global.music_pitch * music_pitch))
    }
    if (play_ambience != -1)
        audio_sound_gain_fx(playing_ambience, ((current_volume * current_volume) * play_ambience_volume_multi), 0.016666666666666666)

} else {
    event_inherited()
}