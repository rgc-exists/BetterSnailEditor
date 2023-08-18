if(global.setting_funny_squid){
    time++
    image_blend = airef.image_blend
    image_alpha = ((airef.image_alpha * global.setting_squid_opacity) * airef.level_based_opacity_multiplyer)
    if (image_alpha <= 0)
    {
        return false;
    }
    brow_angleT = (image_angle + browT_angle)
    xbrowT = ((x + lengthdir_x((browT_YOff * image_xscale), (image_angle - 90))) + lengthdir_x((browT_XOff * image_xscale), image_angle))
    ybrowT = ((y + lengthdir_y((browT_YOff * image_xscale), (image_angle - 90))) + lengthdir_y((browT_XOff * image_xscale), image_angle))
    brow_angleB = (image_angle + browB_angle)
    xbrowB = ((x + lengthdir_x((browB_YOff * image_xscale), (image_angle - 90))) + lengthdir_x((browB_XOff * image_xscale), image_angle))
    ybrowB = ((y + lengthdir_y((browB_YOff * image_xscale), (image_angle - 90))) + lengthdir_y((browB_XOff * image_xscale), image_angle))
    if ((time / 4) == round((time / 4)))
    {
        browsize = (image_xscale * 13)
        b1x = (xbrowT + lengthdir_x(browsize, (brow_angleT + 180)))
        b1y = (ybrowT + lengthdir_y(browsize, (brow_angleT + 180)))
        b2x = (xbrowT + lengthdir_x(browsize, brow_angleT))
        b2y = (ybrowT + lengthdir_y(browsize, brow_angleT))
        b3x = (xbrowB + lengthdir_x(browsize, (brow_angleB + 180)))
        b3y = (ybrowB + lengthdir_y(browsize, (brow_angleB + 180)))
        b4x = (xbrowB + lengthdir_x(browsize, brow_angleB))
        b4y = (ybrowB + lengthdir_y(browsize, brow_angleB))
        pupil_want_x = (lerp(lerp(b1x, b2x, lookX), lerp(b3x, b4x, lookX), lookY) - x)
        pupil_want_y = (lerp(lerp(b1y, b3y, lookY), lerp(b2y, b4y, lookY), lookX) - y)
        pupil_x = lerp(pupil_x, pupil_want_x, 0.2)
        pupil_y = lerp(pupil_y, pupil_want_y, 0.2)
    }
    draw_sprite_ext(spr_pupil_pixeled_b, (time / 4), ((x + pupil_x) + lookX_pxOffset), ((y + pupil_y) + lookY_pxOffset), image_xscale, image_yscale, image_angle, image_blend, image_alpha)
} else {
    #orig#()
}