connection_failed = 1
corruption_failed = 0
dragging_was_corrupted = 0
currupted_at_frame_start = corrupted
if (obj_player.dragging_power_connection >= 0)
{
    dragging_was_corrupted = obj_player.dragging_power_connection.corrupted
    if (ds_list_find_index(li_power_connections, obj_player.dragging_power_connection.id) == -1)
    {
        if (obj_player.dragging_power_connection.id != id)
        {
            if (point_distance(obj_player.dragging_power_connection.x, (obj_player.dragging_power_connection.y + obj_player.dragging_power_connection.yoffset), x, (y + yoffset)) < obj_player.dragging_power_connection.dragging_range && scr_validate_line((obj_player.dragging_power_connection.x + obj_player.dragging_power_connection.xoffset), (obj_player.dragging_power_connection.y + obj_player.dragging_power_connection.yoffset), (x + xoffset), (y + yoffset)))
            {
                if (obj_player.dragging_power_connection.corrupted == 0)
                {
                    if (corrupted == 0)
                    {
                        ds_list_add(li_power_connections, obj_player.dragging_power_connection.id)
                        ds_list_add(obj_player.dragging_power_connection.li_power_connections, id)
                        connection_failed = 0
                        if (powered || obj_player.dragging_power_connection.powered)
                        {
                            if global.underwater
                            {
                                sound = audio_play_sound(sou_UnderwTsssss, 0.8, false)
                                audio_sound_gain_fx(sound, 1, 0)
                                audio_sound_pitch(sound, (2.9 + random(0.2)))
                            }
                            else
                            {
                                sound = audio_play_sound(sou_game_start, 0.8, false)
                                audio_sound_gain_fx(sound, 1, 0)
                                audio_sound_pitch(sound, (0.95 + random(0.1)))
                            }
                        }
                        sound = audio_play_sound(sou_laser_hit_03, 0.8, false)
                        audio_sound_gain_fx(sound, 1, 0)
                        audio_sound_pitch(sound, 1.5)
                        connectedtimer = 0
                    }
                    scr_update_power_grid()
                }
                else
                {
                    if (corrupted == 0)
                    {
                        obj_player.dragging_power_connection.corrupted = 0
                        corrupted = 1
                        with obj_player.dragging_power_connection {
                            event_user(0)
                        }
                        event_user(0)
                        layer_fx = layer_get_id("Fx")
                        idmerk = instance_create_layer(x, (y + yoffset), "MiniGames", obj_fx_lightning)
                        idmerk.image_blend = merge_color(obj_levelstyler.col_currupted_antenna, c_white, 0.5)
                        idmerk = instance_create_layer(x, (y + yoffset), layer_fx, obj_fx_flare)
                        idmerk.image_blend = merge_color(obj_levelstyler.col_currupted_antenna, c_white, 0.3)
                        idmerk.image_xscale = 1
                        idmerk.image_yscale = 1
                        idmerk.image_alpha = 0.5
                        idmerk.decay = 0.9
                        with (obj_player)
                            gamepad_rumble = max(gamepad_rumble, 0.2)
                        global.screenshake = max(global.screenshake, 10)
                        shaky = 3
                        if global.underwater
                        {
                            sound = audio_play_sound(sou_UnderwPop_04, 0.8, false)
                            audio_sound_gain_fx(sound, 1, 0)
                            audio_sound_pitch(sound, (2 + random(0.2)))
                            sound = audio_play_sound(sou_UnderwPop_04, 0.8, false)
                            audio_sound_gain_fx(sound, 1, 0)
                            audio_sound_pitch(sound, (0.5 + random(0.2)))
                        }
                        else
                        {
                            sound = audio_play_sound(sou_shooter_plop_04, 0.8, false)
                            audio_sound_gain_fx(sound, 1, 0)
                            audio_sound_pitch(sound, (2 + random(0.2)))
                            sound = audio_play_sound(sou_shooter_plop_04, 0.8, false)
                            audio_sound_gain_fx(sound, 1, 0)
                            audio_sound_pitch(sound, (0.5 + random(0.2)))
                        }
                    }
                    else
                        corruption_failed = 1
                    if connections_with_this_can_be_capped
                    {
                        for (i = (ds_list_size(li_power_connections) - 1); i >= 0; i--)
                        {
                            otherAntenna = ds_list_find_value(li_power_connections, i)
                            if (!otherAntenna.connections_with_this_can_be_capped)
                            {
                            }
                            else
                            {
                                descon = instance_create_layer(0, 0, "Fx", obj_fx_destroyed_connection)
                                descon.x1 = x
                                descon.y1 = (y + yoffset)
                                descon.x2 = otherAntenna.x
                                descon.y2 = (otherAntenna.y + otherAntenna.yoffset)
                                ds_list_remove(otherAntenna.li_power_connections, id)
                                ds_list_delete(li_power_connections, i)
                            }
                        }
                    }
                    scr_update_power_grid()
                }
            }
            else if obj_player.dragging_power_connection.corrupted
                corruption_failed = 1
        }
    }
    else
        connection_failed = 0
}
with (obj_antenna)
    dragging_connection = 0
if (other.dragging_power_connection != id)
{
    if (other.dragging_power_connection != self)
    {
        if connection_failed
        {
            if (!currupted_at_frame_start)
            {
                dragobj = other.dragging_power_connection
                if scr_validate_line((x + xoffset), (y + yoffset), (dragobj.x + dragobj.xoffset), (dragobj.y + dragobj.yoffset))
                {
                    dragobj.lost_connection_x = (x - dragobj.x)
                    dragobj.lost_connection_y = (((y + yoffset) - dragobj.y) - dragobj.yoffset)
                }
                else
                {
                    ds_list_clear(list_all_collisions)
                    collision_line_list(x, (y + yoffset), dragobj.x, (dragobj.y + dragobj.yoffset), 221, 0, 1, list_all_collisions, 0)
                    collision_line_list(x, (y + yoffset), dragobj.x, (dragobj.y + dragobj.yoffset), 568, 0, 1, list_all_collisions, 0)
                    collision_line_list(x, (y + yoffset), dragobj.x, (dragobj.y + dragobj.yoffset), 756, 0, 1, list_all_collisions, 0)
                    scr_raycast(dragobj.x, (dragobj.y + dragobj.yoffset), x, (y + yoffset), list_all_collisions)
                    dragobj.lost_connection_x = (RAYCAST_OUTPUT_X - dragobj.x)
                    dragobj.lost_connection_y = ((RAYCAST_OUTPUT_Y - dragobj.y) - dragobj.yoffset)
                    objflare = instance_create_layer(RAYCAST_OUTPUT_X, RAYCAST_OUTPUT_Y, "Fx", obj_fx_flare)
                    objflare.sprite_index = spr_flare_small
                    objflare.decay = 0.96
                    objflare.image_blend = col_line
                    objflare.image_xscale = 0.7
                    objflare.image_yscale = 0.7
                }
                dragobj.lost_connection_flash = 1
                dragobj.last_connection_corrupted = corrupted
            }
        }
    }
    powerflash = 0.5
    if corrupted
    {
        if ((!dragging_was_corrupted) || corruption_failed)
        {
            if global.underwater
            {
                sound = audio_play_sound(sou_UnderwTsssss, 0.8, false)
                audio_sound_gain_fx(sound, 1, 0)
                audio_sound_pitch(sound, (0.7 + random(0.1)))
            }
            else
            {
                sound = audio_play_sound(sou_game_start, 0.8, false)
                audio_sound_gain_fx(sound, 1, 0)
                audio_sound_pitch(sound, (0.7 + random(0.1)))
            }
        }
    }
    else if global.underwater
    {
        sound = audio_play_sound(sou_UnderwTsssss, 0.8, false)
        audio_sound_gain_fx(sound, 0.5, 0)
        audio_sound_pitch(sound, (0.55 + random(0.1)))
    }
    else
    {
        sound = audio_play_sound(sou_game_start, 0.8, false)
        audio_sound_gain_fx(sound, 1, 0)
        audio_sound_pitch(sound, (1.9 + random(0.2)))
    }
    shaky = max(1, shaky)
}
other.dragging_power_connection = id
dragging_connection = 1
