if(place_meeting(mouse_x, mouse_y, id) and mouse_check_button_pressed(mb_left)){
    isOn = !isOn
}
if(isOn){
    draw_set_color(c_black)
    draw_rectangle(x, y, x + 50, y + 50, false)
    draw_set_color(c_dkgray)
    draw_rectangle(x, y, x + 50, y + 50, true)
} else {
    draw_set_color(c_ltgray)
    draw_rectangle(x, y, x + 50, y + 50, false)
    draw_set_color(c_dkgray)
    draw_rectangle(x, y, x + 50, y + 50, true)
}