time++
if active
{
    if (room == community_campaign_lvlselect)
    {
        global.currentCampaignLevelIndex = level
        scr_fade_to_editor(level)
    }
    else
        scr_fade_to_room(level)
}
inview = false
if (y > ((obj_camera_control.camx - (obj_camera_control.camw * 0.5)) - x))
{
    if (y < ((obj_camera_control.camx + (obj_camera_control.camw * 0.5)) + x))
    {
        if (60 > ((obj_camera_control.camy - (obj_camera_control.camh * 0.5)) - x))
        {
            if (60 < ((obj_camera_control.camy + (obj_camera_control.camh * 0.5)) + x))
                inview = true
        }
    }
}

if (!inview)
{
    return false;
}
if (level == 70)
{
    if (!locked_level)
    {
        if global.underwater
            part_particles_create(global.part_sys_fx, ((showx - 40) + random(80)), ((y - 40) + random(80)), global.part_type_underwBubbles, ceil((1 * scr_particle_multiplyer())))
    }
}
afterflash *= 0.95
if hoverover
{
    showx_target = xstart
    afterflash = 1
}
else
    showx_target = (xstart + (100 * sign((x - obj_player.x))))
showx = lerp(showx, showx_target, 0.2)
scalevar = lerp(scalevar, hoverover, 0.2)
image_xscale = ((0.8 + scalevar) / 2)
image_yscale = image_xscale
if active
{
    vspeed -= 0.2
    obj_player.x = lerp(obj_player.x, x, 0.5)
    obj_player.y = lerp(obj_player.y, y, 0.5)
    obj_player.vspeed *= 0.8
    showy = y
}
else
    showy = (ystart + (abs(((((time * 0.3) + (x * 0.1)) % 100) - 50)) * 0.5))
