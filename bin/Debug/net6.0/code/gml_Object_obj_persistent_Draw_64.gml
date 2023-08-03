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