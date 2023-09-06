if(global.setting_funny_squid){
    return audio_create_stream(global.betterSE_assets + "audio/" + "JonasVoicelines/" + string_replace(argument0, ":", "_") + ".ogg") 
    //Memory leak but I'm too fucking tired to fix it. Just get the fucking v1.0 build out, it's a joke feature anyways.
} else {
    return #orig#(argument0)
}