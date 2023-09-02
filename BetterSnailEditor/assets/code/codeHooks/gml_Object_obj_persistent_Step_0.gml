if(!global.just_loaded_savestate){
    #orig#()
}
if(go_to_BSE_credits_next){
    global.credits_mode = 100
    room_goto(EndGameCredits)
    go_to_BSE_credits_next = false
}
if(room == level_editor){
    if(keyboard_check_pressed(vk_f4)){
        gml_Script_scr_models_tool_load_model()
    }
    if(keyboard_check_pressed(vk_f7)){
        if(keyboard_check(vk_alt)){
            show_message("You have pressed F7 while holding alt. This means you will be asked to pick a FILE whose contents will be turned into WYS text.")
            var text_to_read = get_open_filename_ext("*.txt", "", program_directory, "Pick a file to read from.")
            if(string_length(text_to_read) > 0){
                var file = file_text_open_read(text_to_read)
                var lines = ""
                while(!file_text_eof(file)){
                    lines += file_text_read_string(file) +" \n"
                    file_text_readln(file)
                }
                var text_to_write_localvar = lines
                var font_size = get_integer("Enter Font Size.", 10)
                if(string_length(text_to_write_localvar) > 0 && !is_undefined(font_size)){
                    gml_Script_scr_write_text(text_to_write_localvar, font_size / 100)
                }
            }
        } else {
            var text_to_write_localvar = get_string("Enter text to write.", "HELLO WORLD!")
            var font_size = get_integer("Enter Font Size.", 10)
            if(string_length(text_to_write_localvar) > 0 && !is_undefined(font_size)){
                gml_Script_scr_write_text(text_to_write_localvar, font_size / 100)
            }
        }
    }
}
if(room != level_editor && room != level_editor_play_mode && room != menu && room != main_menu_dark){
    if(variable_instance_exists(id, "swapPump_remember")){
        if(swapPump_remember != global.save_pump_is_inverted){
            room_restart()
        }
    }
    if(variable_instance_exists(id, "heartFixed_remember")){
        if(heartFixed_remember != global.save_heart_fixed && room != InBrain_02 && room != InBrain_Controlroom){
            room_restart()
        }
    }
    if(should_restart_after_exit_menu){
        should_restart_after_exit_menu = 0
        room_restart()
    }
    swapPump_remember = global.save_pump_is_inverted
    heartFixed_remember = global.save_heart_fixed
}
if(keyboard_check(ord("Y")) && keyboard_check(ord("O"))){
    aivl_play_ext("squid_yo", -1, -1, 3, 0, 1)
}

if(room != level_editor && room != menu){
    global.inspector_active = false
}

if(global.inspector_active){
    if(point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1920 * .7 + 2, 2, 1920 - 2, 1080 - 2)){
        prevMouseInInspector = true
        global.editor_input_disabled = true
        script_execute(variable_struct_get(global.inputaction_jump, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_move_right, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_pause_menu, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_move_left, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_navigate_confirm, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_navigate_up, "MakeInvalidTillReleased"))
        script_execute(variable_struct_get(global.inputaction_navigate_down, "MakeInvalidTillReleased"))
        global.input_confirm_pressed = 0
        global.input_jump_pressed = 0
        global.input_jump = 0
        global.input_x = 0
        global.input_x_pressed = 0
        global.input_confirm_pressed = 0
        global.input_down = 0
        global.input_down_pressed = 0
    } else {
        prevMouseInInspector = false 
        global.editor_input_disabled = false
    }
} 
global.new_thumnbnail_image_path = ""


if(global.character_randomizer_for_trailer){
    global.character_randomizer_for_trailer_timer -= 1
    if(global.character_randomizer_for_trailer_timer < 0){
        global.setting_player_body = make_color_hsv(irandom(255), irandom_range(150, 255), irandom_range(100, 200))
        global.setting_player_shell = make_color_hsv(irandom(255), irandom_range(150, 255), irandom_range(100, 200))
        global.setting_player_outline = make_color_hsv(irandom(255), irandom_range(150, 255), irandom_range(0, 50))
        global.setting_player_eye = make_color_hsv(irandom(255), irandom_range(150, 255), irandom_range(200, 255))
        global.setting_player_death = make_color_hsv(irandom(255), irandom_range(150, 255), irandom_range(200, 255))
        global.setting_player_spotlight = make_color_hsv(irandom(255), irandom_range(150, 255), irandom_range(50, 100))
        global.setting_player_spotlight_dark = make_color_hsv(irandom(255), irandom_range(150, 255), irandom_range(5, 60))
        global.setting_player_flare = make_color_hsv(irandom(255), irandom_range(150, 255), irandom_range(50, 100))
        global.setting_player_trail = make_color_hsv(irandom(255), irandom_range(150, 255), irandom_range(90, 150))

        with(obj_fx_constant){
            col_player_trail_idk = global.setting_player_trail
        }
        with(obj_fx_jump_air){
            col_player_trail_idk = global.setting_player_trail
        }
        with(obj_fx_jump){
            col_player_trail_idk = global.setting_player_trail
        }
        with(obj_levelstyler){
            if(variable_global_exists("part_type_playerTrail")){
                if (part_type_exists(global.part_type_playerTrail)){
                    part_type_destroy(global.part_type_playerTrail)
                }
            }

            if(global.setting_player_trail == -1){
                col_player_trail_idk = obj_levelstyler.col_player_trail
            } else {
                col_player_trail_idk = global.setting_player_trail
            }
            part_type_color1(global.part_type_playerTrail, col_player_trail_idk)
            part_type_life(global.part_type_playerTrail, 50, 70)
            part_type_alpha3(global.part_type_playerTrail, 0.05, 0.03, 0)
            part_type_sprite(global.part_type_playerTrail, 215, 0, 0, 1)
            part_type_speed(global.part_type_playerTrail, 0.4, 0.6, 0, 0)
            part_type_orientation(global.part_type_playerTrail, 0, 360, 0, 0, 0)
            part_type_direction(global.part_type_playerTrail, 0, 360, 0, 0)
            part_type_size(global.part_type_playerTrail, 1.25, 1.25, 0, 0)

        }

        with(obj_player){
            event_user(0)
        }
        global.character_randomizer_for_trailer_timer = 20
    }

}