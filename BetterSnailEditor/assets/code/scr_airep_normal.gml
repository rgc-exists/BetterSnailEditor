if(room != level_editor){
    time++
    target_dist_to_player = ((abs((((time / 200) % 2) - 1)) * 250) + 650)
    add_angle = ((abs((((time / 167) % 2) - 1)) * 20) - 10)
    image_angle = ((abs((((time / 221) % 2) - 1)) * 40) - 20)
    eye_01_dist = ((abs((((time / 145) % 2) - 1)) * 100) + 150)
    eye_01_dir = ((abs((((time / 125) % 2) - 1)) * 10) + 20)
    eye_02_dist = ((abs((((time / 175) % 2) - 1)) * 100) + 150)
    eye_02_dir = ((abs((((time / 85) % 2) - 1)) * 10) + 150)
    mouth_dist = ((abs((((time / 133) % 2) - 1)) * 50) + 150)
    mouth_dir = ((abs((((time / 192) % 2) - 1)) * 30) + 255)
    if stay_in_view_mode
    {
        center_x = ((abs((((time / 670) % 2) - 1)) * (room_width - 400)) + 200)
        center_y = ((abs((((time / 817) % 2) - 1)) * (room_height - 800)) + 400)
    }
    else
    {
        center_x = obj_camera_control.camx
        center_y = obj_camera_control.camy
    }
    player_to_center_dir = point_direction(obj_player.x, obj_player.y, center_x, center_y)
    target_x = (obj_player.x + lengthdir_x(target_dist_to_player, (player_to_center_dir + add_angle)))
    target_y = (obj_player.y + lengthdir_y(target_dist_to_player, (player_to_center_dir + add_angle)))
    if (talking && stay_in_view_mode)
    {
        view_border_left = (obj_camera_control.camx - (obj_camera_control.camw / 2))
        view_border_right = (obj_camera_control.camx + (obj_camera_control.camw / 2))
        view_border_top = (obj_camera_control.camy - (obj_camera_control.camh / 2))
        view_border_bot = (obj_camera_control.camy + (obj_camera_control.camh / 2))
        target_x = clamp(target_x, (view_border_left + 350), (view_border_right - 350))
        target_y = clamp(target_y, (view_border_top + 350), (view_border_bot - 350))
    }
    towards_target_dir = point_direction(x, y, target_x, target_y)
    towards_target_dist = point_distance(x, y, target_x, target_y)
    move_dist = clamp(towards_target_dist, 0, 12)
    x += lengthdir_x(move_dist, towards_target_dir)
    y += lengthdir_y(move_dist, towards_target_dir)
    minDistToKeep = 375
    if (point_distance(x, y, obj_player.x, obj_player.y) < minDistToKeep)
    {
        mydirfromplayer = point_direction(obj_player.x, obj_player.y, x, y)
        x = (obj_player.x + lengthdir_x(minDistToKeep, mydirfromplayer))
        y = (obj_player.y + lengthdir_y(minDistToKeep, mydirfromplayer))
    }
    target_eye_01_x = (x + lengthdir_x(eye_01_dist, (eye_01_dir + image_angle)))
    target_eye_01_y = (y + lengthdir_y(eye_01_dist, (eye_01_dir + image_angle)))
    target_eye_02_x = (x + lengthdir_x(eye_02_dist, (eye_02_dir + image_angle)))
    target_eye_02_y = (y + lengthdir_y(eye_02_dist, (eye_02_dir + image_angle)))
    target_mouth_x = (x + lengthdir_x(mouth_dist, (mouth_dir + image_angle)))
    target_mouth_y = (y + lengthdir_y(mouth_dist, (mouth_dir + image_angle)))
    if ((time / 4) == round((time / 4)))
    {
        if talking || global.setting_squid_constant_opacity
            image_alpha = clamp((image_alpha + 0.25), 0.2, 1)
        else if (go_completely_dark_when_not_talking == 0)
            image_alpha = (((image_alpha - 0.2) * 0.9) + 0.2)
        else
            image_alpha *= 0.9
    }
    if ((image_alpha < 0.25 || global.setting_squid_stay_in_background == 1) && global.setting_squid_stay_in_background != 2)
    {
        with (obj_ai_mouth)
            layer = layer_ai_rep_back
        with (obj_ai_eye)
            layer = layer_ai_rep_back
    }
    else
    {
        with (obj_ai_mouth)
            layer = layer_ai_rep
        with (obj_ai_eye)
            layer = layer_ai_rep
    }

} else {
    time++
    target_dist_to_player = ((abs((((time / 200) % 2) - 1)) * 250) + 650)
    add_angle = ((abs((((time / 167) % 2) - 1)) * 20) - 10)
    image_angle = ((abs((((time / 221) % 2) - 1)) * 40) - 20)
    eye_01_dist = ((abs((((time / 145) % 2) - 1)) * 100) + 150)
    eye_01_dir = ((abs((((time / 125) % 2) - 1)) * 10) + 20)
    eye_02_dist = ((abs((((time / 175) % 2) - 1)) * 100) + 150)
    eye_02_dir = ((abs((((time / 85) % 2) - 1)) * 10) + 150)
    mouth_dist = ((abs((((time / 133) % 2) - 1)) * 50) + 150)
    mouth_dir = ((abs((((time / 192) % 2) - 1)) * 30) + 255)
    if stay_in_view_mode
    {
        center_x = ((abs((((time / 670) % 2) - 1)) * (room_width - 400)) + 200)
        center_y = ((abs((((time / 817) % 2) - 1)) * (room_height - 800)) + 400)
    }
    else
    {
        center_x = obj_camera_control_level_editor.camx
        center_y = obj_camera_control_level_editor.camy
    }
    player_to_center_dir = point_direction(global.input_virtualmouse_notgui_x, global.input_virtualmouse_notgui_y, center_x, center_y)
    target_x = (global.input_virtualmouse_notgui_x + lengthdir_x(target_dist_to_player, (player_to_center_dir + add_angle)))
    target_y = (global.input_virtualmouse_notgui_y + lengthdir_y(target_dist_to_player, (player_to_center_dir + add_angle)))
    if (talking && stay_in_view_mode)
    {
        view_border_left = (obj_camera_control_level_editor.camx - (obj_camera_control_level_editor.camw / 2))
        view_border_right = (obj_camera_control_level_editor.camx + (obj_camera_control_level_editor.camw / 2))
        view_border_top = (obj_camera_control_level_editor.camy - (obj_camera_control_level_editor.camh / 2))
        view_border_bot = (obj_camera_control_level_editor.camy + (obj_camera_control_level_editor.camh / 2))
        target_x = clamp(target_x, (view_border_left + 350), (view_border_right - 350))
        target_y = clamp(target_y, (view_border_top + 350), (view_border_bot - 350))
    }
    towards_target_dir = point_direction(x, y, target_x, target_y)
    towards_target_dist = point_distance(x, y, target_x, target_y)
    move_dist = clamp(towards_target_dist, 0, 12)
    x += lengthdir_x(move_dist, towards_target_dir)
    y += lengthdir_y(move_dist, towards_target_dir)
    minDistToKeep = 375
    if (point_distance(x, y, global.input_virtualmouse_notgui_x, global.input_virtualmouse_notgui_y) < minDistToKeep)
    {
        mydirfromplayer = point_direction(global.input_virtualmouse_notgui_x, global.input_virtualmouse_notgui_y, x, y)
        x = (global.input_virtualmouse_notgui_x + lengthdir_x(minDistToKeep, mydirfromplayer))
        y = (global.input_virtualmouse_notgui_y + lengthdir_y(minDistToKeep, mydirfromplayer))
    }
    target_eye_01_x = (x + lengthdir_x(eye_01_dist, (eye_01_dir + image_angle)))
    target_eye_01_y = (y + lengthdir_y(eye_01_dist, (eye_01_dir + image_angle)))
    target_eye_02_x = (x + lengthdir_x(eye_02_dist, (eye_02_dir + image_angle)))
    target_eye_02_y = (y + lengthdir_y(eye_02_dist, (eye_02_dir + image_angle)))
    target_mouth_x = (x + lengthdir_x(mouth_dist, (mouth_dir + image_angle)))
    target_mouth_y = (y + lengthdir_y(mouth_dist, (mouth_dir + image_angle)))
    if ((time / 4) == round((time / 4)))
    {
        if talking || global.setting_squid_constant_opacity
            image_alpha = clamp((image_alpha + 0.25), 0.2, 1)
        else if (go_completely_dark_when_not_talking == 0)
            image_alpha = (((image_alpha - 0.2) * 0.9) + 0.2)
        else
            image_alpha *= 0.9
    }
    if ((image_alpha < 0.25 || global.setting_squid_stay_in_background == 1) && global.setting_squid_stay_in_background != 2)
    {
        with (obj_ai_mouth)
            layer = layer_ai_rep_back
        with (obj_ai_eye)
            layer = layer_ai_rep_back
    }
    else
    {
        with (obj_ai_mouth)
            layer = layer_ai_rep
        with (obj_ai_eye)
            layer = layer_ai_rep
    }
}