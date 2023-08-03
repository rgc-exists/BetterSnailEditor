if(global.credits_mode != 100){
    delaybeforestarting--
    if (!instance_exists(obj_music_parent))
    {
        if (global.credits_mode == 2)
            instance_create_layer(0, 0, "Fx", obj_music_nothing)
        else
            instance_create_layer(0, 0, "Fx", obj_music_LightOcean)
    }
}