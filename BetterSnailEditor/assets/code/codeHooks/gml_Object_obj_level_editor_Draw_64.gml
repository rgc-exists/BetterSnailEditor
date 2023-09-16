#orig#()

if(global.inspector_active){
    if(tools_widnow_open){
        global.inspector_active = false
    }
}


if(!variable_instance_exists(id, "isTypingValue")){
    isTypingValue = false
}
if(!variable_instance_exists(id, "curTyping")){
    curTyping = ""
}
if(!variable_instance_exists(id, "typingLineThingyTimer")){
    typingLineThingyTimer = 0
}


if(variable_instance_exists(id, "selectedToolStruct")){
    if(!is_undefined(selectedToolStruct)){
        if(variable_struct_get(selectedToolStruct, "custom_tool_or_object_id") != "inspector_tool"){
            global.inspector_active = false
        }
    }
}

if tools_widnow_open
{
    if (tools_window_tab == 1)
    {
        var curToolProps = variable_struct_get(selectedToolStruct, "tool_properties")
        if(array_length(curToolProps) > 0){
            if(!isTypingValue){
                curValue = variable_struct_get(curToolProps[variable_struct_get(selectedToolStruct, "selected_property")], "value")
            }
            draw_set_font(global.font_aiTalk)
            draw_set_color(c_dkgray)
            draw_rectangle(1050, 850, 1750, 925, false)
            draw_set_halign(fa_middle)
            draw_set_color(c_white)
            draw_set_valign(fa_bottom)
            draw_text_ext(1400, 845, "Enter value manually", 1, 10000)
            draw_set_halign(fa_left)
            draw_set_valign(fa_center)
            if(typingLineThingyTimer >= 30)
                scr_draw_text_in_box(string(curTyping) + "|", 625, 75, 1, -1, 1100, 887.5, false)
            else
                scr_draw_text_in_box(string(curTyping), 625, 75, 1, -1, 1100, 887.5, false)
            if(isTypingValue)
                draw_set_color(c_white)
            else
                draw_set_color(c_black)
            draw_rectangle(1050, 850, 1750, 925, true)
            if(isTypingValue){ 

                typingLineThingyTimer += 1
                if(typingLineThingyTimer > 60){
                    typingLineThingyTimer = 0
                }

                global.editor_input_disabled = true
                if(string_length(keyboard_string) > 0){
                    curTyping = string(curTyping) + keyboard_string
                    keyboard_string = ""
                }

                if(keyboard_check_pressed(vk_backspace)){
                    if(string_length(curTyping) > 0)
                        curTyping = string_delete(curTyping, string_length(curTyping), 1)
                }
                    
                if(global.input_lvledit_select_y_pressed || global.input_lvledit_select_x_pressed || global.input_virtualmouse_lbutton_pressed || keyboard_check_pressed(vk_enter)){
                    answer = curTyping
                    string_digits_answer = ""
                    accepted_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "-"]
                    accepted_num_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
                    var has_num_char = false
                    for(var c = 1; c <= string_length(answer); c++){
                        var is_in_array = false
                        for(var c2 = 1; c2 <= array_length(accepted_chars); c2++){
                            if(string_char_at(answer, c) == accepted_chars[c2-1]){
                                is_in_array = true 
                            }
                        }
                        for(var c2 = 1; c2 <= array_length(accepted_num_chars); c2++){
                            if(string_char_at(answer, c) == accepted_num_chars[c2-1]){
                                has_num_char = true 
                            }
                        }
                        if(is_in_array){
                            string_digits_answer += string_char_at(answer, c)
                        }
                    }

                    is_acceptable_num = true
                    var strPos = string_pos("-", string_digits_answer)
                    if((strPos > 1) || string_count("-", is_acceptable_num) > 1 || string_count(".", is_acceptable_num) > 1){
                        is_acceptable_num = false
                    }

                    if(string_digits_answer != "" && has_num_char && is_acceptable_num){
                        variable_struct_set(curToolProps[variable_struct_get(selectedToolStruct, "selected_property")], "value", real(string_digits_answer))
                        ds_list_set(li_quicktool_slots, selected_quicktool_slot, selectedToolStruct)
                        var struct_index = ds_list_find_index(global.li_level_editor_database, selectedToolStruct)
                        ds_list_set(global.li_level_editor_database, struct_index, selectedToolStruct)
                    }
                    isTypingValue = false
                    global.editor_input_disabled = false
                }
            } else {
                typingLineThingyTimer = 0
                curTyping = string(curValue)
                if(global.input_virtualmouse_lbutton_pressed){
                    if(point_in_rectangle(global.cursor_on_gui_x, global.cursor_on_gui_y, 1000, 850, 1700, 1200)){
                        isTypingValue = true
                        typingLineThingyTimer = 30
                        keyboard_string = ""
                    }
                    curTyping = ""
                }
            }
        }
    }
}

if(global.setting_custom_thumbnails){

    if (menu_mode == 1)
    {
        if(just_pressed_upload_icon){
            just_pressed_upload_icon = false
            workshop_save_level_screenshot()
            if(file_exists("Community Levels/" + global.currentCampaign + "/CustomThumbnail.png.png"))
                global.current_thumbnail = sprite_add("Community Levels/" + global.currentCampaign + "/CustomThumbnail.png", 0, false, false, 0, 0)
            else 
                global.current_thumbnail = sprite_add("Community Levels/" + global.currentCampaign + "/Thumbnail.png", 0, false, false, 0, 0)
        }
        var start_x = (display_get_gui_width() * 0.17) + (190 * 6.25)
        var start_y = (display_get_gui_height() * 0.17) + 90
        var draw_color = c_white
        if(scr_ui_detectvmouse_square_centered(start_x + 90, start_y + 50, 180, 101)){
            draw_color = c_gray
        }
        if(scr_ui_detectvmouse_square_lpress(start_x, start_y + 50, 180, 101)){
            draw_color = c_dkgray
            gml_Script_scr_choose_thumbnail()
        }
        draw_sprite_ext(global.current_thumbnail, 0, start_x, start_y, 180 / sprite_get_width(global.current_thumbnail), 101 / sprite_get_height(global.current_thumbnail), 0, draw_color, 1)
        if(scr_ui_detectvmouse_square_centered(start_x + 90, start_y + 50, 180, 101)){
            draw_set_color(c_white)
            draw_set_halign(fa_middle)
            draw_set_valign(fa_center)
            scr_draw_text_in_box("Choose Thumbnail", 180, 101, 1, -1, (start_x + 90), (start_y + 50), 0)
        }
        draw_set_color(c_white)
        draw_set_alpha(1)
        draw_rectangle(start_x, start_y, start_x + 180, start_y + 101, true)
    } else {
        if(!just_pressed_upload_icon){
            just_pressed_upload_icon = true
        }
    }
}