if(global.setting_optimized_wires){
    if(!variable_global_exists("powered_count")){
        global.powered_count = 1
    } else {
        global.powered_count += 1
    }
} else {
    #orig#()
}