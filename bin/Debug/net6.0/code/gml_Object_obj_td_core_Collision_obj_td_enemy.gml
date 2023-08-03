if (obj_player.victory != -1)
    return;
if (((!instance_exists(obj_in_community_level)) && other.path_position == 0) || (instance_exists(obj_in_community_level) && other.path_position == 1))
{
    if (hp > 0)
    {
        soundy = audio_play_sound(sou_evilsnail_jump_a, 0.8, false)
        audio_sound_gain_fx(soundy, 0.7, 0)
        audio_sound_pitch(soundy, (0.5 + random(0.1)))
    }
    hp -= ((other.hp * 4) + 5)
    if (hp > 0)
        other.hp = 0
    else
    {
        if(!global.td_invincible_mode){
            obj_player.x = x
            obj_player.y = y
            global.last_death_by = -47
            with (obj_player)
            scr_player_death((image_angle + 90), 75)
            with (obj_td_enemy)
                invulnerable = 1
        }
    }
}
