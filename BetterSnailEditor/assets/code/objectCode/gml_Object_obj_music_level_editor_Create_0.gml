event_inherited()
if(global.setting_custom_editor_playlist && array_length(global.editor_custom_playlist) > 0){
    if(audio_is_playing(playing_music)){
        audio_stop_sound(playing_music)
    }
}