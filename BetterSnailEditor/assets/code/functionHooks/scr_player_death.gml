if(global.invincible_mode && !((global.last_death_by == -7) && !global.restart_invincible_mode) && !((just_hit_fuse) && !global.fuse_invincible_mode)){
    return false;
} else if(((global.last_death_by == -7) && global.restart_invincible_mode) || ((just_hit_fuse) && global.fuse_invincible_mode)){
    return false;
} else {
    if(global.setting_blood_mode){
        if global.language_testing_mode
        {
            return false;
        }
        death_direction = argument0
        death_power = argument1
        if (victory < 0)
        {
            if (dead < 0)
            {
                global.deaths_per_second += 1
                global.temporary_stuff = death_direction
                with (obj_hat_parent)
                {
                    if (!dead)
                    {
                        dead = 1
                        powery = (13 + random(6))
                        angle = ((global.temporary_stuff - 40) + random(80))
                        xspeed = lengthdir_x(powery, angle)
                        yspeed = lengthdir_y(powery, angle)
                    }
                }
                dead = 0
                part_type_color_mix(global.part_type_playerSparks, obj_levelstyler.col_snail_death, merge_color(obj_levelstyler.col_snail_death, c_white, 0.5))
                part_type_color1(global.part_type_deathBounce, merge_color(obj_levelstyler.col_snail_death, c_white, 0.5))
                with (obj_snaili_eye)
                    event_user(0)
                global.save_deaths += 1
                scr_level_dat_add_deaths(room, 1)
                scr_level_dat_add_playtime(room, (obj_player.active_time + 40))
                if (global.save_difficulty == scr_level_dat_get_autodiff_difficulty(room))
                    scr_level_dat_add_autodiff_playtime(room, (obj_player.active_time + 40))
                else
                {
                    scr_level_dat_set_autodiff_playtime(room, (obj_player.active_time + 40))
                    scr_level_dat_set_autodiff_difficulty(room, global.save_difficulty)
                }
                var target_difficulty = scr_get_target_difficulty()
                if (global.save_difficulty != target_difficulty)
                {
                    if (!global.save_pump_is_inverted)
                    {
                        if (!instance_exists(obj_dontRestartLevelOnDifficultyChange))
                        {
                            aivl_event_auto_difficulty_change(-1)
                            global.difficulty_was_last_changed_in_direction = -1
                            global.difficulty_was_last_changed_by_ai = 1
                            global.difficulty_was_last_changed_by_human = 0
                            global.save_difficulty = target_difficulty
                            scr_level_dat_set_autodiff_playtime(room, 0)
                            scr_level_dat_set_autodiff_difficulty(room, global.save_difficulty)
                            global.difficulty_was_last_changed_before = 0
                            obj_levelstyler.difficulty_set_by_ai = global.save_difficulty
                        }
                    }
                }
                for (i = 0; i < gamepad_get_device_count(); i++)
                    gamepad_set_vibration_ifusing(i, global.setting_gamepad_rumble, global.setting_gamepad_rumble)
                if obj_levelstyler.glitchy
                    scr_glitch(2)
                with (obj_d_button_prompt)
                    speed = 0
                with (obj_d_main)
                    paused = 1
                global.last_death_pos_x = obj_player.x
                global.last_death_pos_y = obj_player.y
                if (random(1) < 0.5)
                {
                    if audio_is_playing(snail_voice_sound)
                        audio_stop_sound(snail_voice_sound)
                    if (!global.underwater)
                    {
                        snail_voice_sound = audio_play_sound(choose(sou_cuteDeath_01, sou_cuteDeath_02, sou_cuteDeath_03, sou_cuteDeath_04, sou_cuteDeath_05, sou_cuteDeath_06, sou_cuteDeath_07, sou_cuteDeath_08), 0.91, false)
                        audio_sound_gain_fx(snail_voice_sound, 0.2, 0)
                    }
                    else
                    {
                        snail_voice_sound = audio_play_sound(choose(sou_UnderwCuteDeath_01, sou_UnderwCuteDeath_02, sou_UnderwCuteDeath_03, sou_UnderwCuteDeath_04, sou_UnderwCuteDeath_05, sou_UnderwCuteDeath_06, sou_UnderwCuteDeath_07, sou_UnderwCuteDeath_08), 0.91, false)
                        audio_sound_gain_fx(snail_voice_sound, 0.5, 0)
                    }
                    audio_sound_pitch(snail_voice_sound, (0.48 + random(0.2)))
                }
                global.screenshake = 75
                instance_create_layer(x, y, "Spots", obj_flickering_death_count)
                particle_count = 150
                layer_fx = layer_get_id("Fx")
                repeat particle_count
                {
                    idmerk = instance_create_layer(x, y, layer_fx, obj_fx_death)
                    idmerk.image_xscale = random_range(0.05, 0.2)
                    idmerk.image_yscale = random_range(0.05, 0.2)
                    idmerk.speed = (power(random(1), 2) * 20)
                    idmerk.direction = random(360)
                    var powy = (random(.2) * death_power)
                    idmerk.hspeed += lengthdir_x(powy, death_direction)
                    idmerk.vspeed += lengthdir_y(powy, death_direction)
                    idmerk.hspeed += hspeed
                    idmerk.xspeed = idmerk.hspeed
                    idmerk.yspeed = idmerk.vspeed
                    idmerk.speed = 0
                }
                idmerk.decay = 0.9
                visible = false
                if global.underwater
                {
                    sound = audio_play_sound(sou_UnderwDeath, 1, false)
                    audio_sound_gain_fx(sound, 1, 0)
                    audio_sound_pitch(sound, (0.9 + random(0.2)))
                    sound = audio_play_sound(sou_UnderwDeath, 1, false)
                    audio_sound_gain_fx(sound, 1, 0)
                    audio_sound_pitch(sound, (1.9 + random(0.2)))
                }
                else
                {
                    sound = audio_play_sound(sou_fail, 1, false)
                    audio_sound_gain_fx(sound, 1, 0)
                    sound = audio_play_sound(sou_fail, 1, false)
                    audio_sound_gain_fx(sound, 1, 0)
                    audio_sound_pitch(sound, 2)
                }
                aivl_event_death()
                if (global.last_death_by != -7 && global.last_death_by != -77 && global.last_death_by != -47 && obj_player.active_time > 150)
                {
                    ds_list_add(global.last_deaths_position, obj_player.x, obj_player.y)
                    if (ds_list_size(global.last_deaths_position) > 10)
                    {
                        ds_list_delete(global.last_deaths_position, 0)
                        ds_list_delete(global.last_deaths_position, 0)
                    }
                }
                scr_save_game()
                scr_add_stats("deaths", 1)
                if (global.save_deaths >= 100)
                    scr_set_achievement("HUNDRET_DEATHS")
                if (global.save_deaths >= 1000)
                    scr_set_achievement("THOUSAND_DEATHS")
            }
        }
    } else {
        return #orig#(argument0, argument1)
    }
}