#orig#()

//global.setting_squid_in_editor = true

global.input_virtualmouse_notgui_x = 0
global.input_virtualmouse_notgui_y = 0

if(global.setting_squid_in_editor){

/*
    if(!variable_global_exists("global.input_virtualmouse_notgui_x")){
        global.input_virtualmouse_notgui_x = 0
    }
    if(!variable_global_exists("global.input_virtualmouse_notgui_y")){
        global.input_virtualmouse_notgui_y = 0
    }
*/

    my_ai_rep = instance_create_layer(room_width / 2, room_height / 2,  "AI_Representation_Back", obj_ai_representation)
    my_ai_rep.stay_in_view_mode = true
    my_ai_rep.is_in_editor = true
    block_all_vls = instance_create_layer(-100, -100, "FadeOutIn", obj_aivl_block_vls_all)
}

just_pressed_upload_icon = true
global.currentlyUploadingOrUpdatingALevel = false