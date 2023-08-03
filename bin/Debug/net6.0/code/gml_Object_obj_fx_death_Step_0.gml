if(started_with_blood_mode){
    if (!place_free(x, y))
        frozen = 1
    else
    {
        if frozen
            instance_destroy()
        frozen = 0
    }
    if (!frozen)
    {
        xmerk = x
        ymerk = y
        current_dir = point_direction(0, 0, xspeed, yspeed)
        current_speed = point_distance(0, 0, xspeed, yspeed)
        scr_colgrid_point_move_contact(current_dir, current_speed)
        hspeed = xspeed
        vspeed = yspeed
        speed *= damping
        xspeed = hspeed
        yspeed = vspeed
        speed = 0
        yspeed += gravityy
        blend += blendspeed
    }
    time++
} else {
    #orig#()
}