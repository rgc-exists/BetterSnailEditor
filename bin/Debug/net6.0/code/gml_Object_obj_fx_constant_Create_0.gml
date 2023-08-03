if(global.setting_player_trail == -1){
    col_player_trail_idk = obj_levelstyler.col_player_trail
} else {
    col_player_trail_idk = global.setting_player_trail
}
image_xscale = 1
image_yscale = 1
image_speed = 0
image_index = random(100000)
col_random = make_color_hsv(random(255), random(255), random(255))
image_blend = col_player_trail_idk
image_angle = random(360)
direction = random(360)
speed = random(0.5)
