
if(global.just_loaded_savestate){
    global.just_loaded_savestate = false
    with obj_underwater_current {
        visible = true
    }
}
if(global.setting_save_states == 1){
    if(room != level_editor && room != menu && room != main_menu_dark && room != the_elevator){
        if(keyboard_check(vk_f6)){
            draw_set_halign(0)
            draw_set_valign(0)
            draw_set_alpha(1)
            draw_set_font(global.font_aiTalk)
            draw_set_color(c_white)
            draw_text(10, 10, "Press a number key to save a save state...")
            for(var i = 0; i <= 9; i++){
                number = string_digits(keyboard_lastchar)
                if (number == string(i)){
                    keyboard_lastchar = ""
                    gml_Script_scr_save_savestate(i)
                    show_message("Savestate saved!")
                }
            }
        } else if(keyboard_check(vk_f7)){
            draw_set_halign(0)
            draw_set_valign(0)
            draw_set_alpha(1)
            draw_set_font(global.font_aiTalk)  
            draw_set_color(c_white)
            draw_text(10, 10, "Press a number key to load a save state...")
            for(var i = 0; i <= 9; i++){
                number = string_digits(keyboard_lastchar)
                if (number == string(i)){
                    keyboard_lastchar = ""
                    if(file_exists(working_directory + "BSE_SaveState_" + string(i) + ".wyssavestate2") && file_exists(working_directory + "BSE_SaveState_" + string(i) + ".wyssavestate1")){
                        gml_Script_scr_load_savestate(i)
                    }
                }
            }
            global.just_loaded_savestate = true
        }
    }
} else if(global.setting_save_states == 2){
    show_message("B")
    if(room != level_editor && room != menu && room != main_menu_dark && room != the_elevator){
        if(keyboard_check_pressed(vk_f6)){
            gml_Script_scr_save_savestate(1)
        } else if(keyboard_check_pressed(vk_f7)){
            if(file_exists(working_directory + "BSE_SaveState_" + "1" + ".wyssavestate2") && file_exists(working_directory + "BSE_SaveState_" + "1" + ".wyssavestate1")){
                gml_Script_scr_load_savestate(1)
                global.just_loaded_savestate = true
            }
        }
    }
}