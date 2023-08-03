if(!variable_instance_exists(id, "movedir")){
    movedir = choose(1, 0, -1)
}
if (random(1) < 0.05)
    movedir = choose(1, 0, -1)
scr_move_like_a_snail(movedir, random(1) < 0.07, 1, 1)
if (hspeed > 0)
    lookdir = 1
if (hspeed < 0)
    lookdir = -1
if (speed == 0)
    image_speed = 0
else
    image_speed = -1
