//Unused because I couldn't figure out how to get global init scripts working in GMML.
//This is essentially the same code as obj_persistent_Create_0.gml.






















global.is_BSE_client = true
//This is for  if any other mods want to make their code "support" BSE by making it compatible if it detects a BSE client.
//Just use if(variable_global_exists("is_BSE_client")) to detect if it's BSE or not.


if(directory_exists(working_directory + "gmml/mods/BetterSnailEditor/BetterSnailEditor_Assets/")){
    global.betterSE_assets = working_directory + "gmml/mods/BetterSnailEditor/BetterSnailEditor_Assets/"
    global.is_gmml_version = true
} else if(directory_exists(working_directory + "BetterSnailEditor_Assets/")){
    global.betterSE_assets = working_directory + "BetterSnailEditor_Assets/"
    global.is_gmml_version = false
} else {
    show_error("ERROR:\nThe assets folder for the mod was not found.\nPlease add the folder called 'BetterSnailEditor_Assets' to the same folder as the Will You Snail executable (your WYS steam install location.)\nThe folder can be found in the zip file you downloaded the mod with.\n\n\nFor GMML users, IDK how you messed this up because its literally checking if the GMML folder for the mod exists. XD", true)
}
global.model_tool_sprite = sprite_add(global.betterSE_assets + "sprites/" + "spr_models_tool_v3.png", 0, 0, 0, 0, 0)

if(!directory_exists(working_directory + "BetterSnailEditor_Temp")){
    directory_create(working_directory + "BetterSnailEditor_Temp")
}
version_file = http_get_file("https://drive.google.com/uc?export=download&id=1yFsjLgoRg5KciXaQU5BY5TdXi2SfZFSS", working_directory + "BetterSnailEditor_Temp\\version.txt")
global.cur_model_is_text = false
if(global.is_gmml_version){
    //gmml_console_readline()
}
global.invincible_mode = false
global.ball_invincible_mode = false
global.infinite_jumps = false
obj_persistent.show_hotkeys_tip = 0
global.hotkeys_shown = false
global.rendering_enabled = true
global.exits_in_this_level_are_available = true
go_to_BSE_credits_next = false