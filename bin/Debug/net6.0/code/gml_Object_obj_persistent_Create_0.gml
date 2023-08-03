global.is_BSE_client = true
//This is for  if any other mods want to make their code "support" BSE by making it compatible if it detects a BSE client.
//Just use if(variable_global_exists("is_BSE_client")) to detect if it's BSE or not.
//Sorry for anyone that needs to detect whether or not it's BSE before obj_persistent_Create_0 is run, I couldn't figure out how to get global init scripts to work with GMML.

global.BSE_version = "v0.4.2a"
if(directory_exists(working_directory + "gs2ml/mods/BetterSnailEditor/BetterSnailEditor_Assets/")){
    global.betterSE_assets = working_directory + "gs2ml/mods/BetterSnailEditor/BetterSnailEditor_Assets/"
    global.is_gmml_version = true
} else if(directory_exists(working_directory + "BetterSnailEditor_Assets/")){
    global.betterSE_assets = working_directory + "BetterSnailEditor_Assets/"
    global.is_gmml_version = false
} else {
    show_error("ERROR:\nThe assets folder for the mod was not found.\nPlease add the folder called 'BetterSnailEditor_Assets' to the same folder as the Will You Snail executable\n(your WYS steam install location.)\n\nThe folder can be found in the zip file you downloaded the mod with.\n\nAs for GMML users, IDK how you messed this up, the required folder should already be inside the folder you put in the gs2ml/mods folder.", true)
}

global.model_tool_sprite = sprite_add(global.betterSE_assets + "sprites/" + "spr_models_tool_v3.png", 0, 0, 0, 0, 0)
global.inspector_tool_sprite = sprite_add(global.betterSE_assets + "sprites/" + "inspector_tool_v2.png", 0, 0, 0, 0, 0)

if(!directory_exists(working_directory + "BetterSnailEditor_Temp")){
    directory_create(working_directory + "BetterSnailEditor_Temp")
}
//version_file = http_get_file("https://drive.google.com/uc?export=download&id=1yFsjLgoRg5KciXaQU5BY5TdXi2SfZFSS", "BetterSnailEditor_Temp\\version.txt")
global.cur_model_is_text = false
if(global.is_gmml_version){
    //gmml_console_readline()
}
global.invincible_mode = false
global.ball_invincible_mode = false
global.td_invincible_mode = false
global.infinite_jumps = false
obj_persistent.show_hotkeys_tip = 0
global.hotkeys_shown = false
global.rendering_enabled = true
global.exits_in_this_level_are_available = true
go_to_BSE_credits_next = false


gml_Script_scr_show_hitboxes_ini()
global.show_hitboxes = false
//Show hitboxes is unused because obj_spike_permanent wasn't cooperating.
//I have literally no clue why but the hitbox doesn't appear, and then when I die to it it appears as if it was a solid non-deadly wall. I'm done for now. :/
//Feel free to fix it for me and I'll include it and credit you!

global.really_big_circle = sprite_add(global.betterSE_assets + "sprites/" + "ReallyBigCircleToDrawBecauseFuckingUMTDoesntSupportTheDrawElipseFunction_FuckYouUMT.png", 0, false, false, 0, 0)

global.snailax_just_finished = false
global.snailax_playing = false

global.cur_musroom_song = 1
global.cur_musroom_sound = -1
global.musroom_names = ["1 - Another Simulation", "2 - Jump And Die", "3 - Simulated Life", "4 - Quietly Searching", "5 - Let's Make It Pain", "6 - Admitting Defeat", "7 - Shelly Fire", "8 - Demolition Warning", "10 - Disco of Doom", "11 - Chill Zone", "12 - Mr Dance", "13 - Underwater", "14 - Mama Squid", "15 - Death by Nanobots", "16 - Helpy Loves You", "17 - Winter Mode", "18 - Artificial Joy", "19 - Tension", "20 - Final Encounter", "22 - Reality Diving", "23 - Hello AI Ft. Jason Hanes", "24 - Unicorn Victory", "25 - Supremacy", "26 - Brain Ambience", "27 - Artificial Winter", "28 - Another Simulation (Winter)", "29 - Level Editor Theme", "[UNUSED]  Hello AI Ancestry", "[UNUSED]  Hello AI Ancestry Ft. Jason Hanes.ogg", "[UNUSED] Hello AI v1", "[UNOFFICIAL] Snailax Theme (By MissingTextureMan)", "[UNUSED PROTOTYPE] AnnoyingRageGameMusic.mp3 (By Yän)"]
global.musroom_songs = [304, 86, 91, 87, 92, 93, 96, 101, 89, 90, 104, 94, 103, 4, 102, 88, 363, 133, 95, 321, 98, 97, 100, 7, 352, 181, 323, audio_create_stream(global.betterSE_assets + "audio/" + "Hello AI Ancestry.ogg"), audio_create_stream(global.betterSE_assets + "audio/" + "Hello AI Ancestry Ft. Jason Hanes.ogg"), audio_create_stream(global.betterSE_assets + "audio/" + "Hello AI v1.ogg"), audio_create_stream(global.betterSE_assets + "audio/" + "Snailax Editor Theme.ogg"), audio_create_stream(global.betterSE_assets + "audio/" + "AnnoyingRageGameMusic.ogg")]
global.cheat_player_speed = 1
global.cheat_jump_height = 1

should_restart_after_exit_menu = 0


global.debugger_scroll = 50
global.debugger_scroll_speed = 40
global.object_search_selected = false
global.object_search_query = ""
global.inspector_selection = []

global.inspector_active = false

global.global_inspector_active = false
global.global_inspector_selected_obj = -500
global.read_only_var_names = ["id", "object_index", "xprevious", "yprevious", "sprite_xoffset", "sprite_yoffset", "sprite_width", "sprite_height", "image_number", "mask_index", "bbox_top", "bbox_bottom", "bbox_left", "bbox_right", "path_positionprevious", "path_endaction", "in_sequence", "sequence_instance", "Physics"]
global.var_names_to_auto_get_at_start = ["x", "y", "image_xscale", "image_yscale"]
global.var_names_to_auto_get_at_end = ["sprite_index", "image_index", "image_speed", "image_alpha", "image_blend", "image_angle", "object_index", "visible", "solid", "persistent", "hspeed", "vspeed", "xprevious", "yprevious", "sprite_xoffset", "sprite_yoffset", "image_number", "depth", "layer", "alarm", "direction", "friction", "gravity", "gravity_direction", "id", "mask_index", "bbox_top", "bbox_bottom", "bbox_left", "bbox_right", "path_positionprevious", "path_endaction", "in_sequence", "sequence_instance", "Physics"]
global.recently_selected_objs = ds_list_create()

/*
[
    name,
    body,
    shell,
    outline,
    eye,
    death,
    spotlight
    spotlight_dark,
    flare,
    trail,
    hat
]
*/


global.preset_character_data = [
    [
        "Default Snail",
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -1,
        -2
    ],
    [
        "Poop Snail",
        70,
        58,
        0,
        51,
        65535,
        32,
        13,
        26,
        23115,
        6
    ],
    [
        "Unicorn",
        real("9.17518e+06"),
        real("4.91528e+06"),
        real("2.09718e+06"),
        real("3.34239e+06"),
        real("1.67119e+07"),
        real("4.19437e+06"),
        real("1.70396e+06"),
        real("3.34239e+06"),
        real("8.38874e+06"),
        2
    ],
    [
        "Festive Shelly",
        140,
        29440,
        32,
        -1,
        65535,
        16448,
        6682,
        13107,
        32896,
        4
    ],
    [
        "Prototype Shelly",
        35980,
        real("1.91909e+06"),
        0,
        -1,
        65280,
        0,
        0,
        0,
        128,
        -2
    ]
]

prevMouseInInspector = false

#orig#()
