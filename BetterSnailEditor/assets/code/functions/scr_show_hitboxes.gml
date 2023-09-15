for(var obj_in_list = 0; obj_in_list < ds_list_size(global.li_hitbox_objects); obj_in_list++){
    var o = ds_list_find_value(global.li_hitbox_objects, obj_in_list)
    var sprite = object_get_sprite(o)
    var obj_type = -1;
    var text_to_draw = ""
    var text_size = .6
    for(var t = 0; t < array_length(global.li_solid_objects); t++){
        if(global.li_solid_objects[t] == o){
            obj_type = 0;
            draw_set_color(c_blue)
            break;
        }
    }
    if(object_is_ancestor(o, obj_wall)){
        obj_type = 0;
        draw_set_color(c_blue)
    }
    for(var t = 0; t < array_length(global.li_wireable_objs); t++){
        if(global.li_wireable_objs[t] == o){
            obj_type = 4;
            draw_set_color(c_green)
        }
    }
    if(object_is_ancestor(o, cam_zoom_100)){
        obj_type = 3;
        draw_set_color(c_fuchsia)
        text_to_draw = "ZOOM TRIGGER"
    }
    for(var t = 0; t < array_length(global.li_deadly_objects); t++){
        if(global.li_deadly_objects[t] == o){
            var should_continue = true
            obj_type = 1;
            draw_set_color(c_red)
            break;
        }
    }
    for(var t = 0; t < array_length(global.li_collectible_objects); t++){
        if(global.li_collectible_objects[t] == o){
            text_to_draw = global.li_collectible_object_names[t]
            obj_type = 2;
            draw_set_color(c_yellow)
            text_size = .4
            break;
        }
    }
    for(var t = 0; t < array_length(global.li_trigger_objects); t++){
        if(global.li_trigger_objects[t] == o){
            text_to_draw = global.li_trigger_object_names[t]
            obj_type = 3;
            draw_set_color(c_fuchsia)
            break;
        }
    }
    for(var t = 0; t < array_length(global.li_trigger_objects); t++){
        if(global.li_trigger_objects[t] == o){
            text_to_draw = global.li_trigger_object_names[t]
            obj_type = 3;
            draw_set_color(c_fuchsia)
            break;
        }
    }
    if(o == obj_wall_walkthrough){
        obj_type = 5;
        draw_set_color(c_teal)
        text_to_draw = "FAKE WALL"
        text_size = .4
    }
    if(o == obj_player){
        obj_type = 6;
        draw_set_color(c_white)
    }
    draw_set_alpha(1)
    if(obj_type >= 0){
        for(var obj = 0; obj < instance_number(o); obj++){
            with(instance_find(o, obj)){
                var has_special_mask = false
                for(var s = 0; s < array_length(global.mask_names); s++){
                    //show_message(sprite_get_name(sprite_index) + " == " + global.mask_names[s])
                    if(sprite_get_name(sprite_index) == global.mask_names[s]){
                        if(sprite_exists(global.mask_outlines[s])){
                        has_special_mask = true
                        if(draw_get_color() == c_red){
                            if(o == obj_disco_laser || o = obj_laser_other){
                                if(enabled){
                                    draw_sprite_ext(global.mask_outlines[s], 0, x, y,  (sprite_width) / sprite_get_width(sprite_index), (sprite_height) / sprite_get_height(sprite_index), image_angle, draw_get_color(), 1)  
                                    draw_sprite_ext(global.mask_outlines[s], 0, x + 1, y + 1,  (sprite_width - 1) / sprite_get_width(sprite_index), (sprite_height - 1) / sprite_get_height(sprite_index), image_angle, draw_get_color(), 1)  
                                    draw_sprite_ext(global.mask_outlines[s], 0, x + 2, y + 2, (sprite_width - 2) / sprite_get_width(sprite_index), (sprite_height - 2) / sprite_get_height(sprite_index), image_angle, draw_get_color(), 1)  
                                }   
                            } else {
                                draw_sprite_ext(global.mask_outlines[s], 0, x, y,  (sprite_width) / sprite_get_width(sprite_index), (sprite_height) / sprite_get_height(sprite_index), image_angle, draw_get_color(), 1)  
                                draw_sprite_ext(global.mask_outlines[s], 0, x + 1, y + 1,  (sprite_width - 1) / sprite_get_width(sprite_index), (sprite_height - 1) / sprite_get_height(sprite_index), image_angle, draw_get_color(), 1)  
                                draw_sprite_ext(global.mask_outlines[s], 0, x + 2, y + 2, (sprite_width - 2) / sprite_get_width(sprite_index), (sprite_height - 2) / sprite_get_height(sprite_index), image_angle, draw_get_color(), 1)  
                                
                            }
                        }
                        if(draw_get_color() == c_blue){
                            draw_sprite_ext(global.mask_outlines[s], 0, x + 1, y + 1,  (sprite_width - 1) / sprite_get_width(sprite_index), (sprite_height - 1) / sprite_get_height(sprite_index), image_angle, draw_get_color(), 1)  
                            draw_sprite_ext(global.mask_outlines[s], 0, x + 2, y + 2, (sprite_width - 2) / sprite_get_width(sprite_index), (sprite_height - 2) / sprite_get_height(sprite_index), image_angle, draw_get_color(), 1)  
                        }
                        break;
                        }
                    }
                }
                if(!has_special_mask && obj_type >= 0){
                    if(draw_get_color() == c_red){
                        if(o == obj_disco_laser || o = obj_laser_other){
                            if(enabled){
                                draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
                                draw_rectangle(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom - 1, true)
                            }
                        } else {
                            draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
                            draw_rectangle(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom - 1, true)
                        }
                    }
                    if(draw_get_color() == c_blue){
                        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
                        for(var thickness = 1; thickness < 4; thickness++){
                            draw_rectangle(bbox_left + thickness, bbox_top + thickness, bbox_right - thickness, bbox_bottom - thickness, true)
                        }
                    }
                    if(draw_get_color() == c_teal){
                        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
                        for(var thickness = 1; thickness < 10; thickness++){
                            draw_rectangle(bbox_left + thickness, bbox_top + thickness, bbox_right - thickness, bbox_bottom - thickness, true)
                        }
                    }
                }
                if(text_to_draw == "ZOOM TRIGGER"){
                    text_to_draw += "\n" + string(zoom * 100) + "%"
                }
                if(text_to_draw == "VOICELINE TRIGGER"){
                    text_to_draw += "\n" + object_get_name(object_index)
                }
                draw_set_halign(fa_left)
                draw_set_valign(fa_top)
                draw_set_font(global.font_aiTalk)
                draw_text_ext_transformed(x - sprite_get_xoffset(sprite_index), y - sprite_get_yoffset(sprite_index), text_to_draw, 35, sprite_width, text_size, text_size, 0)
            }
        }
    }
}