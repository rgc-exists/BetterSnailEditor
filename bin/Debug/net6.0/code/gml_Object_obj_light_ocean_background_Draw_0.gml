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
global.screenshake = max(global.screenshake, (global.light_suffering * 20 * global.setting_intense_backgrounds))
with (obj_player)
    gamepad_rumble = max((gamepad_rumble * 0.9), (global.light_suffering * 0.5 * global.setting_intense_backgrounds))
if (global.setting_visual_details == 0)
{
    xshake = ((5 - random(10)) * global.light_suffering * global.setting_intense_backgrounds)
    yshake = ((5 - random(10)) * global.light_suffering * global.setting_intense_backgrounds)
    draw_sprite_ext(spr_light_ocean_4, 0, (camx + xshake), (camy + yshake), size, size, (rotation * 0.25), image_blend, image_alpha)
}
else
{
    gpu_set_texfilter(true)
    gpu_set_tex_repeat(1)
    shader_set(shd_parallax)
    xshake = ((20 - random(40)) * global.light_suffering * global.setting_intense_backgrounds)
    yshake = ((20 - random(40)) * global.light_suffering * global.setting_intense_backgrounds)
    xoff = (xshake * 0.0001)
    yoff = (yshake * 0.0001)
    shader_set_uniform_f(u_vOffset, xoff, yoff)
    draw_sprite_ext(spr_light_ocean_4, 0, camx, camy, size, size, (rotation * 0.25), image_blend, image_alpha)
    if (global.setting_visual_details >= 1)
    {
        xshake = ((20 - random(40)) * global.light_suffering)
        yshake = ((20 - random(40)) * global.light_suffering)
        xoff = ((((camx - time) + (sin((time / 30)) * 15)) + xshake) * 0.0001)
        yoff = ((((camy + time) + (sin((time / 23)) * 13)) + yshake) * 0.0001)
        shader_set_uniform_f(u_vOffset, xoff, yoff)
        draw_sprite_ext(spr_light_ocean_3, 0, camx, camy, size, size, ((-rotation) * 0.5), image_blend, image_alpha)
    }
    if (global.setting_visual_details >= 2)
    {
        xshake = ((20 - random(40)) * global.light_suffering * global.setting_intense_backgrounds)
        yshake = ((20 - random(40)) * global.light_suffering * global.setting_intense_backgrounds)
        xoff = ((((camx - time) + (sin((time / 38)) * 17)) + xshake) * 0.0002)
        yoff = ((((camy + time) + (sin((time / 30)) * 15)) + yshake) * 0.0002)
        shader_set_uniform_f(u_vOffset, xoff, yoff)
        draw_sprite_ext(spr_light_ocean_2, 0, camx, camy, size, size, (rotation * 0.75), image_blend, image_alpha)
    }
    if (global.setting_visual_details >= 3)
    {
        xshake = ((20 - random(40)) * global.light_suffering * global.setting_intense_backgrounds)
        yshake = ((20 - random(40)) * global.light_suffering * global.setting_intense_backgrounds)
        xoff = ((((camx - time) + (sin((time / 33)) * 14)) + xshake) * 0.0004)
        yoff = ((((camy + time) + (sin((time / 44)) * 15)) + yshake) * 0.0004)
        shader_set_uniform_f(u_vOffset, xoff, yoff)
        draw_sprite_ext(spr_light_ocean_1, 0, camx, camy, size, size, (-rotation), image_blend, image_alpha)
    }
    shader_reset()
    gpu_set_texfilter(false)
}
