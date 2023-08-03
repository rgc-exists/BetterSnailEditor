switch argument1
{
    case 0:
        hlp_toolplace_start_dragging_box(argument0)
        break
    case 1:
        hlp_toolplace_drag_box_step(argument0, 4, obj_levelstyler.col_snail, 31, 0.7, 0.1)
        break
    case 2:
        mouse_drag_box_xmin = (min(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60)
        mouse_drag_box_xmax = ((max(mouse_drag_box_start_x, mouse_drag_box_current_x) * 60) + 60)
        mouse_drag_box_ymin = (min(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60)
        mouse_drag_box_ymax = ((max(mouse_drag_box_start_y, mouse_drag_box_current_y) * 60) + 60)
        li_objects_in_box = ds_list_create()
        collision_rectangle_list((mouse_drag_box_xmin + 2), (mouse_drag_box_ymin + 2), (mouse_drag_box_xmax - 2), (mouse_drag_box_ymax - 2), obj_lvlobj_parent, 1, 1, li_objects_in_box, 0)
        clipboard = []
        for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
        {
            inst_check = ds_list_find_value(li_objects_in_box, indx)
            array_push(clipboard, scr_create_clipboard_struct_from_object((mouse_drag_box_start_x * 60), (mouse_drag_box_start_y * 60), inst_check))
        }
        if (ds_list_size(li_objects_in_box) > 0)
        {
        }
        if(variable_instance_exists(id, "li_wires_in_box")){
            ds_list_clear(li_wires_in_box)
        } else {
            li_wires_in_box = ds_list_create()
        }
        li_wires_in_box = ds_list_create()
        for (indx = 0; indx < ds_list_size(li_objects_in_box); indx++)
        {
            from_obj = ds_list_find_value(li_objects_in_box, indx)
            if(object_is_ancestor(from_obj.object_index, obj_lvlobj_wireable_parent) || from_obj.object_index == obj_lvlobj_wireable_parent){
                for(var w = 0; w < ds_list_size(global.lvl_wires); w++){
                    var connection = ds_list_find_value(global.lvl_wires, w)
                    if(connection.from_obj == from_obj){
                        to_obj = connection.to_obj
                        if(ds_list_find_index(li_objects_in_box, to_obj) != -1){
                            ds_list_add(li_wires_in_box, [indx, ds_list_find_index(li_objects_in_box, to_obj)])
                        }
                    }
                }
            }
        }
        clipboard_wires = li_wires_in_box
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

