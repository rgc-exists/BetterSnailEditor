if(started_with_blood_mode){
    if (!place_free(x, y))
        frozen = 1
    else
    {
        if frozen
            instance_destroy()
        frozen = 0
    }
} else {
    #orig#()
}