#orig#()

if(room == disco_copy_me){
    gml_Script_scr_manage_music_player()
} else {
    if(audio_exists(global.cur_musroom_sound)){
        if(audio_is_playing(global.cur_musroom_sound)){
            audio_stop_sound(global.cur_musroom_sound)
        }
    }
}
if(room == level_editor){
    if(instance_exists(obj_lvledit_save_loader) || obj_level_editor.tools_widnow_open || global.onscreen_keyboard_enabled || global.editor_input_disabled){
        global.hotkeys_shown = false
    } else {
        show_hotkeys_tip--;
        if(show_hotkeys_tip > 0){
            if(global.setting_show_hotkeys_overlay){
                draw_set_color(c_black)
                draw_set_alpha(0.6 * clamp(show_hotkeys_tip / 100, 0, 1))
                draw_rectangle(0, camera_get_view_height(camera_get_active()) - 43, 1190, camera_get_view_height(camera_get_active()), false)
                draw_set_halign(fa_left)
                draw_set_valign(fa_top)
                draw_set_font(font_aiTalk)
                draw_set_color(c_white)
                draw_set_alpha(clamp(show_hotkeys_tip / 100, 0, 1))
                scr_draw_text_in_box("Press O to show a list of Better Snail Editor hotkeys.", 1200, 30, 1, -1, 10, camera_get_view_height(camera_get_active()) - 27, false)
            }
        }

        if(keyboard_check_pressed(ord("O")) && !keyboard_check(ord("Y"))){
            global.hotkeys_shown = !global.hotkeys_shown
        }
        if(global.hotkeys_shown){
            draw_set_color(c_black)
            draw_set_alpha(0.6)
            draw_rectangle(0, 0, camera_get_view_width(camera_get_active()), camera_get_view_height(camera_get_active()), false)
            draw_set_halign(fa_left)
            draw_set_valign(fa_top)
            var hotkeys_message = "BETTER SNAIL EDITOR HOTKEYS

HOLD WHILE PLACING:
LEFT ALT - No size limit
RIGHT ALT - Fill with tiles
B - Fill with stripes
C - Wall-like pattern
Z - Place multiple players (only nessecary of the \"Place multiple players\" setting is off.)
X - Delete ALL object types (like you are holding the delete tool)

HOLD WHILE ROTATING:
LEFT ALT - Rotate 15 degrees
RIGHT ALT - Rotate 1 degree
H - Flip horizontally 
V - Flip vertically

MISC:
F4 - Load from a model (.wysmdl) file (MODELS TOOL)
F7 - Spell out text (EXPERIMENTAL)
ALT+F7 - Spell out text from file (EXPERIMENTAL)
O - Show/hide list of hotkeys


PRESS O TO CLOSE"
            draw_set_font(font_aiTalk)
            draw_set_color(c_white)
            draw_set_alpha(1)
            scr_draw_text_in_box(hotkeys_message, camera_get_view_width(camera_get_active()) - 50, camera_get_view_height(camera_get_active()) - 50, 1, -1, 50, 50, false)
        }
    }
} else {
    global.hotkeys_shown = false
}
draw_set_alpha(1)

if(global.is_legit_right_now){
    draw_set_color(make_color_rgb(0, 150, 0))
} else {
    draw_set_color(make_color_rgb(150, 0, 0))
}
draw_set_alpha(1)
draw_rectangle(0, 0, 3, 3, false)

global.just_loaded_savestate = false





if(global.setting_input_display){
    if(room != level_editor && room != empty_start_room && room != disclaimer_photoepilepsy){
        if(global.input_analysis_using_gamepad){
            //Insert gamepad input display here
        } else {
            var leftPressed = false
            var rightPressed = false
            var upPressed = false
            var downPressed = false
            var skipVlPressed = false
            var resetPressed = false
            var menuPressed = false
            if(global.input_confirm_pressed){
                rightPressed = true
            }
            if(global.input_jump_pressed){
                upPressed = true
            }
            if(global.input_jump){
                upPressed = true
            }
            if(global.input_x > 0){
                rightPressed = true
            }
            if(global.input_x < 0){
                leftPressed = true
            }
            if(global.input_x_pressed > 0){
                rightPressed = true
            }
            if(global.input_x_pressed < 0){
                leftPressed = true
            }
            if(global.input_down){
                downPressed = true
            }
            if(global.input_down_pressed){
                downPressed = true
            }
            if(global.inputaction_jump){
                upPressed = true
            }
            if(global.inputaction_move_right){
                rightPressed = true
            }
            if(global.inputaction_pause_menu){
                menuPressed = true
            }
            if(global.inputaction_move_left){
                leftPressed = true
            }
            if(global.inputaction_self_destruct){
                resetPressed = true
            }
            if(global.inputaction_skip_voiceline){
                skipVlPressed = true
            }
            if(global.inputaction_navigate_down){
                downPressed = true
            }
            if(global.inputaction_navigate_up){
                upPressed = true
            }
            if(global.inputaction_navigate_confirm){
                rightPressed = true
            }
            if(global.inputaction_navigate_confirm){
                rightPressed = true
            }
            if(global.input_reset){
                resetPressed = true
            }

            if(upPressed){
                draw_sprite_ext(global.iDisplay_Up[1], 0, 1920 - 300, 120, 60 / sprite_get_width(global.iDisplay_Up[0]), 60 / sprite_get_width(global.iDisplay_Up[0]), 0, c_white, .75)
            } else {
                draw_sprite_ext(global.iDisplay_Up[0], 0, 1920 - 300, 120, 60 / sprite_get_width(global.iDisplay_Up[0]), 60 / sprite_get_width(global.iDisplay_Up[0]), 0, c_white, .75)
            }
            if(downPressed){
                draw_sprite_ext(global.iDisplay_Down[1], 0, 1920 - 300, 180, 60 / sprite_get_width(global.iDisplay_Down[0]), 60 / sprite_get_width(global.iDisplay_Down[0]), 0, c_white, .75)
            } else {
                draw_sprite_ext(global.iDisplay_Down[0], 0, 1920 - 300, 180, 60 / sprite_get_width(global.iDisplay_Down[0]), 60 / sprite_get_width(global.iDisplay_Down[0]), 0, c_white, .75)
            }
            if(leftPressed){
                draw_sprite_ext(global.iDisplay_Left[1], 0, 1920 - 360, 180, 60 / sprite_get_width(global.iDisplay_Left[0]), 60 / sprite_get_width(global.iDisplay_Left[0]), 0, c_white, .75)
            } else {
                draw_sprite_ext(global.iDisplay_Left[0], 0, 1920 - 360, 180, 60 / sprite_get_width(global.iDisplay_Left[0]), 60 / sprite_get_width(global.iDisplay_Left[0]), 0, c_white, .75)
            }
            if(rightPressed){
                draw_sprite_ext(global.iDisplay_Right[1], 0, 1920 - 360, 180, 60 / sprite_get_width(global.iDisplay_Right[0]), 60 / sprite_get_width(global.iDisplay_Right[0]), 0, c_white, .75)
            } else {
                draw_sprite_ext(global.iDisplay_Right[0], 0, 1920 - 360, 180, 60 / sprite_get_width(global.iDisplay_Right[0]), 60 / sprite_get_width(global.iDisplay_Right[0]), 0, c_white, .75)
            }
        }
    }
}