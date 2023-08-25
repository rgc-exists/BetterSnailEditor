wall_line_instances = layer_get_all_elements("WallLines")
show_message("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")

if keyboard_check_pressed(vk_f8)
{
    global.in_snaily_pause = !global.in_snaily_pause
    if(global.in_snaily_pause){
        audio_pause_all();
        instance_deactivate_all(true)
        for(var i = 0; i < array_length(wall_line_instances); i += 1){
            var wall = wall_line_instances[i]
            layer_sprite_alpha(wall, 0)
        }
        global_fx_backup = global.part_sys_fx
        part_system_automatic_draw(global.part_sys_fx, false)
        part_system_automatic_draw(global.part_sys_fx, false)
        global_fx_player_backup = global.part_sys_fxPlayer
        part_system_automatic_draw(global.part_sys_fxPlayer, false)
        part_system_automatic_draw(global.part_sys_fxPlayer, false)
        global_fx_back_backup = global.part_sys_backPatterns
        part_system_automatic_draw(global.part_sys_backPatterns, false)
        part_system_automatic_draw(global.part_sys_backPatterns, false)
        unpause_background_color = layer_background_get_blend(layer_background_get_id(layer_get_id("OutsideRoom")))
        layer_background_blend(layer_background_get_id(layer_get_id("OutsideRoom")),c_dkgray)

        if(variable_global_exists("checkBoxes")){
            ds_list_clear(global.checkBoxes)
        } else {
            global.checkBoxes = ds_map_create()
        }
        var MyCheckBox = instance_create_layer(camx + scrollX - camW / 2 + 10, camy + scrollY - camH / 2 + 150, "FadeOutIn", obj_checkBox)
        ds_map_add(global.checkBoxes, "NoClipSpikes", MyCheckBox)
        
    } else {
        if(variable_global_exists("checkBoxes")){
            ds_list_clear(global.checkBoxes)
        } else {
            global.checkBoxes = ds_map_create()
        }
        audio_resume_all();
        instance_activate_all();
        for(var i = 0; i < array_length(wall_line_instances); i += 1){
            var wall = wall_line_instances[i]
            layer_sprite_alpha(wall, 1)
        }
        global.part_sys_fx = global_fx_backup
        part_system_automatic_draw(global.part_sys_fx, true)
        part_system_automatic_draw(global.part_sys_fx, true)
        global.part_sys_fxPlayer = global_fx_player_backup
        part_system_automatic_draw(global.part_sys_fxPlayer, true)
        part_system_automatic_draw(global.part_sys_fxPlayer, true)
        global.part_sys_backPatterns = unpause_background_color
        part_system_automatic_draw(global.part_sys_backPatterns, true)
        part_system_automatic_draw(global.part_sys_backPatterns, true)
        layer_background_blend(layer_background_get_id(layer_get_id("OutsideRoom")),unpause_background_color)
    }
}

if(global.in_snaily_pause){
    if(instance_exists(obj_camera_control)){
        camx = obj_camera_control.camx
        camy = obj_camera_control.camy
    } else {
        camx = 0
        camy = 0
    }
    cam = camera_get_active()
    camW = camera_get_view_width(cam)
    camH = camera_get_view_height(cam)
    draw_set_color(c_white)
    draw_rectangle(camx + scrollX - camW / 2, camy + scrollY - camH / 2, camx + scrollX - camW / 2 + 150, camy + scrollY - camH / 2 + 150, false)
    draw_set_color(c_gray)
    draw_rectangle(camx + scrollX - camW / 2, camy + scrollY - camH / 2, camx + scrollX - camW / 2 + 150, camy + scrollY - camH / 2 + 150, true)
    draw_set_color(c_black)
    draw_set_font(font_small_debug)
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)
    draw_text_ext(camx + scrollX - camW / 2, camy + scrollY - camH / 2, "NoClip", 15, 140)
    draw_text_ext(camx + scrollX - camW / 2 + 60, camy + scrollY - camH / 2 + 150, "AI spikes", 15, 140)
    
    var MyCheckBox = ds_map_find_value(global.checkBoxes,"NoClipSpikes")
    if(MyCheckBox != -1){
        if(!MyCheckBox.isOn){
            if(ds_list_find_index(global.safeObjs, obj_spike) != -1){
                ds_list_delete(global.safeObjs, obj_spike)
            }
        } else {
            if(ds_list_find_index(global.safeObjs, obj_spike) == -1){
                ds_list_add(global.safeObjs, obj_spike)
            }
        }
    }
}
