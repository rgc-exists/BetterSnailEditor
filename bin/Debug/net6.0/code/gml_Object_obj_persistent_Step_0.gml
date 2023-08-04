if(directory_exists(working_directory + "BetterSnailEditor_Assets/")){
    global.betterSE_assets = working_directory + "BetterSnailEditor_Assets/"
    global.is_gmml_version = false
} else {
    show_error("ERROR:\nThe assets folder for the mod was not found.\nPlease add the folder called 'BetterSnailEditor_Assets' to the same folder as the Will You Snail executable (your WYS steam install location.)\nThe folder can be found in the zip file you downloaded the mod with.\n\n\nFor GMML users, IDK how you messed this up because its literally checking if the GMML folder for the mod exists. XD", true)
}
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