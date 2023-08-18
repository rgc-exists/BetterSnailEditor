if (hp <= 0)
{
    sound = audio_play_sound(destroy_sound, 0.8, false)
    audio_sound_gain_fx(sound, destroy_sound_volume, 0)
    audio_sound_pitch(sound, 0.5)
    instance_destroy()
    global.screenshake += screenshake_destroy
    part_particles_create(global.part_sys_fx, x, y, global.part_type_shooterKill, round((particle_count_death * scr_particle_multiplyer())))
    idmerk = instance_create_layer(x, y, "Fx", obj_fx_flare)
    idmerk.decay = 0.9
    idmerk.image_blend = merge_color(image_blend, c_white, 0)
    idmerk.image_xscale = (sprite_width / 200)
    idmerk.image_yscale = idmerk.image_xscale
    event_user(1)
}
if (instance_exists(obj_in_community_level) && path_position == 1 && alarm[1] == -1)
    alarm[1] = 60
image_index = floor(((1 - (hp / hp_max)) * 6))
image_angle += rot
image_blend = merge_color(base_col, c_white, flash)
flash *= 0.8
