
if(global.just_loaded_savestate){
    global.just_loaded_savestate = false
}
if(room != level_editor && room != menu && room != main_menu_dark && room != the_elevator){
    if(keyboard_check_pressed(vk_f6)){
        gml_Script_scr_save_savestate()
    }
    if(keyboard_check_pressed(vk_f7)){
        gml_Script_scr_load_savestate()
        //global.just_loaded_savestate = true
    }
}