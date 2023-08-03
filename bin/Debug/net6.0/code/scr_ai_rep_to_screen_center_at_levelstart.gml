if(room != level_editor){
    #orig#()
} else {
    if (!instance_exists(obj_ai_representation))
    {
        return false
    }
    if (obj_ai_representation.mode != 0)
        return false;
    with (obj_ai_representation)
    {
        x = obj_camera_control_level_editor.camx
        y = obj_camera_control_level_editor.camy
    }
    with (obj_ai_eye)
    {
        x = obj_ai_representation.x
        y = obj_ai_representation.y
    }
    with (obj_ai_mouth)
    {
        x = obj_ai_representation.x
        y = obj_ai_representation.y
    }
}