if(global.setting_player_trail == -1){
    col_player_trail_idk = obj_levelstyler.col_player_trail
} else {
    col_player_trail_idk = global.setting_player_trail
}
vspeed = (-random(3))
image_speed = 0
image_index = random(100000)
col_random = make_color_hsv(random(255), random(255), random(255))
image_blend = merge_color(col_player_trail_idk, col_random, random(0.1))
image_angle = random(360)
