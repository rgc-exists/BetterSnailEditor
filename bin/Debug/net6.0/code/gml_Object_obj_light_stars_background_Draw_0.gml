if (!instance_exists(obj_camera_control))
    return false;
image_blend = merge_color(original_col, make_color_rgb(255, 155, 155), global.light_suffering)
time += (1 + (global.light_suffering * 3))
camx = (obj_camera_control.camx + obj_camera_control.cam_off_x)
camy = (obj_camera_control.camy + obj_camera_control.cam_off_y)
size = (obj_camera_control.cam_zoom * 2)
if (random(1) < (global.light_suffering * 0.1))
{
}
if (random(1) < ((1 - global.light_suffering) * 0.1))
    rotation = 0
global.screenshake = max(global.screenshake, (global.light_suffering * 20))
with (obj_player)
    gamepad_rumble = max((gamepad_rumble * 0.9), (global.light_suffering * 0.5))
gpu_set_texfilter(true)
gpu_set_tex_repeat(1)
shader_set(shd_parallax)
xshake = ((20 - random(40)) * global.light_suffering) * global.setting_intense_backgrounds
yshake = ((20 - random(40)) * global.light_suffering) * global.setting_intense_backgrounds
xoff = ((((camx - (time / 3)) + ((sin((time / 33)) * 14) / 3)) + xshake) * 0.0004)
yoff = ((((camy + (time / 3)) + ((sin((time / 44)) * 15) / 3)) + yshake) * 0.0004)
shader_set_uniform_f(u_vOffset, xoff, yoff)
draw_sprite_ext(spr_light_ocean_1, 0, camx, camy, size, size, (-rotation), image_blend, image_alpha)
shader_reset()
gpu_set_texfilter(false)
