if(global.setting_funny_squid){
    return audio_create_stream(global.betterSE_assets + "audio/" + "JonasVoicelines/" + string_replace(argument0, ":", "_") + ".ogg") 
} else {
    return #orig#(argument0)
}