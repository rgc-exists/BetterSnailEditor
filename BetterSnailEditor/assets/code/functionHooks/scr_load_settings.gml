if(file_exists("SettoIngs23-2.set"))
    #orig#()


gml_Script_scr_initialize_BSE_settings()
if(file_exists("BetterSE_SettoIngs23-2.set")){
    file = file_text_open_read("BetterSE_SettoIngs23-2.set")
    save_file_version = ""
    while (!file_text_eof(file))
    {
        section_header = file_text_read_string(file)
        file_text_readln(file)
        switch section_header
        {
            case "Mod Version":
                mod_save_file_version = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Squid In Editor":
                global.setting_squid_in_editor = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Epilepsy Warning":
                global.setting_epilepsy_warning = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Multi-Frame Loading":
                global.setting_multiframe_loading = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Camera Zoom Min":
                global.setting_camzoom_min = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Camera Zoom Max":
                global.setting_camzoom_max = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Intense Backgrounds":
                global.setting_intense_backgrounds = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Squid Consistent Opacity":
                global.setting_squid_constant_opacity = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Skip Title Animation":
                global.setting_skip_title_animation = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Open Hotkeys Message":
                global.setting_show_hotkeys_overlay = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Place Multiple Players":
                global.setting_place_multiple_players = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Autosave Levels":
                global.setting_autosave_level = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Full Snailax Easter Egg":
                global.setting_snailax_full = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Voiceline Mode":
                global.setting_voiceline_mode = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Snailax Forever":
                global.setting_snailax_forever = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Body Color":
                global.setting_player_body = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Shell Color":
                global.setting_player_shell = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Outline Color":
                global.setting_player_outline = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Eye Color":
                global.setting_player_eye = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Death Color":
                global.setting_player_death = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Spotlight Color":
                global.setting_player_spotlight = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Spotlight Dark Color":
                global.setting_player_spotlight_dark = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Flare Color":
                global.setting_player_flare = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Player Trail Color":
                global.setting_player_trail = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Default Hat":
                global.setting_default_hat = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Squid Color":
                global.setting_squid_color = file_text_read_real(file)
                file_text_readln(file)
                break
            /*
            case "Optimized Wires":
                global.setting_optimized_wires = file_text_read_real(file)
                file_text_readln(file)
                break
            */
            case "Funny Squid":
                global.setting_funny_squid = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Blood Mode":
                global.setting_blood_mode = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Multiframe Loading Wires":
                global.setting_multiframe_loading_wires = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Unicorn Horn Ball Override":
                global.setting_unicorn_horn_ball_override = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Custom Thumbnails":
                global.setting_custom_thumbnails = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Campaign Exploration Mode":
                global.setting_campaign_exploration_mode = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Place Multiple 1-At-A-Time Objects":
                global.setting_place_multiple_oneAtATime_objs = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Restart Invincibility":
                global.restart_invincible_mode = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Global Inspector":
                global.setting_global_inspector_available = file_text_read_real(file)
                file_text_readln(file)
                break
            case "SaveStates":
                global.setting_save_states = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Better Saving":
                global.setting_betterSaving = file_text_read_real(file)
                file_text_readln(file)
                break
            case "Custom Editor Playlist":
                global.setting_custom_editor_playlist = file_text_read_real(file)
                file_text_readln(file)
                break
            
        }
    }
    file_text_close(file)
}