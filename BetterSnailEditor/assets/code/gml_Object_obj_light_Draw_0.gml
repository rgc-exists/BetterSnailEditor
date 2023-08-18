if (global.setting_visual_details < required_visual_detail)
{
    return false;
}
size = (totalsize * (0.98 + random(0.04))) * global.setting_intense_backgrounds
xxx = ((x - ((obj_camera_control.camx - x) * 0.2) * global.setting_intense_backgrounds) + ((random(40) - 20) * global.light_suffering * global.setting_intense_backgrounds))
yyy = ((y - ((obj_camera_control.camy - y) * 0.2) * global.setting_intense_backgrounds) + ((random(40) - 20) * global.light_suffering * global.setting_intense_backgrounds))
draw_sprite_ext(spr_flare, image_index, xxx, yyy, size, size, image_angle, image_blend, (0.1 * image_alpha))
draw_sprite_ext(spr_flare_small, image_index, xxx, yyy, size, size, (-image_angle), image_blend, (1 * image_alpha))