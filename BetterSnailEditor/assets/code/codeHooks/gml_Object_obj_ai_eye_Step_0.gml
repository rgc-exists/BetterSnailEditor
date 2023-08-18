if(room != level_editor){
    #orig#()
} else {
    targetx = 0
    targety = 0
    eyeCenterX = ((xbrowT + xbrowB) * 0.5)
    eyeCenterY = ((ybrowT + ybrowB) * 0.5)
    if (eye == 1)
    {
        targetx = airef.target_eye_01_x
        targety = airef.target_eye_01_y
        x = lerp(x, targetx, 0.12)
        y = lerp(y, targety, 0.06)
    }
    else
    {
        targetx = airef.target_eye_02_x
        targety = airef.target_eye_02_y
        x = lerp(x, targetx, 0.06)
        y = lerp(y, targety, 0.12)
    }
    lookX_pxOffset *= 0.95
    lookY_pxOffset *= 0.95
    airef_mood = airef.mood
    if (!global.setting_squid_facial_expressions)
        airef_mood = 0
    sprite_index = spr_eye_px_neutral_b
    image_angle = airef.image_angle
    lerpspeed = 0.1
    lookX = ((global.input_virtualmouse_notgui_x - eyeCenterX) / 300)
    lookY = ((global.input_virtualmouse_notgui_y - eyeCenterY) / 300)
    if (abs(lookX) > 1)
    {
        lookY /= abs(lookX)
        lookX /= abs(lookX)
    }
    if (abs(lookY) > 1)
    {
        lookX /= abs(lookY)
        lookY /= abs(lookY)
    }
    lookX = (((lookX * 0.6) + 1) * 0.5)
    lookY = (((lookY * 0.6) + 1) * 0.5)
    browT_YOff = lerp(browT_YOff, browT_YOff_target, lerpspeed)
    browT_XOff = lerp(browT_XOff, browT_XOff_target, lerpspeed)
    browT_angle = lerp(browT_angle, browT_angle_target, lerpspeed)
    browB_YOff = lerp(browB_YOff, browB_YOff_target, lerpspeed)
    browB_XOff = lerp(browB_XOff, browB_XOff_target, lerpspeed)
    browB_angle = lerp(browB_angle, browB_angle_target, lerpspeed)

}