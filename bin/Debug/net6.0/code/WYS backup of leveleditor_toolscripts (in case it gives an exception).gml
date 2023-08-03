function toolrotate_90degrees(argument0, argument1) //gml_Script_toolrotate_90degrees
{
    if (argument1 == 0)
    {
    }
    argument0.image_angle -= (round(argument1) * 90)
    while (argument0.image_angle >= 360)
        argument0.image_angle -= 360
    while (argument0.image_angle < 0)
        argument0.image_angle += 360
    sound = audio_play_sound(sou_teleport_e, 0.9, false)
    audio_sound_gain(sound, 0.15, 0)
    audio_sound_pitch(sound, ((4 + random(0.5)) + (sign(argument1) * 0.8)))
}

function toolrotate_90exclusive(argument0, argument1) //gml_Script_toolrotate_90exclusive
{
    if (argument1 == 0)
    {
    }
    argument0.image_angle = (argument0.image_angle == 0 ? 90 : 0)
    sound = audio_play_sound(sou_teleport_e, 0.9, false)
    audio_sound_gain(sound, 0.15, 0)
    audio_sound_pitch(sound, ((4 + random(0.5)) + (sign(argument1) * 0.8)))
}

function toolrotate_30degrees(argument0, argument1) //gml_Script_toolrotate_30degrees
{
    if (argument1 == 0)
    {
    }
    argument0.image_angle -= (round(argument1) * 30)
    while (argument0.image_angle >= 360)
        argument0.image_angle -= 360
    while (argument0.image_angle < 0)
        argument0.image_angle += 360
    sound = audio_play_sound(sou_teleport_e, 0.9, false)
    audio_sound_gain(sound, 0.15, 0)
    audio_sound_pitch(sound, ((4 + random(0.5)) + (sign(argument1) * 0.8)))
}

function toolrotate_flip_horizontal(argument0, argument1) //gml_Script_toolrotate_flip_horizontal
{
    if (argument1 == 0)
    {
    }
    argument0.image_xscale = (-argument0.image_xscale)
    sound = audio_play_sound(sou_teleport_e, 0.9, false)
    audio_sound_gain(sound, 0.15, 0)
    audio_sound_pitch(sound, (4 + random(0.5)))
}

function toolrotate_flip_vertical(argument0, argument1) //gml_Script_toolrotate_flip_vertical
{
    if (argument1 == 0)
    {
    }
    argument0.image_yscale = (-argument0.image_yscale)
    sound = audio_play_sound(sou_teleport_e, 0.9, false)
    audio_sound_gain(sound, 0.15, 0)
    audio_sound_pitch(sound, (4 + random(0.5)))
}

function toolrotate_property(argument0, argument1, argument2) //gml_Script_toolrotate_property
{
    if (argument1 == 0)
    {
    }
    var ts = ds_map_find_value(argument0.ds_map_tool_properties, argument2)
    var tempval = (ts.value + round(argument1))
    if variable_struct_exists(ts, "f_scroll_steps")
        tempval = (ts.value + (round(argument1) * ts.f_scroll_steps))
    if (tempval > ts.value_max)
        tempval = ts.value_min
    if (tempval < ts.value_min)
        tempval = ts.value_max
    ts.value = tempval
    sound = audio_play_sound(sou_teleport_e, 0.9, false)
    audio_sound_gain(sound, 0.15, 0)
    audio_sound_pitch(sound, (4 + random(0.5)))
}

function toolrotate_sprite(argument0, argument1) //gml_Script_toolrotate_sprite
{
    if (argument1 == 0)
    {
    }
    ts = ds_map_find_value(argument0.ds_map_tool_properties, "tex")
    tempval = (ts.value + round(argument1))
    if variable_struct_exists(ts, "f_scroll_steps")
        tempval = (ts.value + (round(argument1) * ts.f_scroll_steps))
    if (tempval > ts.value_max)
        tempval = ts.value_min
    if (tempval < ts.value_min)
        tempval = ts.value_max
    ts.value = tempval
    argument0.preview_sprite_index = script_execute(ts.array_sprite_picking_functions[tempval], 1)
    argument0.preview_sprite_index_once_placed = script_execute(ts.array_sprite_picking_functions[tempval], 1)
    sound = audio_play_sound(sou_teleport_e, 0.9, false)
    audio_sound_gain(sound, 0.15, 0)
    audio_sound_pitch(sound, (4 + random(0.5)))
}

function toolrotate_impossible(argument0, argument1) //gml_Script_toolrotate_impossible
{
    if (argument1 == 0)
        return;
    sound = audio_play_sound(sou_order_beep, 0.7, false)
    audio_sound_gain(sound, 0.6, 0)
    audio_sound_pitch(sound, (1 + random(0.2)))
}

function toolplace_nothing_happens(argument0, argument1) //gml_Script_toolplace_nothing_happens
{
    return 0;
}

function toolplace_fill_with_blocks(argument0, argument1) //gml_Script_toolplace_fill_with_blocks
{
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step(argument0, 4, 16777215, 108, 1.3, 0.1)
            break
        case 4:
            hlp_show_placement_preview(argument0)
            break
        case 2:
            mouse_drag_box_xmin = min(mouse_drag_box_start_x, mouse_drag_box_current_x)
            mouse_drag_box_xmax = (max(mouse_drag_box_start_x, mouse_drag_box_current_x) + 1)
            mouse_drag_box_ymin = min(mouse_drag_box_start_y, mouse_drag_box_current_y)
            mouse_drag_box_ymax = (max(mouse_drag_box_start_y, mouse_drag_box_current_y) + 1)
            level_bound_x1 = min(level_bound_x1, (mouse_drag_box_xmin * 60))
            level_bound_x2 = max(level_bound_x2, (mouse_drag_box_xmax * 60))
            level_bound_y1 = min(level_bound_y1, (mouse_drag_box_ymin * 60))
            level_bound_y2 = max(level_bound_y2, (mouse_drag_box_ymax * 60))
            xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
            if is_undefined(xoffseet)
                xoffseet = 0
            else
                xoffseet = xoffseet.value
            yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
            if is_undefined(yoffseet)
                yoffseet = 0
            else
                yoffseet = yoffseet.value
            li_objects_in_box = ds_list_create()
            collision_rectangle_list((((mouse_drag_box_xmin * 60) + 2) + xoffseet), (((mouse_drag_box_ymin * 60) + 2) + yoffseet), (((mouse_drag_box_xmax * 60) - 2) + xoffseet), (((mouse_drag_box_ymax * 60) - 2) + yoffseet), argument0.object_index_in_editor, 1, 1, li_objects_in_box, 0)
            var x1 = ((mouse_drag_box_xmin * 60) + xoffseet)
            var y1 = ((mouse_drag_box_ymin * 60) + yoffseet)
            var x2 = ((mouse_drag_box_xmax * 60) + xoffseet)
            var y2 = ((mouse_drag_box_ymax * 60) + yoffseet)
            on_area_spawn_fx(x1, y1, x2, y2)
            for (xxplace = mouse_drag_box_xmin; xxplace < mouse_drag_box_xmax; xxplace++)
            {
                for (yyplace = mouse_drag_box_ymin; yyplace < mouse_drag_box_ymax; yyplace++)
                {
                    created_inst_x = ((xxplace * 60) + 30)
                    created_inst_y = ((yyplace * 60) + 30)
                    quicktool_sprite = argument0.preview_sprite_index_once_placed
                    img_angle = argument0.image_angle
                    img_xscale = argument0.image_xscale
                    img_yscale = argument0.image_yscale
                    img_pivot_x = ((sprite_get_xoffset(quicktool_sprite) - argument0.placement_offset_x) * img_xscale)
                    img_pivot_y = ((sprite_get_yoffset(quicktool_sprite) - argument0.placement_offset_y) * img_yscale)
                    img_size_w = (sprite_get_width(quicktool_sprite) * img_xscale)
                    img_size_h = (sprite_get_height(quicktool_sprite) * img_yscale)
                    xplus = (((-img_size_w) * 0.5) + img_pivot_x)
                    yplus = (((-img_size_h) * 0.5) + img_pivot_y)
                    created_inst_x += ((lengthdir_x(xplus, img_angle) - lengthdir_y(yplus, img_angle)) + xoffseet)
                    created_inst_y += ((lengthdir_y(xplus, img_angle) + lengthdir_x(yplus, img_angle)) + yoffseet)
                    tool_id = argument0.custom_tool_or_object_id
                    canbuild = 1
                    indx = 0
                    while (indx < ds_list_size(li_objects_in_box))
                    {
                        inst_check = ds_list_find_value(li_objects_in_box, indx)
                        if (inst_check.sprite_index != quicktool_sprite)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.x != created_inst_x)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.y != created_inst_y)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.image_angle != img_angle)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.image_xscale != img_xscale)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.image_yscale != img_yscale)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.toolStruct != argument0)
                        {
                            indx++
                            continue
                        }
                        else
                        {
                            canbuild = 0
                            break
                        }
                    }
                    if (!canbuild)
                    {
                    }
                    else
                    {
                        created_inst = instance_create_layer(created_inst_x, created_inst_y, argument0.preview_layer, argument0.object_index_in_editor)
                        created_inst.sprite_index = argument0.preview_sprite_index_once_placed
                        created_inst.image_index = argument0.preview_image_index
                        created_inst.image_blend = argument0.preview_color
                        created_inst.image_angle = img_angle
                        created_inst.image_xscale = img_xscale
                        created_inst.image_yscale = img_yscale
                        created_inst.toolStruct = argument0
                        ds_list_add(argument0.li_placed_instances, created_inst)
                        hlp_copy_tool_properties_to_newly_created_obj(argument0, created_inst)
                        call_after_initializing_new_level_editor_object(created_inst)
                    }
                }
            }
            ds_list_destroy(li_objects_in_box)
            break
    }

    return 1;
}

function on_area_delete_fx(argument0, argument1, argument2, argument3) //gml_Script_on_area_delete_fx
{
    repeat round((abs((argument3 - argument1)) / 10))
        part_particles_create(global.part_sys_fx, choose(argument0, argument2), lerp(argument1, argument3, random(1)), global.part_type_LvlEditDestroy, 1)
    repeat round((abs((argument2 - argument0)) / 10))
        part_particles_create(global.part_sys_fx, lerp(argument0, argument2, random(1)), choose(argument1, argument3), global.part_type_LvlEditDestroy, 1)
}

function on_area_spawn_fx(argument0, argument1, argument2, argument3) //gml_Script_on_area_spawn_fx
{
    repeat round((abs((argument3 - argument1)) / 10))
        part_particles_create(global.part_sys_fx, choose(argument0, argument2), lerp(argument1, argument3, random(1)), global.part_type_LvlEditCreate, 1)
    repeat round((abs((argument2 - argument0)) / 10))
        part_particles_create(global.part_sys_fx, lerp(argument0, argument2, random(1)), choose(argument1, argument3), global.part_type_LvlEditCreate, 1)
}

function toolplace_fill_with_wall_blocks(argument0, argument1) //gml_Script_toolplace_fill_with_wall_blocks
{
    temp_max_wall_size = ds_map_find_value(argument0.ds_map_tool_properties, "blsi")
    if is_undefined(temp_max_wall_size)
        temp_max_wall_size = 3
    else
        temp_max_wall_size = temp_max_wall_size.value
    if (temp_max_wall_size == 0)
        temp_max_wall_size = 1000000
    return toolplace_fill_with_wall_blocks_hlp(argument0, argument1, temp_max_wall_size);
}

function toolplace_fill_with_wall_blocks_noszielimit(argument0, argument1) //gml_Script_toolplace_fill_with_wall_blocks_noszielimit
{
    return toolplace_fill_with_wall_blocks_hlp(argument0, argument1, 1000000);
}

function toolplace_fill_with_wall_blocks_hlp(argument0, argument1, argument2) //gml_Script_toolplace_fill_with_wall_blocks_hlp
{
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step(argument0, 4, 16777215, 108, 1.3, 0.1)
            break
        case 4:
            hlp_show_placement_preview(argument0)
            break
        case 2:
            mouse_drag_box_xmin = min(mouse_drag_box_start_x, mouse_drag_box_current_x)
            mouse_drag_box_xmax = (max(mouse_drag_box_start_x, mouse_drag_box_current_x) + 1)
            mouse_drag_box_ymin = min(mouse_drag_box_start_y, mouse_drag_box_current_y)
            mouse_drag_box_ymax = (max(mouse_drag_box_start_y, mouse_drag_box_current_y) + 1)
            level_bound_x1 = min(level_bound_x1, (mouse_drag_box_xmin * 60))
            level_bound_x2 = max(level_bound_x2, (mouse_drag_box_xmax * 60))
            level_bound_y1 = min(level_bound_y1, (mouse_drag_box_ymin * 60))
            level_bound_y2 = max(level_bound_y2, (mouse_drag_box_ymax * 60))
            x1 = ((mouse_drag_box_xmin * 60) + xoffseet)
            y1 = ((mouse_drag_box_ymin * 60) + yoffseet)
            x2 = ((mouse_drag_box_xmax * 60) + xoffseet)
            y2 = ((mouse_drag_box_ymax * 60) + yoffseet)
            on_area_spawn_fx(x1, y1, x2, y2)
            li_objects_in_box = ds_list_create()
            collision_rectangle_list(((mouse_drag_box_xmin * 60) + 2), ((mouse_drag_box_ymin * 60) + 2), ((mouse_drag_box_xmax * 60) - 2), ((mouse_drag_box_ymax * 60) - 2), argument0.object_index_in_editor, 1, 1, li_objects_in_box, 0)
            for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
            {
                inst_check = ds_list_find_value(li_objects_in_box, indx)
                hlp_destoy_wall_block_full_or_partially(inst_check, (mouse_drag_box_xmin * 60), (mouse_drag_box_ymin * 60), (mouse_drag_box_xmax * 60), (mouse_drag_box_ymax * 60))
            }
            ds_list_destroy(li_objects_in_box)
            li_blocks_that_are_too_big = ds_list_create()
            created_inst = instance_create_layer((mouse_drag_box_xmin * 60), (mouse_drag_box_ymin * 60), argument0.preview_layer, argument0.object_index_in_editor)
            created_inst.sprite_index = argument0.preview_sprite_index_once_placed
            created_inst.image_index = argument0.preview_image_index
            created_inst.image_blend = argument0.preview_color
            created_inst.image_angle = 0
            created_inst.image_xscale = (mouse_drag_box_xmax - mouse_drag_box_xmin)
            created_inst.image_yscale = (mouse_drag_box_ymax - mouse_drag_box_ymin)
            created_inst.toolStruct = argument0
            ds_list_add(argument0.li_placed_instances, created_inst)
            hlp_copy_tool_properties_to_newly_created_obj(argument0, created_inst)
            if (created_inst.image_xscale > argument2 || created_inst.image_yscale > argument2)
                ds_list_add(li_blocks_that_are_too_big, created_inst)
            else
                call_after_initializing_new_level_editor_object(created_inst)
            while (ds_list_size(li_blocks_that_are_too_big) > 0)
            {
                block_to_split = ds_list_find_value(li_blocks_that_are_too_big, 0)
                splitdir = choose(0, 1)
                if (block_to_split.image_yscale <= argument2)
                    splitdir = 0
                if (block_to_split.image_xscale <= argument2)
                    splitdir = 1
                if (splitdir == 0)
                {
                    isplitat = irandom_range(1, (block_to_split.image_xscale - 1))
                    isplit_size_other = (block_to_split.image_xscale - isplitat)
                    block_to_split.image_xscale = isplitat
                    if (block_to_split.image_xscale <= argument2 && block_to_split.image_yscale <= argument2)
                    {
                        call_after_initializing_new_level_editor_object(block_to_split)
                        ds_list_delete(li_blocks_that_are_too_big, 0)
                    }
                    created_inst = instance_create_layer((block_to_split.x + (isplitat * 60)), block_to_split.y, argument0.preview_layer, argument0.object_index_in_editor)
                    created_inst.sprite_index = argument0.preview_sprite_index_once_placed
                    created_inst.image_index = argument0.preview_image_index
                    created_inst.image_blend = argument0.preview_color
                    created_inst.image_angle = 0
                    created_inst.image_xscale = isplit_size_other
                    created_inst.image_yscale = block_to_split.image_yscale
                    created_inst.toolStruct = argument0
                    hlp_copy_tool_properties_to_newly_created_obj(argument0, created_inst)
                    ds_list_add(argument0.li_placed_instances, created_inst)
                    if (created_inst.image_xscale > argument2 || created_inst.image_yscale > argument2)
                        ds_list_add(li_blocks_that_are_too_big, created_inst)
                    else
                        call_after_initializing_new_level_editor_object(created_inst)
                }
                else
                {
                    isplitat = irandom_range(1, (block_to_split.image_yscale - 1))
                    isplit_size_other = (block_to_split.image_yscale - isplitat)
                    block_to_split.image_yscale = isplitat
                    if (block_to_split.image_xscale <= argument2 && block_to_split.image_yscale <= argument2)
                    {
                        call_after_initializing_new_level_editor_object(block_to_split)
                        ds_list_delete(li_blocks_that_are_too_big, 0)
                    }
                    created_inst = instance_create_layer(block_to_split.x, (block_to_split.y + (isplitat * 60)), argument0.preview_layer, argument0.object_index_in_editor)
                    created_inst.sprite_index = argument0.preview_sprite_index_once_placed
                    created_inst.image_index = argument0.preview_image_index
                    created_inst.image_blend = argument0.preview_color
                    created_inst.image_angle = 0
                    created_inst.image_xscale = block_to_split.image_xscale
                    created_inst.image_yscale = isplit_size_other
                    created_inst.toolStruct = argument0
                    hlp_copy_tool_properties_to_newly_created_obj(argument0, created_inst)
                    ds_list_add(argument0.li_placed_instances, created_inst)
                    if (created_inst.image_xscale > argument2 || created_inst.image_yscale > argument2)
                        ds_list_add(li_blocks_that_are_too_big, created_inst)
                    else
                        call_after_initializing_new_level_editor_object(created_inst)
                }
            }
            ds_list_destroy(li_blocks_that_are_too_big)
            break
    }

    return 1;
}

function toolplace_singleton_placement(argument0, argument1) //gml_Script_toolplace_singleton_placement
{
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step_one_by_one(argument0, 4, 16777215, 108, 1.3, 0.1)
            break
        case 4:
            hlp_show_placement_preview(argument0)
            break
        case 2:
            while (ds_list_size(argument0.li_placed_instances) > 0)
                instance_destroy(ds_list_find_value(argument0.li_placed_instances, 0))
            created_inst_x = ((mouse_drag_box_current_x * 60) + 30)
            created_inst_y = ((mouse_drag_box_current_y * 60) + 30)
            quicktool_sprite = argument0.preview_sprite_index_once_placed
            img_angle = argument0.image_angle
            img_xscale = argument0.image_xscale
            img_yscale = argument0.image_yscale
            img_pivot_x = ((sprite_get_xoffset(quicktool_sprite) - argument0.placement_offset_x) * img_xscale)
            img_pivot_y = ((sprite_get_yoffset(quicktool_sprite) - argument0.placement_offset_y) * img_yscale)
            img_size_w = (sprite_get_width(quicktool_sprite) * img_xscale)
            img_size_h = (sprite_get_height(quicktool_sprite) * img_yscale)
            xplus = (((-img_size_w) * 0.5) + img_pivot_x)
            yplus = (((-img_size_h) * 0.5) + img_pivot_y)
            created_inst_x += (lengthdir_x(xplus, img_angle) - lengthdir_y(yplus, img_angle))
            created_inst_y += (lengthdir_y(xplus, img_angle) + lengthdir_x(yplus, img_angle))
            tool_id = argument0.custom_tool_or_object_id
            xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
            if is_undefined(xoffseet)
                xoffseet = 0
            else
                xoffseet = xoffseet.value
            yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
            if is_undefined(yoffseet)
                yoffseet = 0
            else
                yoffseet = yoffseet.value
            mouse_drag_box_xmin = mouse_drag_box_current_x
            mouse_drag_box_xmax = mouse_drag_box_current_x
            mouse_drag_box_ymin = mouse_drag_box_current_y
            mouse_drag_box_ymax = mouse_drag_box_current_y
            x1 = ((mouse_drag_box_xmin * 60) + xoffseet)
            y1 = ((mouse_drag_box_ymin * 60) + yoffseet)
            x2 = ((mouse_drag_box_xmax * 60) + xoffseet)
            y2 = ((mouse_drag_box_ymax * 60) + yoffseet)
            on_area_spawn_fx(x1, y1, x2, y2)
            created_inst = instance_create_layer((created_inst_x + xoffseet), (created_inst_y + yoffseet), argument0.preview_layer, argument0.object_index_in_editor)
            created_inst.sprite_index = argument0.preview_sprite_index_once_placed
            created_inst.image_index = argument0.preview_image_index
            created_inst.image_blend = argument0.preview_color
            created_inst.image_angle = img_angle
            created_inst.image_xscale = img_xscale
            created_inst.image_yscale = img_yscale
            created_inst.toolStruct = argument0
            ds_list_add(argument0.li_placed_instances, created_inst)
            hlp_copy_tool_properties_to_newly_created_obj(argument0, created_inst)
            call_after_initializing_new_level_editor_object(created_inst)
            level_bound_x1 = min(level_bound_x1, (mouse_drag_box_current_x * 60))
            level_bound_x2 = max(level_bound_x2, (mouse_drag_box_current_x * 60))
            level_bound_y1 = min(level_bound_y1, (mouse_drag_box_current_y * 60))
            level_bound_y2 = max(level_bound_y2, (mouse_drag_box_current_y * 60))
            break
    }

    return 1;
}

function toolplace_one_at_a_time_placement(argument0, argument1) //gml_Script_toolplace_one_at_a_time_placement
{
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step_one_by_one(argument0, 4, 16777215, 108, 1.3, 0.1)
            break
        case 4:
            hlp_show_placement_preview(argument0)
            break
        case 2:
            created_inst_x = ((mouse_drag_box_current_x * 60) + 30)
            created_inst_y = ((mouse_drag_box_current_y * 60) + 30)
            quicktool_sprite = argument0.preview_sprite_index_once_placed
            img_angle = argument0.image_angle
            img_xscale = argument0.image_xscale
            img_yscale = argument0.image_yscale
            img_pivot_x = ((sprite_get_xoffset(quicktool_sprite) - argument0.placement_offset_x) * img_xscale)
            img_pivot_y = ((sprite_get_yoffset(quicktool_sprite) - argument0.placement_offset_y) * img_yscale)
            img_size_w = (sprite_get_width(quicktool_sprite) * img_xscale)
            img_size_h = (sprite_get_height(quicktool_sprite) * img_yscale)
            xplus = (((-img_size_w) * 0.5) + img_pivot_x)
            yplus = (((-img_size_h) * 0.5) + img_pivot_y)
            created_inst_x += (lengthdir_x(xplus, img_angle) - lengthdir_y(yplus, img_angle))
            created_inst_y += (lengthdir_y(xplus, img_angle) + lengthdir_x(yplus, img_angle))
            tool_id = argument0.custom_tool_or_object_id
            xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
            if is_undefined(xoffseet)
                xoffseet = 0
            else
                xoffseet = xoffseet.value
            yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
            if is_undefined(yoffseet)
                yoffseet = 0
            else
                yoffseet = yoffseet.value
            mouse_drag_box_xmin = mouse_drag_box_current_x
            mouse_drag_box_xmax = mouse_drag_box_current_x
            mouse_drag_box_ymin = mouse_drag_box_current_y
            mouse_drag_box_ymax = mouse_drag_box_current_y
            x1 = ((mouse_drag_box_xmin * 60) + xoffseet)
            y1 = ((mouse_drag_box_ymin * 60) + yoffseet)
            x2 = ((mouse_drag_box_xmax * 60) + xoffseet)
            y2 = ((mouse_drag_box_ymax * 60) + yoffseet)
            on_area_spawn_fx(x1, y1, x2, y2)
            created_inst = instance_create_layer((created_inst_x + xoffseet), (created_inst_y + yoffseet), argument0.preview_layer, argument0.object_index_in_editor)
            created_inst.sprite_index = argument0.preview_sprite_index_once_placed
            created_inst.image_index = argument0.preview_image_index
            created_inst.image_blend = argument0.preview_color
            created_inst.image_angle = img_angle
            created_inst.image_xscale = img_xscale
            created_inst.image_yscale = img_yscale
            created_inst.toolStruct = argument0
            ds_list_add(argument0.li_placed_instances, created_inst)
            hlp_copy_tool_properties_to_newly_created_obj(argument0, created_inst)
            call_after_initializing_new_level_editor_object(created_inst)
            break
    }

    return 1;
}

function toolplace_path_placement(argument0, argument1) //gml_Script_toolplace_path_placement
{
    xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff").value
    yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff").value
    var mouse_drag_box_current_x = (floor((global.cursor_in_level_x / 60)) + 0.5)
    var mouse_drag_box_current_y = (floor((global.cursor_in_level_y / 60)) + 0.5)
    var end_path = noone
    var cur_path_id = argument0.tool_properties[1].value
    var i = 0
    while (i < ds_list_size(argument0.li_placed_instances))
    {
        var path_inst = ds_list_find_value(argument0.li_placed_instances, i)
        if (path_inst.path_id == cur_path_id)
        {
            if (path_inst.index == (ds_list_size(global.lvl_paths[cur_path_id]) - 1))
            {
                end_path = path_inst
                break
            }
            else
            {
                i++
                continue
            }
        }
        else
        {
            i++
            continue
        }
    }
    if (instance_exists(end_path) && argument1 == obj_lvlobj_musicTrigger)
        scr_draw_line_sprite(end_path.x, end_path.y, ((mouse_drag_box_current_x * 60) + xoffseet), ((mouse_drag_box_current_y * 60) + yoffseet), 4, c_white)
    return toolplace_one_at_a_time_placement(argument0, argument1);
}

function toolplace_fill_with_stripes(argument0, argument1) //gml_Script_toolplace_fill_with_stripes
{
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step(argument0, 4, 16777215, 108, 1.3, 0.1)
            break
        case 4:
            hlp_show_placement_preview(argument0)
            break
        case 2:
            mouse_drag_box_xmin = min(mouse_drag_box_start_x, mouse_drag_box_current_x)
            mouse_drag_box_xmax = (max(mouse_drag_box_start_x, mouse_drag_box_current_x) + 1)
            mouse_drag_box_ymin = min(mouse_drag_box_start_y, mouse_drag_box_current_y)
            mouse_drag_box_ymax = (max(mouse_drag_box_start_y, mouse_drag_box_current_y) + 1)
            level_bound_x1 = min(level_bound_x1, (mouse_drag_box_xmin * 60))
            level_bound_x2 = max(level_bound_x2, (mouse_drag_box_xmax * 60))
            level_bound_y1 = min(level_bound_y1, (mouse_drag_box_ymin * 60))
            level_bound_y2 = max(level_bound_y2, (mouse_drag_box_ymax * 60))
            xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
            if is_undefined(xoffseet)
                xoffseet = 0
            else
                xoffseet = xoffseet.value
            yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
            if is_undefined(yoffseet)
                yoffseet = 0
            else
                yoffseet = yoffseet.value
            x1 = ((mouse_drag_box_xmin * 60) + xoffseet)
            y1 = ((mouse_drag_box_ymin * 60) + yoffseet)
            x2 = ((mouse_drag_box_xmax * 60) + xoffseet)
            y2 = ((mouse_drag_box_ymax * 60) + yoffseet)
            on_area_spawn_fx(x1, y1, x2, y2)
            li_objects_in_box = ds_list_create()
            collision_rectangle_list((((mouse_drag_box_xmin * 60) + 2) + xoffseet), (((mouse_drag_box_ymin * 60) + 2) + yoffseet), (((mouse_drag_box_xmax * 60) - 2) + xoffseet), (((mouse_drag_box_ymax * 60) - 2) + yoffseet), argument0.object_index_in_editor, 1, 1, li_objects_in_box, 0)
            if (argument0.image_angle == 0 || argument0.image_angle == 180)
            {
                for (xxplace = mouse_drag_box_xmin; xxplace < mouse_drag_box_xmax; xxplace++)
                {
                    created_inst_x = ((xxplace * 60) + 30)
                    created_inst_y = ((mouse_drag_box_ymin + mouse_drag_box_ymax) * 30)
                    quicktool_sprite = argument0.preview_sprite_index_once_placed
                    img_angle = argument0.image_angle
                    img_xscale = 1
                    img_yscale = (mouse_drag_box_ymax - mouse_drag_box_ymin)
                    img_pivot_x = ((sprite_get_xoffset(quicktool_sprite) - argument0.placement_offset_x) * img_xscale)
                    img_pivot_y = ((sprite_get_yoffset(quicktool_sprite) - argument0.placement_offset_y) * img_yscale)
                    img_size_w = (sprite_get_width(quicktool_sprite) * img_xscale)
                    img_size_h = (sprite_get_height(quicktool_sprite) * img_yscale)
                    xplus = (((-img_size_w) * 0.5) + img_pivot_x)
                    yplus = (((-img_size_h) * 0.5) + img_pivot_y)
                    created_inst_x += ((lengthdir_x(xplus, img_angle) - lengthdir_y(yplus, img_angle)) + xoffseet)
                    created_inst_y += ((lengthdir_y(xplus, img_angle) + lengthdir_x(yplus, img_angle)) + yoffseet)
                    tool_id = argument0.custom_tool_or_object_id
                    canbuild = 1
                    indx = 0
                    while (indx < ds_list_size(li_objects_in_box))
                    {
                        inst_check = ds_list_find_value(li_objects_in_box, indx)
                        if (inst_check.sprite_index != quicktool_sprite)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.x != created_inst_x)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.y != created_inst_y)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.image_angle != img_angle)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.image_xscale != img_xscale)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.image_yscale != img_yscale)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.toolStruct != argument0)
                        {
                            indx++
                            continue
                        }
                        else
                        {
                            canbuild = 0
                            break
                        }
                    }
                    if (!canbuild)
                    {
                    }
                    else
                    {
                        created_inst = instance_create_layer(created_inst_x, created_inst_y, argument0.preview_layer, argument0.object_index_in_editor)
                        created_inst.sprite_index = argument0.preview_sprite_index_once_placed
                        created_inst.image_index = argument0.preview_image_index
                        created_inst.image_blend = argument0.preview_color
                        created_inst.image_angle = img_angle
                        created_inst.image_xscale = img_xscale
                        created_inst.image_yscale = img_yscale
                        created_inst.toolStruct = argument0
                        ds_list_add(argument0.li_placed_instances, created_inst)
                        hlp_copy_tool_properties_to_newly_created_obj(argument0, created_inst)
                        call_after_initializing_new_level_editor_object(created_inst)
                    }
                }
            }
            else if (argument0.image_angle == 90 || argument0.image_angle == 270)
            {
                for (yyplace = mouse_drag_box_ymin; yyplace < mouse_drag_box_ymax; yyplace++)
                {
                    created_inst_x = ((mouse_drag_box_xmin + mouse_drag_box_xmax) * 30)
                    created_inst_y = ((yyplace * 60) + 30)
                    quicktool_sprite = argument0.preview_sprite_index_once_placed
                    img_angle = argument0.image_angle
                    img_xscale = 1
                    img_yscale = (mouse_drag_box_xmax - mouse_drag_box_xmin)
                    img_pivot_x = ((sprite_get_xoffset(quicktool_sprite) - argument0.placement_offset_x) * img_xscale)
                    img_pivot_y = ((sprite_get_yoffset(quicktool_sprite) - argument0.placement_offset_y) * img_yscale)
                    img_size_w = (sprite_get_width(quicktool_sprite) * img_xscale)
                    img_size_h = (sprite_get_height(quicktool_sprite) * img_yscale)
                    xplus = (((-img_size_w) * 0.5) + img_pivot_x)
                    yplus = (((-img_size_h) * 0.5) + img_pivot_y)
                    created_inst_x += ((lengthdir_x(xplus, img_angle) - lengthdir_y(yplus, img_angle)) + xoffseet)
                    created_inst_y += ((lengthdir_y(xplus, img_angle) + lengthdir_x(yplus, img_angle)) + yoffseet)
                    tool_id = argument0.custom_tool_or_object_id
                    canbuild = 1
                    indx = 0
                    while (indx < ds_list_size(li_objects_in_box))
                    {
                        inst_check = ds_list_find_value(li_objects_in_box, indx)
                        if (inst_check.sprite_index != quicktool_sprite)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.x != created_inst_x)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.y != created_inst_y)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.image_angle != img_angle)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.image_xscale != img_xscale)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.image_yscale != img_yscale)
                        {
                            indx++
                            continue
                        }
                        else if (inst_check.toolStruct != argument0)
                        {
                            indx++
                            continue
                        }
                        else
                        {
                            canbuild = 0
                            break
                        }
                    }
                    if (!canbuild)
                    {
                    }
                    else
                    {
                        created_inst = instance_create_layer(created_inst_x, created_inst_y, argument0.preview_layer, argument0.object_index_in_editor)
                        created_inst.sprite_index = argument0.preview_sprite_index_once_placed
                        created_inst.image_index = argument0.preview_image_index
                        created_inst.image_blend = argument0.preview_color
                        created_inst.image_angle = img_angle
                        created_inst.image_xscale = img_xscale
                        created_inst.image_yscale = img_yscale
                        created_inst.toolStruct = argument0
                        ds_list_add(argument0.li_placed_instances, created_inst)
                        hlp_copy_tool_properties_to_newly_created_obj(argument0, created_inst)
                        call_after_initializing_new_level_editor_object(created_inst)
                    }
                }
            }
            ds_list_destroy(li_objects_in_box)
            break
    }

    return 1;
}

function toolplace_delete_blocks_of_same_type(argument0, argument1) //gml_Script_toolplace_delete_blocks_of_same_type
{
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_traps, 301, 0.7, 0.05)
            break
        case 2:
            mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60)
            mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60)
            mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60)
            mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60)
            xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
            if is_undefined(xoffseet)
                xoffseet = 0
            else
                xoffseet = xoffseet.value
            yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
            if is_undefined(yoffseet)
                yoffseet = 0
            else
                yoffseet = yoffseet.value
            li_objects_in_box = ds_list_create()
            collision_rectangle_list(((mouse_drag_box_xmin + 2) + xoffseet), ((mouse_drag_box_ymin + 2) + yoffseet), ((mouse_drag_box_xmax - 2) + xoffseet), ((mouse_drag_box_ymax - 2) + yoffseet), argument0.object_index_in_editor, 1, 1, li_objects_in_box, 0)
            on_area_delete_fx(mouse_drag_box_xmin, mouse_drag_box_ymin, mouse_drag_box_xmax, mouse_drag_box_ymax)
            deleted_at_least_one_obj = 0
            tool_id = argument0.custom_tool_or_object_id
            for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
            {
                inst_check = ds_list_find_value(li_objects_in_box, indx)
                if (inst_check.toolStruct != argument0)
                {
                }
                else
                {
                    deleted_at_least_one_obj = 1
                    if (inst_check.is_wall_like && inst_check.is_wall)
                        hlp_destoy_wall_block_full_or_partially(inst_check, mouse_drag_box_xmin, mouse_drag_box_ymin, mouse_drag_box_xmax, mouse_drag_box_ymax)
                    else
                        instance_destroy(inst_check)
                }
            }
            if deleted_at_least_one_obj
            {
                sound = audio_play_sound(sou_shooter_explosion_03, 0.95, false)
                audio_sound_gain(sound, 0.5, 0)
                audio_sound_pitch(sound, (1 + random(0.4)))
            }
            ds_list_destroy(li_objects_in_box)
            if (collision_rectangle((mouse_drag_box_xmin + 2), (level_bound_y1 - 100), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x2 = min(max((level_bound_x1 + 1920), mouse_drag_box_xmin), level_bound_x2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (mouse_drag_box_xmax - 2), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x1 = max(min((level_bound_x2 - 1920), mouse_drag_box_xmax), level_bound_x1)
            if (collision_rectangle((level_bound_x1 - 100), (mouse_drag_box_ymin + 2), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y2 = min(max((level_bound_y1 + 1080), mouse_drag_box_ymin), level_bound_y2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (level_bound_x2 + 100), (mouse_drag_box_ymax - 2), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y1 = max(min((level_bound_y2 - 1080), mouse_drag_box_ymax), level_bound_y1)
            lvlwire_delete_non_valids()
            break
    }

    return 1;
}

function toolplace_delete_paths_of_same_path_id(argument0, argument1) //gml_Script_toolplace_delete_paths_of_same_path_id
{
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_traps, 301, 0.7, 0.05)
            break
        case 2:
            mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60)
            mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60)
            mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60)
            mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60)
            xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
            if is_undefined(xoffseet)
                xoffseet = 0
            else
                xoffseet = xoffseet.value
            yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
            if is_undefined(yoffseet)
                yoffseet = 0
            else
                yoffseet = yoffseet.value
            li_objects_in_box = ds_list_create()
            collision_rectangle_list(((mouse_drag_box_xmin + 2) + xoffseet), ((mouse_drag_box_ymin + 2) + yoffseet), ((mouse_drag_box_xmax - 2) + xoffseet), ((mouse_drag_box_ymax - 2) + yoffseet), argument0.object_index_in_editor, 1, 1, li_objects_in_box, 0)
            on_area_delete_fx(mouse_drag_box_xmin, mouse_drag_box_ymin, mouse_drag_box_xmax, mouse_drag_box_ymax)
            deleted_at_least_one_obj = 0
            tool_id = argument0.custom_tool_or_object_id
            for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
            {
                inst_check = ds_list_find_value(li_objects_in_box, indx)
                if (inst_check.toolStruct != argument0)
                {
                }
                else if (inst_check.path_id != argument0.tool_properties[1].value)
                {
                }
                else
                {
                    deleted_at_least_one_obj = 1
                    if (inst_check.is_wall_like && inst_check.is_wall)
                        hlp_destoy_wall_block_full_or_partially(inst_check, mouse_drag_box_xmin, mouse_drag_box_ymin, mouse_drag_box_xmax, mouse_drag_box_ymax)
                    else
                        instance_destroy(inst_check)
                }
            }
            if deleted_at_least_one_obj
            {
                sound = audio_play_sound(sou_shooter_explosion_03, 0.95, false)
                audio_sound_gain(sound, 0.5, 0)
                audio_sound_pitch(sound, (1 + random(0.4)))
            }
            ds_list_destroy(li_objects_in_box)
            if (collision_rectangle((mouse_drag_box_xmin + 2), (level_bound_y1 - 100), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x2 = min(max((level_bound_x1 + 1920), mouse_drag_box_xmin), level_bound_x2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (mouse_drag_box_xmax - 2), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x1 = max(min((level_bound_x2 - 1920), mouse_drag_box_xmax), level_bound_x1)
            if (collision_rectangle((level_bound_x1 - 100), (mouse_drag_box_ymin + 2), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y2 = min(max((level_bound_y1 + 1080), mouse_drag_box_ymin), level_bound_y2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (level_bound_x2 + 100), (mouse_drag_box_ymax - 2), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y1 = max(min((level_bound_y2 - 1080), mouse_drag_box_ymax), level_bound_y1)
            lvlwire_delete_non_valids()
            break
    }

    return 1;
}

function toolplace_delete_wall_blocks(argument0, argument1) //gml_Script_toolplace_delete_wall_blocks
{
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_traps, 301, 0.7, 0.05)
            break
        case 2:
            mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60)
            mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60)
            mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60)
            mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60)
            on_area_delete_fx(mouse_drag_box_xmin, mouse_drag_box_ymin, mouse_drag_box_xmax, mouse_drag_box_ymax)
            li_objects_in_box = ds_list_create()
            collision_rectangle_list((mouse_drag_box_xmin + 2), (mouse_drag_box_ymin + 2), (mouse_drag_box_xmax - 2), (mouse_drag_box_ymax - 2), 54, 1, 1, li_objects_in_box, 0)
            collision_rectangle_list((mouse_drag_box_xmin + 2), (mouse_drag_box_ymin + 2), (mouse_drag_box_xmax - 2), (mouse_drag_box_ymax - 2), 397, 1, 1, li_objects_in_box, 0)
            collision_rectangle_list((mouse_drag_box_xmin + 2), (mouse_drag_box_ymin + 2), (mouse_drag_box_xmax - 2), (mouse_drag_box_ymax - 2), 125, 1, 1, li_objects_in_box, 0)
            tool_id = argument0.custom_tool_or_object_id
            for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
            {
                inst_check = ds_list_find_value(li_objects_in_box, indx)
                hlp_destoy_wall_block_full_or_partially(inst_check, mouse_drag_box_xmin, mouse_drag_box_ymin, mouse_drag_box_xmax, mouse_drag_box_ymax)
            }
            if (ds_list_size(li_objects_in_box) > 0)
            {
                sound = audio_play_sound(sou_shooter_explosion_03, 0.95, false)
                audio_sound_gain(sound, 0.5, 0)
                audio_sound_pitch(sound, (1 + random(0.4)))
            }
            ds_list_destroy(li_objects_in_box)
            if (collision_rectangle((mouse_drag_box_xmin + 2), (level_bound_y1 - 100), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x2 = min(max((level_bound_x1 + 1920), mouse_drag_box_xmin), level_bound_x2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (mouse_drag_box_xmax - 2), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x1 = max(min((level_bound_x2 - 1920), mouse_drag_box_xmax), level_bound_x1)
            if (collision_rectangle((level_bound_x1 - 100), (mouse_drag_box_ymin + 2), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y2 = min(max((level_bound_y1 + 1080), mouse_drag_box_ymin), level_bound_y2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (level_bound_x2 + 100), (mouse_drag_box_ymax - 2), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y1 = max(min((level_bound_y2 - 1080), mouse_drag_box_ymax), level_bound_y1)
            lvlwire_delete_non_valids()
            break
    }

    return 1;
}

function toolplace_delete_trigger_blocks_of_same_type(argument0, argument1) //gml_Script_toolplace_delete_trigger_blocks_of_same_type
{
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_traps, 301, 0.7, 0.05)
            break
        case 2:
            mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60)
            mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60)
            mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60)
            mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60)
            on_area_delete_fx(mouse_drag_box_xmin, mouse_drag_box_ymin, mouse_drag_box_xmax, mouse_drag_box_ymax)
            li_objects_in_box = ds_list_create()
            collision_rectangle_list((mouse_drag_box_xmin + 2), (mouse_drag_box_ymin + 2), (mouse_drag_box_xmax - 2), (mouse_drag_box_ymax - 2), argument0.object_index_in_editor, 1, 1, li_objects_in_box, 0)
            tool_id = argument0.custom_tool_or_object_id
            for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
            {
                inst_check = ds_list_find_value(li_objects_in_box, indx)
                hlp_destoy_wall_block_full_or_partially(inst_check, mouse_drag_box_xmin, mouse_drag_box_ymin, mouse_drag_box_xmax, mouse_drag_box_ymax)
            }
            if (ds_list_size(li_objects_in_box) > 0)
            {
                sound = audio_play_sound(sou_shooter_explosion_03, 0.95, false)
                audio_sound_gain(sound, 0.5, 0)
                audio_sound_pitch(sound, (1 + random(0.4)))
            }
            ds_list_destroy(li_objects_in_box)
            if (collision_rectangle((mouse_drag_box_xmin + 2), (level_bound_y1 - 100), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x2 = min(max((level_bound_x1 + 1920), mouse_drag_box_xmin), level_bound_x2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (mouse_drag_box_xmax - 2), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x1 = max(min((level_bound_x2 - 1920), mouse_drag_box_xmax), level_bound_x1)
            if (collision_rectangle((level_bound_x1 - 100), (mouse_drag_box_ymin + 2), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y2 = min(max((level_bound_y1 + 1080), mouse_drag_box_ymin), level_bound_y2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (level_bound_x2 + 100), (mouse_drag_box_ymax - 2), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y1 = max(min((level_bound_y2 - 1080), mouse_drag_box_ymax), level_bound_y1)
            lvlwire_delete_non_valids()
            break
    }

    return 1;
}

function toolplace_delete_blocks_all_in_rect(argument0, argument1) //gml_Script_toolplace_delete_blocks_all_in_rect
{
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_traps, 301, 0.7, 0.05)
            break
        case 2:
            mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60)
            mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60)
            mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60)
            mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60)
            on_area_delete_fx(mouse_drag_box_xmin, mouse_drag_box_ymin, mouse_drag_box_xmax, mouse_drag_box_ymax)
            li_objects_in_box = ds_list_create()
            collision_rectangle_list((mouse_drag_box_xmin + 2), (mouse_drag_box_ymin + 2), (mouse_drag_box_xmax - 2), (mouse_drag_box_ymax - 2), 159, 1, 1, li_objects_in_box, 0)
            for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
            {
                inst_check = ds_list_find_value(li_objects_in_box, indx)
                if inst_check.is_wall_like
                    hlp_destoy_wall_block_full_or_partially(inst_check, mouse_drag_box_xmin, mouse_drag_box_ymin, mouse_drag_box_xmax, mouse_drag_box_ymax)
                else
                    instance_destroy(inst_check)
            }
            if (ds_list_size(li_objects_in_box) > 0)
            {
                sound = audio_play_sound(sou_shooter_explosion_03, 0.95, false)
                audio_sound_gain(sound, 0.5, 0)
                audio_sound_pitch(sound, (1 + random(0.4)))
            }
            ds_list_destroy(li_objects_in_box)
            if (collision_rectangle((mouse_drag_box_xmin + 2), (level_bound_y1 - 100), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x2 = min(max((level_bound_x1 + 1920), mouse_drag_box_xmin), level_bound_x2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (mouse_drag_box_xmax - 2), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_x1 = max(min((level_bound_x2 - 1920), mouse_drag_box_xmax), level_bound_x1)
            if (collision_rectangle((level_bound_x1 - 100), (mouse_drag_box_ymin + 2), (level_bound_x2 + 100), (level_bound_y2 + 100), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y2 = min(max((level_bound_y1 + 1080), mouse_drag_box_ymin), level_bound_y2)
            if (collision_rectangle((level_bound_x1 - 100), (level_bound_y1 - 100), (level_bound_x2 + 100), (mouse_drag_box_ymax - 2), obj_lvlobj_parent, 1, 1) == -4)
                level_bound_y1 = max(min((level_bound_y2 - 1080), mouse_drag_box_ymax), level_bound_y1)
            lvlwire_delete_non_valids()
            break
        case 4:
            collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 159)
            if (collision != noone)
                hlp_draw_bounding_box_around_obj(collision, 4, obj_levelstyler.col_traps)
            break
    }

    return 1;
}

function toolplace_move_thing(argument0, argument1) //gml_Script_toolplace_move_thing
{
    switch argument1
    {
        case 0:
            drag_collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 159)
            if (drag_collision != noone)
            {
                hlp_draw_bounding_box_around_obj(drag_collision, 4, obj_levelstyler.col_td_turret_3)
                drag_current_toolstruct = drag_collision.toolStruct
                if variable_struct_exists(drag_current_toolstruct, "disallow_drag")
                {
                    if drag_current_toolstruct.disallow_drag
                    {
                        drag_collision = noone
                        break
                    }
                    else
                    {
                        drag_xoff = (drag_collision.x - global.cursor_in_level_x)
                        drag_yoff = (drag_collision.y - global.cursor_in_level_y)
                        prev_final_x = 0
                        prev_final_y = 0
                        break
                    }
                }
                else
                {
                    drag_xoff = (drag_collision.x - global.cursor_in_level_x)
                    drag_yoff = (drag_collision.y - global.cursor_in_level_y)
                    prev_final_x = 0
                    prev_final_y = 0
                    break
                }
            }
            else
                break
        case 1:
            if (!is_undefined(drag_collision))
            {
                if (drag_collision != noone)
                {
                    var final_x = (global.cursor_in_level_x + drag_xoff)
                    var final_y = (global.cursor_in_level_y + drag_yoff)
                    if (!(ds_map_exists(drag_current_toolstruct.ds_map_tool_properties, "xoff")))
                    {
                        final_x = (round((final_x / 60)) * 60)
                        final_y = (round((final_y / 60)) * 60)
                        final_x -= drag_current_toolstruct.placement_offset_x
                        final_y -= drag_current_toolstruct.placement_offset_y
                    }
                    final_x = round(final_x)
                    final_y = round(final_y)
                    var snap = round((argument0.tool_properties[1].value * 10))
                    if (snap != 0)
                    {
                        final_x = (round((final_x / snap)) * snap)
                        final_y = (round((final_y / snap)) * snap)
                    }
                    drag_collision.x = final_x
                    drag_collision.y = final_y
                    if (prev_final_x != final_x || prev_final_y != final_y)
                    {
                        sound = audio_play_sound(sou_boink_b, 0.6, false)
                        audio_sound_gain(sound, 0.1, 0)
                        audio_sound_pitch(sound, (1 * (0.85 + random(0.3))))
                    }
                    prev_final_x = final_x
                    prev_final_y = final_y
                    hlp_draw_bounding_box_around_obj(drag_collision, 2, 16777215, 0)
                }
            }
            break
        case 2:
            if (drag_collision != noone)
            {
                level_bound_x1 = min(level_bound_x1, (round((global.cursor_in_level_x / 60)) * 60))
                level_bound_x2 = max(level_bound_x2, (round((global.cursor_in_level_x / 60)) * 60))
                level_bound_y1 = min(level_bound_y1, (round((global.cursor_in_level_y / 60)) * 60))
                level_bound_y2 = max(level_bound_y2, (round((global.cursor_in_level_y / 60)) * 60))
                sound = audio_play_sound(sou_shooter_plop_01, 0.6, false)
                audio_sound_gain(sound, 0.3, 0)
                audio_sound_pitch(sound, 0.96)
            }
            break
        case 4:
            collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 159)
            if (collision != noone)
            {
                drag_current_toolstruct = collision.toolStruct
                if variable_struct_exists(drag_current_toolstruct, "disallow_drag")
                {
                    if drag_current_toolstruct.disallow_drag
                    {
                        drag_collision = -4
                        break
                    }
                    else
                    {
                        hlp_draw_bounding_box_around_obj(collision, 4, obj_levelstyler.col_td_turret_3)
                        break
                    }
                }
                else
                {
                    hlp_draw_bounding_box_around_obj(collision, 4, obj_levelstyler.col_td_turret_3)
                    break
                }
            }
            else
                break
    }

    return 1;
}

function toolplace_copy_blocks_all_in_rect(argument0, argument1) //gml_Script_toolplace_copy_blocks_all_in_rect
{
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_snail, 32, 0.7, 0.1)
            break
        case 2:
            mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60)
            mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60)
            mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60)
            mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60)
            li_objects_in_box = ds_list_create()
            collision_rectangle_list((mouse_drag_box_xmin + 2), (mouse_drag_box_ymin + 2), (mouse_drag_box_xmax - 2), (mouse_drag_box_ymax - 2), 159, 1, 1, li_objects_in_box, 0)
            clipboard = []
            for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
            {
                inst_check = ds_list_find_value(li_objects_in_box, indx)
                if variable_struct_exists(inst_check.toolStruct, "can_be_copied")
                {
                    if (inst_check.toolStruct.placement_script == gml_Script_toolplace_singleton_placement)
                    {
                    }
                    else if (!inst_check.toolStruct.can_be_copied)
                    {
                    }
                    else
                        array_push(clipboard, scr_create_clipboard_struct_from_object((mouse_drag_box_start_x * 60), (mouse_drag_box_start_y * 60), inst_check))
                }
                else
                    array_push(clipboard, scr_create_clipboard_struct_from_object((mouse_drag_box_start_x * 60), (mouse_drag_box_start_y * 60), inst_check))
            }
            if (ds_list_size(li_objects_in_box) > 0)
            {
            }
            ds_list_destroy(li_objects_in_box)
            lvlwire_delete_non_valids()
            break
        case 4:
            break
    }

    return 1;
}

function hlp_show_copy_preview(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_hlp_show_copy_preview
{
    var _toolStruct = argument2.toolStruct
    var rot_data = hlp_rotate_object_data(argument0, argument1, (argument0 + argument2.x), (argument1 + argument2.y), argument3, argument2.toolStruct, argument2, argument4, argument5)
    created_inst_x = rot_data.x
    created_inst_y = rot_data.y
    quicktool_sprite = get_tool_sprite(_toolStruct)
    img_angle = rot_data.image_angle
    img_xscale = rot_data.image_xscale
    img_yscale = rot_data.image_yscale
    sprite_preview_color = _toolStruct.preview_color
    tool_id = _toolStruct.custom_tool_or_object_id
    alphana = ((sin((current_time / 100)) * 0.3) + 0.7)
    preview_sprite_index_once_placed = get_tool_sprite(_toolStruct)
    if variable_struct_exists(_toolStruct, "custom_draw")
    {
        switch _toolStruct.custom_tool_or_object_id
        {
            case "path_tool":
                break
            default:
                _toolStruct._toolStruct.custom_draw(alphana, _toolStruct)
                break
        }

    }
    else
    {
        switch _toolStruct.custom_tool_or_object_id
        {
            case "door":
                preview_sprite_index_once_placed = spr_door2
                hlp_draw_regular_sprite(_toolStruct, alphana)
                break
            default:
                hlp_draw_regular_sprite(_toolStruct, alphana)
                break
        }

    }
}

function hlp_rotate_object_data(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) //gml_Script_hlp_rotate_object_data
{
    var cur_tool_id = argument5.custom_tool_or_object_id
    var sprite_offset_x = (sprite_get_xoffset(argument5.preview_sprite_index_once_placed) + argument5.placement_offset_x)
    var sprite_offset_y = (sprite_get_yoffset(argument5.preview_sprite_index_once_placed) + argument5.placement_offset_y)
    var rotated_stuff = scr_rotate_pos_around_point(argument0, argument1, argument2, argument3, argument4)
    var return_x = (round(rotated_stuff[0]) + argument7)
    var return_y = (round(rotated_stuff[1]) + argument8)
    if (!(ds_map_exists(argument5.ds_map_tool_properties, "xoff")))
    {
        return_x = (round((return_x / 60)) * 60)
        return_y = (round((return_y / 60)) * 60)
    }
    var return_scale_x = argument6.scaleX
    var return_scale_y = argument6.scaleY
    var return_angle = argument6.angle
    var rot_property = ds_map_find_value(argument5.ds_map_tool_properties, "rot")
    if (!is_undefined(rot_property))
    {
        return_angle += argument4
        return_angle = (round((return_angle / rot_property.f_scroll_steps)) * rot_property.f_scroll_steps)
        return_angle = (return_angle % 360)
    }
    else if (cur_tool_id == "wall")
    {
        return_angle = (round((return_angle / 90)) * 90)
        return_angle = (return_angle % 360)
        switch return_angle
        {
            case 180:
                return_x -= (return_scale_x * 60)
                return_y -= (return_scale_y * 60)
                break
            case 90:
                return_y -= (return_scale_x * 60)
                var temp = return_scale_x
                return_scale_x = return_scale_y
                return_scale_y = temp
                break
            case 270:
                return_x -= (return_scale_y * 60)
                temp = return_scale_x
                return_scale_x = return_scale_y
                return_scale_y = temp
                break
            default:
                break
        }

        return_angle = 0
    }
    return 
    {
        x: return_x,
        y: return_y,
        image_xscale: return_scale_x,
        image_yscale: return_scale_y,
        image_angle: return_angle
    };
}

function toolplace_delete_similar(argument0) //gml_Script_toolplace_delete_similar
{
    with (argument0)
    {
        var inst = instance_place(x, y, argument0.object_index)
        if (inst != noone)
        {
            if (inst.sprite_index != argument0.sprite_index)
                return;
            if (inst.x != argument0.x)
                return;
            if (inst.y != argument0.y)
                return;
            if (inst.image_xscale != argument0.image_xscale)
                return;
            if (inst.image_yscale != argument0.image_yscale)
                return;
            ds_list_remove(inst.toolStruct.li_placed_instances, inst.id)
            instance_destroy(inst)
        }
    }
}

function toolplace_copy_paste(argument0, argument1) //gml_Script_toolplace_copy_paste
{
    var x_off = ds_map_find_value(argument0.ds_map_tool_properties, "copyxoff").value
    var y_off = ds_map_find_value(argument0.ds_map_tool_properties, "copyyoff").value
    switch argument1
    {
        case 0:
            hlp_toolplace_start_dragging_box(argument0)
            break
        case 1:
            hlp_toolplace_drag_box_step_one_by_one(argument0, 4, 16777215, 108, 1.3, 0.1)
            var mx = mouse_drag_box_current_x
            var my = mouse_drag_box_current_y
            for (i = 0; i < array_length(clipboard); i++)
                hlp_show_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off)
            break
        case 4:
            mx = floor((global.cursor_in_level_x / 60))
            my = floor((global.cursor_in_level_y / 60))
            for (i = 0; i < array_length(clipboard); i++)
                hlp_show_copy_preview((mx * 60), (my * 60), clipboard[i], argument0.image_angle, x_off, y_off)
            break
        case 2:
            created_inst_x = (mouse_drag_box_current_x * 60)
            created_inst_y = (mouse_drag_box_current_y * 60)
            for (i = 0; i < array_length(clipboard); i++)
            {
                var clip_entry = clipboard[i]
                var _Ts = clipboard[i].toolStruct
                rot_data = hlp_rotate_object_data(created_inst_x, created_inst_y, (created_inst_x + clip_entry.x), (created_inst_y + clip_entry.y), argument0.image_angle, clip_entry.toolStruct, clip_entry, x_off, y_off)
                created_inst = instance_create_layer(rot_data.x, rot_data.y, _Ts.preview_layer, _Ts.object_index_in_editor)
                created_inst.sprite_index = _Ts.preview_sprite_index_once_placed
                created_inst.image_index = _Ts.preview_image_index
                created_inst.image_blend = _Ts.preview_color
                created_inst.image_angle = rot_data.image_angle
                created_inst.image_xscale = rot_data.image_xscale
                created_inst.image_yscale = rot_data.image_yscale
                ds_list_add(_Ts.li_placed_instances, created_inst)
                created_inst.map_properties = clip_entry.properties
                created_inst.toolStruct = _Ts
                call_after_initializing_new_level_editor_object(created_inst)
                toolplace_delete_similar(created_inst)
            }
            break
    }

    return 1;
}

function toolspecial_pick_properties(argument0, argument1) //gml_Script_toolspecial_pick_properties
{
    switch argument1
    {
        case 0:
            collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 159)
            if (collision != noone)
            {
                if (argument0.custom_tool_or_object_id == "property_picker_tool")
                    argument0.last_tool_this_interacted_with = collision.toolStruct
                sound = audio_play_sound(choose(278, 337), 0.9, false)
                audio_sound_gain_fx(sound, 0.6, 1)
                audio_sound_pitch(sound, (0.8 + random(0.4)))
                hlp_draw_bounding_box_around_obj(collision, 0, 0)
                inst_fx = instance_create_layer(0, 0, "Fx", obj_fx_square_to_mouse)
                inst_fx.x1 = (collision.x + xx_left)
                inst_fx.x2 = (collision.x + xx_right)
                inst_fx.y1 = (collision.y + yy_up)
                inst_fx.y2 = (collision.y + yy_down)
                tool_to_copy_to = collision.toolStruct
                tool_to_copy_to.image_angle = collision.image_angle
                tool_to_copy_to.image_xscale = sign(collision.image_xscale)
                tool_to_copy_to.image_yscale = sign(collision.image_yscale)
                if (!(variable_instance_exists(collision, "map_properties")))
                    break
                else if (ds_map_size(collision.map_properties) <= 0)
                    break
                else
                {
                    prop_key = ds_map_find_first(collision.map_properties)
                    prop_val = ds_map_find_value(collision.map_properties, prop_key)
                    prop_copy_to = ds_map_find_value(tool_to_copy_to.ds_map_tool_properties, prop_key)
                    if (!is_undefined(prop_copy_to))
                        prop_copy_to.value = prop_val
                    while 1
                    {
                        prop_key = ds_map_find_next(collision.map_properties, prop_key)
                        if is_undefined(prop_key)
                            break
                        else
                        {
                            prop_val = ds_map_find_value(collision.map_properties, prop_key)
                            prop_copy_to = ds_map_find_value(tool_to_copy_to.ds_map_tool_properties, prop_key)
                            if (!is_undefined(prop_copy_to))
                                prop_copy_to.value = prop_val
                            continue
                        }
                    }
                    break
                }
            }
            else
                break
        case 4:
            collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 159)
            if (collision != noone)
                hlp_draw_bounding_box_around_obj(collision, 4, 16777215)
            break
    }

    return 1;
}

function toolspecial_place_properties(argument0, argument1) //gml_Script_toolspecial_place_properties
{
    switch argument1
    {
        case 0:
            collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 159)
            if (collision != noone)
            {
                if (argument0.custom_tool_or_object_id == "property_picker_tool")
                    argument0.last_tool_this_interacted_with = collision.toolStruct
                sound = audio_play_sound(choose(358, 339), 0.9, false)
                audio_sound_gain_fx(sound, 0.6, 1)
                audio_sound_pitch(sound, (0.8 + random(0.4)))
                tool_to_copy_from = collision.toolStruct
                collision_sprite = collision.sprite_index
                xplus = (((sprite_get_width(collision_sprite) * 0.5) - sprite_get_xoffset(collision_sprite)) + tool_to_copy_from.placement_offset_x)
                yplus = (((sprite_get_height(collision_sprite) * 0.5) - sprite_get_yoffset(collision_sprite)) + tool_to_copy_from.placement_offset_y)
                collision.x += (lengthdir_x((xplus * collision.image_xscale), collision.image_angle) + lengthdir_x((yplus * collision.image_yscale), (collision.image_angle - 90)))
                collision.y += (lengthdir_y((xplus * collision.image_xscale), collision.image_angle) + lengthdir_y((yplus * collision.image_yscale), (collision.image_angle - 90)))
                collision.image_angle = tool_to_copy_from.image_angle
                collision.image_xscale = (tool_to_copy_from.image_xscale * abs(collision.image_xscale))
                collision.image_yscale = (tool_to_copy_from.image_yscale * abs(collision.image_yscale))
                collision.x -= (lengthdir_x((xplus * collision.image_xscale), collision.image_angle) + lengthdir_x((yplus * collision.image_yscale), (collision.image_angle - 90)))
                collision.y -= (lengthdir_y((xplus * collision.image_xscale), collision.image_angle) + lengthdir_y((yplus * collision.image_yscale), (collision.image_angle - 90)))
                hlp_draw_bounding_box_around_obj(collision, 0, 0)
                inst_fx = instance_create_layer(0, 0, "Fx", obj_fx_mouse_to_square)
                inst_fx.x1_target = (collision.x + xx_left)
                inst_fx.x2_target = (collision.x + xx_right)
                inst_fx.y1_target = (collision.y + yy_up)
                inst_fx.y2_target = (collision.y + yy_down)
                if (ds_map_size(tool_to_copy_from.ds_map_tool_properties) <= 0)
                    break
                else
                {
                    prop_key = ds_map_find_first(tool_to_copy_from.ds_map_tool_properties)
                    prop_val = ds_map_find_value(tool_to_copy_from.ds_map_tool_properties, prop_key)
                    if prop_val.copy_property_to_placed_obj
                    {
                        if (!(variable_instance_exists(collision, "map_properties")))
                            collision.map_properties = ds_map_create()
                        ds_map_set(collision.map_properties, prop_key, prop_val.value)
                    }
                    while 1
                    {
                        prop_key = ds_map_find_next(tool_to_copy_from.ds_map_tool_properties, prop_key)
                        if is_undefined(prop_key)
                            break
                        else
                        {
                            prop_val = ds_map_find_value(tool_to_copy_from.ds_map_tool_properties, prop_key)
                            if prop_val.copy_property_to_placed_obj
                            {
                                if (!(variable_instance_exists(collision, "map_properties")))
                                    collision.map_properties = ds_map_create()
                                ds_map_set(collision.map_properties, prop_key, prop_val.value)
                            }
                            continue
                        }
                    }
                    with (collision)
                        event_user(1)
                    break
                }
            }
            else
                break
        case 4:
            collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 159)
            if (collision != noone)
                hlp_draw_bounding_box_around_obj(collision, 4, 16777215)
            break
    }

    return 1;
}

function toolspecial_wire_maker(argument0, argument1) //gml_Script_toolspecial_wire_maker
{
    switch argument1
    {
        case 0:
            wire_start_x = -100
            wire_start_y = -100
            wire_start_collision = -1
            collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 80)
            if (collision != noone)
            {
                sound = audio_play_sound(choose(278, 337), 0.9, false)
                audio_sound_gain_fx(sound, 0.6, 1)
                audio_sound_pitch(sound, (1.8 + random(0.4)))
                wire_start_x = scr_sprite_to_world_x(collision, collision.wire_connection_xoff, collision.wire_connection_yoff)
                wire_start_y = scr_sprite_to_world_y(collision, collision.wire_connection_xoff, collision.wire_connection_yoff)
                wire_start_collision = collision
            }
            break
        case 1:
            if (wire_start_collision == -1)
                break
            else
            {
                collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 80)
                if (collision != noone && wire_start_collision != collision)
                {
                    hlp_draw_bounding_box_around_obj(collision, 4, 16777215)
                    wire_end_x = scr_sprite_to_world_x(collision, collision.wire_connection_xoff, collision.wire_connection_yoff)
                    wire_end_y = scr_sprite_to_world_y(collision, collision.wire_connection_xoff, collision.wire_connection_yoff)
                    scr_draw_line_sprite(wire_start_x, wire_start_y, wire_end_x, wire_end_y, 4, c_white)
                }
                else
                    scr_draw_line_sprite(wire_start_x, wire_start_y, global.cursor_in_level_x, global.cursor_in_level_y, 4, c_white)
                break
            }
        case 2:
            if (wire_start_collision == -1)
                break
            else
            {
                collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 80)
                if (collision != noone && wire_start_collision != collision)
                {
                    sound = audio_play_sound(choose(358, 339), 0.9, false)
                    audio_sound_gain_fx(sound, 0.6, 1)
                    audio_sound_pitch(sound, (1.8 + random(0.4)))
                    lvlwire_create(wire_start_collision, collision)
                }
                break
            }
        case 4:
            collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 80)
            if (collision != noone)
                hlp_draw_bounding_box_around_obj(collision, 4, 16777215)
            break
    }

    return 1;
}

function toolspecial_wire_destroyer(argument0, argument1) //gml_Script_toolspecial_wire_destroyer
{
    switch argument1
    {
        case 0:
            wire_start_x = -100
            wire_start_y = -100
            wire_start_collision = -1
            collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 80)
            if (collision != noone)
            {
                sound = audio_play_sound(choose(278, 337), 0.9, false)
                audio_sound_gain_fx(sound, 0.6, 1)
                audio_sound_pitch(sound, (1.8 + random(0.4)))
                wire_start_x = scr_sprite_to_world_x(collision, collision.wire_connection_xoff, collision.wire_connection_yoff)
                wire_start_y = scr_sprite_to_world_y(collision, collision.wire_connection_xoff, collision.wire_connection_yoff)
                wire_start_collision = collision
            }
            break
        case 1:
            if (wire_start_collision == -1)
                break
            else
            {
                collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 80)
                if (collision != noone)
                {
                    hlp_draw_bounding_box_around_obj(collision, 4, obj_levelstyler.col_traps)
                    wire_end_x = scr_sprite_to_world_x(collision, collision.wire_connection_xoff, collision.wire_connection_yoff)
                    wire_end_y = scr_sprite_to_world_y(collision, collision.wire_connection_xoff, collision.wire_connection_yoff)
                    scr_draw_line_sprite(wire_start_x, wire_start_y, wire_end_x, wire_end_y, 6, obj_levelstyler.col_traps)
                }
                else
                    scr_draw_line_sprite(wire_start_x, wire_start_y, global.cursor_in_level_x, global.cursor_in_level_y, 6, obj_levelstyler.col_traps)
                break
            }
        case 2:
            if (wire_start_collision == -1)
                break
            else
            {
                collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 80)
                if (collision != -4)
                {
                    sound = audio_play_sound(sou_shooter_explosion_03, 0.95, false)
                    audio_sound_gain(sound, 0.5, 0)
                    audio_sound_pitch(sound, (1 + random(0.4)))
                    if (collision == wire_start_collision)
                        lvlwire_destroy_every_wire_connected_to(collision)
                    else
                        lvlwire_destroy(wire_start_collision, collision)
                }
                break
            }
        case 4:
            collision = hlp_collision_point_search(global.cursor_in_level_x, global.cursor_in_level_y, 80)
            if (collision != noone)
                hlp_draw_bounding_box_around_obj(collision, 4, 16777215)
            break
    }

    return 1;
}

function hlp_toolplace_start_dragging_box(argument0) //gml_Script_hlp_toolplace_start_dragging_box
{
    xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
    if is_undefined(xoffseet)
        xoffseet = 0
    else
        xoffseet = xoffseet.value
    yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
    if is_undefined(yoffseet)
        yoffseet = 0
    else
        yoffseet = yoffseet.value
    mouse_drag_box_start_x = floor(((global.cursor_in_level_x - xoffseet) / 60))
    mouse_drag_box_start_y = floor(((global.cursor_in_level_y - yoffseet) / 60))
    mouse_drag_box_current_x = mouse_drag_box_start_x
    mouse_drag_box_current_y = mouse_drag_box_start_y
    mouse_crag_box_draw_x1 = (mouse_drag_box_start_x * 60)
    mouse_crag_box_draw_y1 = (mouse_drag_box_start_y * 60)
    mouse_crag_box_draw_x2 = ((mouse_drag_box_start_x * 60) + 60)
    mouse_crag_box_draw_y2 = ((mouse_drag_box_start_y * 60) + 60)
    mouse_drag_boxes_last = 0
}

function hlp_toolplace_drag_box_step(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_hlp_toolplace_drag_box_step
{
    xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
    if is_undefined(xoffseet)
        xoffseet = 0
    else
        xoffseet = xoffseet.value
    yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
    if is_undefined(yoffseet)
        yoffseet = 0
    else
        yoffseet = yoffseet.value
    mouse_drag_box_current_x = floor(((global.cursor_in_level_x - xoffseet) / 60))
    mouse_drag_box_current_y = floor(((global.cursor_in_level_y - yoffseet) / 60))
    mouse_drag_boxes = ((abs((mouse_drag_box_current_x - mouse_drag_box_start_x)) + abs((mouse_drag_box_current_y - mouse_drag_box_start_y))) + 1)
    if (mouse_drag_boxes != mouse_drag_boxes_last)
    {
        sound = audio_play_sound(argument3, 0.6, false)
        audio_sound_gain(sound, argument5, 0)
        audio_sound_pitch(sound, (argument4 * power(1.025, mouse_drag_boxes)))
    }
    mouse_drag_boxes_last = mouse_drag_boxes
    mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60)
    mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60)
    mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60)
    mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60)
    mouse_crag_box_draw_x1 = lerp(mouse_crag_box_draw_x1, mouse_drag_box_xmin, 0.6)
    mouse_crag_box_draw_y1 = lerp(mouse_crag_box_draw_y1, mouse_drag_box_ymin, 0.6)
    mouse_crag_box_draw_x2 = lerp(mouse_crag_box_draw_x2, mouse_drag_box_xmax, 0.6)
    mouse_crag_box_draw_y2 = lerp(mouse_crag_box_draw_y2, mouse_drag_box_ymax, 0.6)
    scr_draw_rectangle_border_fromto((mouse_crag_box_draw_x1 + xoffseet), (mouse_crag_box_draw_y1 + yoffseet), (mouse_crag_box_draw_x2 + xoffseet), (mouse_crag_box_draw_y2 + yoffseet), argument1, argument2)
}

function hlp_toolplace_drag_box_step_one_by_one(argument0, argument1, argument2, argument3, argument4, argument5) //gml_Script_hlp_toolplace_drag_box_step_one_by_one
{
    if (mouse_drag_box_current_x != floor((global.cursor_in_level_x / 60)) || mouse_drag_box_current_y != floor((global.cursor_in_level_y / 60)))
    {
        sound = audio_play_sound(argument3, 0.6, false)
        audio_sound_gain(sound, argument5, 0)
        audio_sound_pitch(sound, (argument4 * (0.85 + random(0.3))))
    }
    mouse_drag_box_current_x = floor((global.cursor_in_level_x / 60))
    mouse_drag_box_current_y = floor((global.cursor_in_level_y / 60))
    mouse_drag_box_xmin = (mouse_drag_box_current_x * 60)
    mouse_drag_box_xmax = ((mouse_drag_box_current_x * 60) + 60)
    mouse_drag_box_ymin = (mouse_drag_box_current_y * 60)
    mouse_drag_box_ymax = ((mouse_drag_box_current_y * 60) + 60)
    mouse_crag_box_draw_x1 = lerp(mouse_crag_box_draw_x1, mouse_drag_box_xmin, 0.6)
    mouse_crag_box_draw_y1 = lerp(mouse_crag_box_draw_y1, mouse_drag_box_ymin, 0.6)
    mouse_crag_box_draw_x2 = lerp(mouse_crag_box_draw_x2, mouse_drag_box_xmax, 0.6)
    mouse_crag_box_draw_y2 = lerp(mouse_crag_box_draw_y2, mouse_drag_box_ymax, 0.6)
    xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
    if is_undefined(xoffseet)
        xoffseet = 0
    else
        xoffseet = xoffseet.value
    yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
    if is_undefined(yoffseet)
        yoffseet = 0
    else
        yoffseet = yoffseet.value
    scr_draw_rectangle_border_fromto((mouse_crag_box_draw_x1 + xoffseet), (mouse_crag_box_draw_y1 + yoffseet), (mouse_crag_box_draw_x2 + xoffseet), (mouse_crag_box_draw_y2 + yoffseet), argument1, argument2)
}

function hlp_destoy_wall_block_full_or_partially(argument0, argument1, argument2, argument3, argument4) //gml_Script_hlp_destoy_wall_block_full_or_partially
{
    if (!instance_exists(argument0))
    {
    }
    wallbl_x1 = (argument0.x / 60)
    wallbl_y1 = (argument0.y / 60)
    wallbl_x2 = (wallbl_x1 + argument0.image_xscale)
    wallbl_y2 = (wallbl_y1 + argument0.image_yscale)
    argument1 /= 60
    argument2 /= 60
    argument3 /= 60
    argument4 /= 60
    wall_tool_struct = argument0.toolStruct
    if (wallbl_x1 >= argument1 && wallbl_x2 <= argument3 && wallbl_y1 >= argument2 && wallbl_y2 <= argument4)
    {
        instance_destroy(argument0)
        return;
    }
    li_cells_to_fill = ds_list_create()
    for (oxx = wallbl_x1; oxx < wallbl_x2; oxx++)
    {
        for (oyy = wallbl_y1; oyy < wallbl_y2; oyy++)
        {
            if (oxx < argument1 || oyy < argument2 || oxx >= argument3 || oyy >= argument4)
                ds_list_add(li_cells_to_fill, oxx, oyy)
        }
    }
    while (ds_list_size(li_cells_to_fill) > 0)
    {
        randindex = (irandom_range(0, ((ds_list_size(li_cells_to_fill) / 2) - 1)) * 2)
        createblockh_x = ds_list_find_value(li_cells_to_fill, randindex)
        createblockh_y = ds_list_find_value(li_cells_to_fill, (randindex + 1))
        createblockh_w = 1
        createblockh_h = 1
        ds_list_delete(li_cells_to_fill, randindex)
        ds_list_delete(li_cells_to_fill, randindex)
        a_merge_did_happen = 1
        while a_merge_did_happen
        {
            merge_direction = choose(0, 90, 180, 270)
            a_merge_did_happen = 0
            repeat (4)
            {
                if (merge_direction == 0 || merge_direction == 180)
                    createblockh_w += 1
                else
                    createblockh_h += 1
                if (merge_direction == 90)
                    createblockh_y -= 1
                if (merge_direction == 180)
                    createblockh_x -= 1
                overlap_counter = 0
                oii = 0
                if (oii < ds_list_size(li_cells_to_fill))
                {
                    chck_x = ds_list_find_value(li_cells_to_fill, oii)
                    chck_y = ds_list_find_value(li_cells_to_fill, (oii + 1))
                    if (chck_x < createblockh_x || chck_y < createblockh_y || chck_x >= (createblockh_x + createblockh_w) || chck_y >= (createblockh_y + createblockh_h))
                    {
                    }
                    else
                        overlap_counter++
                    for (oii += 2; oii < ds_list_size(li_cells_to_fill); oii += 2)
                    {
                        chck_x = ds_list_find_value(li_cells_to_fill, oii)
                        chck_y = ds_list_find_value(li_cells_to_fill, (oii + 1))
                        if (chck_x < createblockh_x || chck_y < createblockh_y || chck_x >= (createblockh_x + createblockh_w) || chck_y >= (createblockh_y + createblockh_h))
                        {
                        }
                        else
                            overlap_counter++
                    }
                }
                if (overlap_counter < ((createblockh_w * createblockh_h) - 1))
                {
                    if (merge_direction == 0 || merge_direction == 180)
                        createblockh_w -= 1
                    else
                        createblockh_h -= 1
                    if (merge_direction == 90)
                        createblockh_y += 1
                    if (merge_direction == 180)
                        createblockh_x += 1
                }
                else
                    a_merge_did_happen = 1
                merge_direction = ((merge_direction + 90) % 360)
            }
        }
        for (oii = (ds_list_size(li_cells_to_fill) - 2); oii >= 0; oii -= 2)
        {
            chck_x = ds_list_find_value(li_cells_to_fill, oii)
            chck_y = ds_list_find_value(li_cells_to_fill, (oii + 1))
            if (chck_x < createblockh_x || chck_y < createblockh_y || chck_x >= (createblockh_x + createblockh_w) || chck_y >= (createblockh_y + createblockh_h))
            {
            }
            else
            {
                ds_list_delete(li_cells_to_fill, oii)
                ds_list_delete(li_cells_to_fill, oii)
            }
        }
        created_inst = instance_create_layer((createblockh_x * 60), (createblockh_y * 60), wall_tool_struct.preview_layer, wall_tool_struct.object_index_in_editor)
        created_inst.sprite_index = wall_tool_struct.preview_sprite_index
        created_inst.image_index = wall_tool_struct.preview_image_index
        created_inst.image_blend = wall_tool_struct.preview_color
        created_inst.image_angle = 0
        created_inst.image_xscale = createblockh_w
        created_inst.image_yscale = createblockh_h
        created_inst.toolStruct = wall_tool_struct
        ds_list_add(wall_tool_struct.li_placed_instances, created_inst)
        if variable_instance_exists(argument0, "map_properties")
        {
            created_inst.map_properties = ds_map_create()
            ds_map_copy(created_inst.map_properties, argument0.map_properties)
            spritenr = ds_map_find_value(created_inst.map_properties, "tex")
            texprop = ds_map_find_value(wall_tool_struct.ds_map_tool_properties, "tex")
            if ((!is_undefined(spritenr)) && (!is_undefined(texprop)))
            {
                if variable_struct_exists(texprop, "IntToPreviewSprite")
                    created_inst.sprite_index = spritenr.spritenr.IntToPreviewSprite(texprop)
            }
        }
    }
    ds_list_destroy(li_cells_to_fill)
    instance_destroy(argument0)
}

function hlp_draw_regular_sprite(argument0, argument1) //gml_Script_hlp_draw_regular_sprite
{
    draw_sprite_ext(preview_sprite_index_once_placed, argument0.preview_image_index, created_inst_x, created_inst_y, img_xscale, img_yscale, img_angle, sprite_preview_color, (0.25 * argument1))
}

function hlp_show_placement_preview(argument0) //gml_Script_hlp_show_placement_preview
{
    xoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "xoff")
    if is_undefined(xoffseet)
        xoffseet = 0
    else
        xoffseet = xoffseet.value
    yoffseet = ds_map_find_value(argument0.ds_map_tool_properties, "yoff")
    if is_undefined(yoffseet)
        yoffseet = 0
    else
        yoffseet = yoffseet.value
    mouse_drag_box_current_x = floor(((global.cursor_in_level_x - xoffseet) / 60))
    mouse_drag_box_current_y = floor(((global.cursor_in_level_y - yoffseet) / 60))
    created_inst_x = ((mouse_drag_box_current_x * 60) + 30)
    created_inst_y = ((mouse_drag_box_current_y * 60) + 30)
    quicktool_sprite = get_tool_sprite(argument0)
    img_angle = argument0.image_angle
    img_xscale = argument0.image_xscale
    img_yscale = argument0.image_yscale
    sprite_preview_color = argument0.preview_color
    img_pivot_x = ((sprite_get_xoffset(quicktool_sprite) - argument0.placement_offset_x) * img_xscale)
    img_pivot_y = ((sprite_get_yoffset(quicktool_sprite) - argument0.placement_offset_y) * img_yscale)
    img_size_w = (sprite_get_width(quicktool_sprite) * img_xscale)
    img_size_h = (sprite_get_height(quicktool_sprite) * img_yscale)
    xplus = (((-img_size_w) * 0.5) + img_pivot_x)
    yplus = (((-img_size_h) * 0.5) + img_pivot_y)
    created_inst_x += ((lengthdir_x(xplus, img_angle) - lengthdir_y(yplus, img_angle)) + xoffseet)
    created_inst_y += ((lengthdir_y(xplus, img_angle) + lengthdir_x(yplus, img_angle)) + yoffseet)
    tool_id = argument0.custom_tool_or_object_id
    alphana = ((sin((current_time / 100)) * 0.3) + 0.7)
    preview_sprite_index_once_placed = get_tool_sprite(argument0)
    if variable_struct_exists(argument0, "custom_draw")
        argument0.argument0.custom_draw(alphana, argument0)
    else
        hlp_draw_regular_sprite(argument0, alphana)
}

function hlp_copy_tool_properties_to_newly_created_obj(argument0, argument1) //gml_Script_hlp_copy_tool_properties_to_newly_created_obj
{
    for (iprop = 0; iprop < array_length(argument0.tool_properties); iprop++)
    {
        tp = argument0.tool_properties[iprop]
        if (!tp.copy_property_to_placed_obj)
        {
        }
        else
        {
            if (!(variable_instance_exists(argument1, "map_properties")))
                argument1.map_properties = ds_map_create()
            ds_map_add(argument1.map_properties, tp.key, tp.value)
        }
    }
}

function hlp_draw_bounding_box_around_obj(argument0, argument1, argument2, argument3) //gml_Script_hlp_draw_bounding_box_around_obj
{
    if (argument3 == undefined)
        argument3 = 1
    collision_img_xscale = argument0.image_xscale
    collision_img_yscale = argument0.image_yscale
    collision_img_angle = argument0.image_angle
    collision_sprite = argument0.sprite_index
    collision_sprite_xpiv = sprite_get_xoffset(collision_sprite)
    collision_sprite_ypiv = sprite_get_yoffset(collision_sprite)
    x_left = min(((-collision_sprite_xpiv) * collision_img_xscale), ((sprite_get_width(collision_sprite) - collision_sprite_xpiv) * collision_img_xscale))
    x_right = max(((-collision_sprite_xpiv) * collision_img_xscale), ((sprite_get_width(collision_sprite) - collision_sprite_xpiv) * collision_img_xscale))
    y_up = min(((-collision_sprite_ypiv) * collision_img_yscale), ((sprite_get_height(collision_sprite) - collision_sprite_ypiv) * collision_img_yscale))
    y_down = max(((-collision_sprite_ypiv) * collision_img_yscale), ((sprite_get_height(collision_sprite) - collision_sprite_ypiv) * collision_img_yscale))
    dist_botr = point_distance(0, 0, x_right, y_down)
    dist_botl = point_distance(0, 0, x_left, y_down)
    dist_topr = point_distance(0, 0, x_right, y_up)
    dist_topl = point_distance(0, 0, x_left, y_up)
    dir_botr = point_direction(0, 0, x_right, y_down)
    dir_botl = point_direction(0, 0, x_left, y_down)
    dir_topr = point_direction(0, 0, x_right, y_up)
    dir_topl = point_direction(0, 0, x_left, y_up)
    xx_left = min(lengthdir_x(dist_topr, (collision_img_angle + dir_topr)), lengthdir_x(dist_topl, (collision_img_angle + dir_topl)), lengthdir_x(dist_botl, (collision_img_angle + dir_botl)), lengthdir_x(dist_botr, (collision_img_angle + dir_botr)))
    xx_right = max(lengthdir_x(dist_topr, (collision_img_angle + dir_topr)), lengthdir_x(dist_topl, (collision_img_angle + dir_topl)), lengthdir_x(dist_botl, (collision_img_angle + dir_botl)), lengthdir_x(dist_botr, (collision_img_angle + dir_botr)))
    yy_up = min(lengthdir_y(dist_topr, (collision_img_angle + dir_topr)), lengthdir_y(dist_topl, (collision_img_angle + dir_topl)), lengthdir_y(dist_botl, (collision_img_angle + dir_botl)), lengthdir_y(dist_botr, (collision_img_angle + dir_botr)))
    yy_down = max(lengthdir_y(dist_topr, (collision_img_angle + dir_topr)), lengthdir_y(dist_topl, (collision_img_angle + dir_topl)), lengthdir_y(dist_botl, (collision_img_angle + dir_botl)), lengthdir_y(dist_botr, (collision_img_angle + dir_botr)))
    borderw = 8
    if argument3
        borderw += (sin((current_time / 100)) * 6)
    if (argument1 > 0)
        scr_draw_rectangle_border_fromto(((argument0.x + xx_left) - borderw), ((argument0.y + yy_up) - borderw), ((argument0.x + xx_right) + borderw), ((argument0.y + yy_down) + borderw), argument1, argument2)
}

function hlp_collision_point_search(argument0, argument1, argument2) //gml_Script_hlp_collision_point_search
{
    cccollision = collision_point(argument0, argument1, argument2, 1, 1)
    rrradius = 3
    while (rrradius <= 30 && cccollision == -4)
    {
        cccollision = collision_rectangle((argument0 - rrradius), (argument1 - rrradius), (argument0 + rrradius), (argument1 + rrradius), argument2, 1, 1)
        rrradius += 3
    }
    return cccollision;
}

