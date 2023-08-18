if(room != level_editor){
    #orig#()
} else {
    with (obj_ai_representation)
    {
        if (has_been_centered_in_this_room == 0)
        {
            x = obj_camera_control_level_editor.camx
            y = obj_camera_control_level_editor.camy
            has_been_centered_in_this_room = 1
        }
    }
}