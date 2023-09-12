
#orig#()
if(!variable_global_exists("update_available")){
    global.update_available = false
} else if(global.update_available){
    txt_1 = "MOD UPDATE AVAILABLE!"
    //txt_2 = "A new version of Better Snail Editor is now available!\n\nPlease visit\nhttps://github.com/rgc-exists/BetterSnailEditor/releases\nto download the latest version.\n\n\nPress a button to continue."
    txt_2 = "A new version of Better Snail Editor is now available!\n\nPlease visit\nthe Better Snail Editor itch.io page\nto download the latest version.\n\n\nPress a button to continue."
}
gml_Script_scr_initialize_BSE_settings()
if scr_save_settings_exists()
    scr_load_settings()