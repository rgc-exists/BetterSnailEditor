if(global.setting_blood_mode){
    sprite_index = spr_circle
    started_with_blood_mode = true
    xspeed = 0
    yspeed = 0
    damping = (0.9 + random(0.06))
    gravityy = 0.8
    if instance_exists(obj_levelstyler_underwater)
    {
        damping *= 0.9
        gravityy = 0.1
    }
    size_multi = (0.9 + random(0.08))
    image_angle = random(360)
    blend = 0
    blendspeed = (0.01 + random(0.03))
    xprevious2 = x
    yprevious2 = y
    time = 0
    bubbletime = (10 + random(20))
    frozen = 0
    if(global.setting_blood_mode == 1){
        image_blend = merge_color(c_red, c_black, random(0.4))
    } else {
        image_blend = merge_color(obj_levelstyler.col_snail_death, c_black, random(0.4))
    }
} else {
    started_with_blood_mode = false
    #orig#()
}