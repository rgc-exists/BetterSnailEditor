using System.Diagnostics.CodeAnalysis;

using GmmlHooker;


using GmmlPatcher;

using WysApi.Api;

using WysModMenu;

using UndertaleModLib;
using UndertaleModLib.Models;
using static WysApi.Api.Menus;
using System.Globalization;
using System;
using System.Reflection;

namespace BetterSnailEditor;

public partial class GameMakerMod
{

    public Dictionary<string, string> files = new Dictionary<string, string>();


    public UndertaleData data = null;

    public void Load(int audioGroup, UndertaleData data_source)
    {
        data = data_source;

        Console.WriteLine("Loading code from files...");

        string assemblyFolder = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);

        LoadFromFiles(assemblyFolder);

        Console.WriteLine("Adding Objects...");

        AddObjects();

        Console.WriteLine("Adding Code...");
        AddCode();

        Console.WriteLine("Adding Menu Items... (Thanks to Config for the very useful WYS menu API! :D)");
        AddMenuItems();

        Console.WriteLine("Building Rooms...");
        BuildRooms();

        Console.WriteLine("Done editing data!");

        //return data;

    }

    public void AddObjects()
    {

    }

    public void AddCode()
    {
        CreateFunctionFromFile("scr_initialize_BSE_settings.gml", "scr_initialize_BSE_settings");
        CreateFunctionFromFile("scr_draw_global_inspector_UI.gml", "scr_draw_global_inspector_UI", 5);
        CreateFunctionFromFile("scr_draw_wires_copy_preview.gml", "scr_draw_wires_copy_preview", 5);
        CreateFunctionFromFile("scr_write_text.gml", "scr_write_text", 2);
        CreateFunctionFromFile("scr_reset_BSE_settings.gml", "scr_reset_BSE_settings", 2);
        CreateFunctionFromFile("scr_reset_keybindings.gml", "scr_reset_keybindings", 2);
        CreateFunctionFromFile("scr_reset_vanilla_settings.gml", "scr_reset_vanilla_settings", 2);
        CreateFunctionFromFile("scr_show_hitboxes.gml", "scr_show_hitboxes", 2);
        CreateFunctionFromFile("scr_show_hitboxes_ini.gml", "scr_show_hitboxes_ini", 2);
        CreateFunctionFromFile("scr_set_autosave.gml", "scr_set_autosave", 1);
        CreateFunctionFromFile("scr_preselect_autosave.gml", "scr_preselect_autosave");
        CreateFunctionFromFile("scr_go_to_music_player.gml", "scr_go_to_music_player");
        CreateFunctionFromFile("scr_manage_music_player.gml", "scr_manage_music_player");
        CreateFunctionFromFile("scr_set_global_var_to_color.gml", "scr_set_global_var_to_color", 3);
        CreateFunctionFromFile("scr_set_global_var_to_color_raw.gml", "scr_set_global_var_to_color_raw", 1);
        CreateFunctionFromFile("scr_save_character.gml", "scr_save_character", 1);
        CreateFunctionFromFile("scr_load_character.gml", "scr_load_character", 1);
        HookFunctionFromFile("workshop_save_level_screenshot.gml", "workshop_save_level_screenshot");
        HookFunctionFromFile("scr_update_power_grid.gml", "scr_update_power_grid");
        HookFunctionFromFile("scr_reset_all_settings.gml", "scr_reset_all_settings");
        HookFunctionFromFile("scr_save_game.gml", "scr_save_game");
        HookFunctionFromFile("scr_change_gamespeed.gml", "scr_change_gamespeed");
        HookFunctionFromFile("toolrotate_replacement.gml", "toolrotate_90degrees");
        HookFunctionFromFile("toolrotate_replacement.gml", "toolrotate_30degrees");
        HookFunctionFromFile("toolrotate_replacement.gml", "toolrotate_flip_horizontal");
        HookFunctionFromFile("toolrotate_replacement.gml", "toolrotate_flip_vertical");
        HookFunctionFromFile("toolrotate_replacement.gml", "toolrotate_impossible");
        HookFunctionFromFile("toolplace_fill_with_blocks.gml", "toolplace_fill_with_blocks");
        HookFunctionFromFile("toolplace_one_at_a_time_placement.gml", "toolplace_one_at_a_time_placement");
        HookFunctionFromFile("toolplace_fill_with_wall_blocks_noszielimit.gml", "toolplace_fill_with_wall_blocks_noszielimit");
        HookFunctionFromFile("scr_airep_normal.gml", "scr_airep_normal");
        HookFunctionFromFile("scr_ai_rep_to_screen_center_at_levelstart.gml", "scr_ai_rep_to_screen_center_at_levelstart");
        HookFunctionFromFile("scr_ai_rep_to_screen_center.gml", "scr_ai_rep_to_screen_center");
        HookFunctionFromFile("leveleditor_save.gml", "leveleditor_save");
        HookFunctionFromFile("scr_load_settings.gml", "scr_load_settings");
        HookFunctionFromFile("scr_save_settings.gml", "scr_save_settings");
        HookFunctionFromFile("scr_save_settings_exists.gml", "scr_save_settings_exists");
        HookFunctionFromFile("toolplace_copy_paste.gml", "toolplace_copy_paste");
        HookFunctionFromFile("toolplace_copy_blocks_all_in_rect.gml", "toolplace_copy_blocks_all_in_rect");
        HookFunctionFromFile("get_tool_sprite.gml", "get_tool_sprite");
        HookFunctionFromFile("toolplace_delete_blocks_of_same_type.gml", "toolplace_delete_blocks_of_same_type");
        HookFunctionFromFile("leveleditor_load.gml", "leveleditor_load");
        HookFunctionFromFile("scr_player_death.gml", "scr_player_death");
        HookFunctionFromFile("scr_fade_to_editor.gml", "scr_fade_to_editor");
        HookFunctionFromFile("toolplace_singleton_placement.gml", "toolplace_singleton_placement");
        HookFunctionFromFile("toolplace_delete_paths_of_same_path_id.gml", "toolplace_delete_paths_of_same_path_id");
        HookFunctionFromFile("toolplace_delete_trigger_blocks_of_same_type.gml", "toolplace_delete_trigger_blocks_of_same_type");
        HookFunctionFromFile("toolplace_delete_wall_blocks.gml", "toolplace_delete_wall_blocks");
        HookFunctionFromFile("toolplace_fill_with_stripes.gml", "toolplace_fill_with_stripes");
        HookFunctionFromFile("toolplace_fill_with_wall_blocks.gml", "toolplace_fill_with_wall_blocks");
        HookFunctionFromFile("scr_move_like_a_snail.gml", "scr_move_like_a_snail");
        HookFunctionFromFile("try_commenting_on_player_hats.gml", "try_commenting_on_player_hats");
        HookFunctionFromFile("loca_sound.gml", "loca_sound");
        HookFunctionFromFile("clear_existing_level.gml", "clear_existing_level");
        //HookFunctionFromFile("hlp_collision_point_search.gml", "hlp_collision_point_search");
        //HookFunctionFromFile("scr_load_empty_game.gml", "scr_load_empty_game");
        HookCodeFromFile("gml_Object_obj_level_select_blockage_Create_0.gml", "gml_Object_obj_level_select_blockage_Create_0");
        HookCodeFromFile("gml_Object_obj_level_editor_Step_0.gml", "gml_Object_obj_level_editor_Step_0");
        HookCodeFromFile("gml_Object_obj_music_parent_Step_0.gml", "gml_Object_obj_music_parent_Step_0");
        HookCodeFromFile("gml_Object_obj_performance_test_snail_Step_0.gml", "gml_Object_obj_performance_test_snail_Step_0");
        HookCodeFromFile("gml_Object_obj_player_Create_0.gml", "gml_Object_obj_player_Create_0");
        HookCodeFromFile("gml_Object_obj_aivl_parent_Other_10.gml", "gml_Object_obj_aivl_parent_Other_10");
        HookCodeFromFile("gml_Object_obj_aivl_parent_Step_0.gml", "gml_Object_obj_aivl_parent_Step_0");
        HookCodeFromFile("gml_Object_obj_td_core_Collision_obj_td_enemy.gml", "gml_Object_obj_td_core_Collision_obj_td_enemy");
        HookCodeFromFile("gml_Object_obj_ai_eye_Draw_0.gml", "gml_Object_obj_ai_eye_Draw_0");
        //HookCodeFromFile("gml_Object_obj_fx_constant_Create_0.gml", "gml_Object_obj_fx_constant_Create_0");
        //HookCodeFromFile("gml_Object_obj_fx_jump_air_Create_0.gml", "gml_Object_obj_fx_jump_air_Create_0");
        //HookCodeFromFile("gml_Object_obj_fx_jump_Create_0.gml", "gml_Object_obj_fx_jump_Create_0");
        CreateFunctionFromFile("scr_models_tool_load_model.gml", "scr_models_tool_load_model");
        CreateFunctionFromFile("scr_models_tool_place_model.gml", "scr_models_tool_place_model", 2);
        CreateFunctionFromFile("scr_models_tool_save_model.gml", "scr_models_tool_save_model", 2);
        CreateFunctionFromFile("scr_return_exploration_mode_as_text.gml", "scr_return_exploration_mode_as_text");
        CreateFunctionFromFile("scr_set_snailax_full.gml", "scr_set_snailax_full", 1);
        CreateFunctionFromFile("scr_preselect_snailax_full.gml", "scr_preselect_snailax_full");
        CreateFunctionFromFile("scr_set_voiceline_mode.gml", "scr_set_voiceline_mode", 1);
        CreateFunctionFromFile("scr_set_snailax_forever.gml", "scr_set_snailax_forever", 1);
        CreateFunctionFromFile("scr_preselect_snailax_forever.gml", "scr_preselect_snailax_forever");
        CreateFunctionFromFile("scr_set_unlimited_fps.gml", "scr_set_unlimited_fps", 1);
        CreateFunctionFromFile("scr_preselect_unlimited_fps.gml", "scr_preselect_unlimited_fps", 1);
        CreateFunctionFromFile("scr_set_squid_in_editor.gml", "scr_set_squid_in_editor", 1);
        CreateFunctionFromFile("scr_set_squid_constant_opacity.gml", "scr_set_squid_constant_opacity", 1);
        CreateFunctionFromFile("scr_preselect_squid_constant_opacity.gml", "scr_preselect_squid_constant_opacity");
        CreateFunctionFromFile("scr_preselect_squid_in_editor.gml", "scr_preselect_squid_in_editor");
        CreateFunctionFromFile("scr_set_epilepsy_warning.gml", "scr_set_epilepsy_warning", 1);
        CreateFunctionFromFile("scr_set_show_hitboxes.gml", "scr_set_show_hitboxes", 1);
        CreateFunctionFromFile("scr_preselect_epilepsy_warning.gml", "scr_preselect_epilepsy_warning");
        CreateFunctionFromFile("scr_preselect_show_hitboxes.gml", "scr_preselect_show_hitboxes");
        CreateFunctionFromFile("scr_return_multiframe_loading.gml", "scr_return_multiframe_loading");
        CreateFunctionFromFile("scr_menu_play_BSE_credits.gml", "scr_menu_play_BSE_credits");
        CreateFunctionFromFile("scr_set_default_hat.gml", "scr_set_default_hat");
        CreateFunctionFromFile("scr_set_save_hat.gml", "scr_set_save_hat");
        CreateFunctionFromFile("scr_select_preset_character.gml", "scr_select_preset_character", 1);
        CreateFunctionFromFile("scr_inspector_select_blocks_in_rect.gml", "scr_inspector_select_blocks_in_rect", 2);
        CreateFunctionFromFile("scr_temp_models_tool_warning.gml", "scr_temp_models_tool_warning", 2);
        HookFunctionFromFile("leveleditor_database_ini.gml", "leveleditor_database_ini");
        HookCodeFromFile("gml_Object_obj_level_editor_Draw_64.gml", "gml_Object_obj_level_editor_Draw_64");
        HookCodeFromFile("gml_Object_obj_music_GameStart_Other_10.gml", "gml_Object_obj_music_GameStart_Other_10");
        HookCodeFromFile("gml_Object_obj_level_editor_Create_0.gml", "gml_Object_obj_level_editor_Create_0");
        HookCodeFromFile("gml_Object_obj_ai_eye_Step_0.gml", "gml_Object_obj_ai_eye_Step_0");
        HookCodeFromFile("gml_Object_obj_mouse_controller_Draw_64.gml", "gml_Object_obj_mouse_controller_Draw_64");
        HookCodeFromFile("gml_Object_obj_persistent_Step_0.gml", "gml_Object_obj_persistent_Step_0");
        HookCodeFromFile("gml_Object_obj_persistent_Step_2.gml", "gml_Object_obj_persistent_Step_2");
        HookCodeFromFile("gml_Object_obj_persistent_Create_0.gml", "gml_Object_obj_persistent_Create_0");
        HookCodeFromFile("gml_Object_obj_persistent_Draw_64.gml", "gml_Object_obj_persistent_Draw_64");
        HookCodeFromFile("gml_Object_obj_camera_control_level_editor_Step_2.gml", "gml_Object_obj_camera_control_level_editor_Step_2");
        HookCodeFromFile("gml_Object_obj_universe_Draw_0.gml", "gml_Object_obj_universe_Draw_0");
        HookCodeFromFile("gml_Object_obj_light_stars_background_Draw_0.gml", "gml_Object_obj_light_stars_background_Draw_0");
        HookCodeFromFile("gml_Object_obj_light_ocean_background_zoom_out_Draw_0.gml", "gml_Object_obj_light_ocean_background_zoom_out_Draw_0");
        HookCodeFromFile("gml_Object_obj_light_Step_0.gml", "gml_Object_obj_light_Step_0");
        HookCodeFromFile("gml_Object_obj_light_Draw_0.gml", "gml_Object_obj_light_Draw_0");
        HookCodeFromFile("gml_Object_obj_light_ocean_background_Draw_0.gml", "gml_Object_obj_light_ocean_background_Draw_0");
        HookCodeFromFile("gml_Object_obj_ai_representation_Step_0.gml", "gml_Object_obj_ai_representation_Step_0");
        HookCodeFromFile("gml_Object_obj_post_processing_draw_Draw_74.gml", "gml_Object_obj_post_processing_draw_Draw_74");
        HookCodeFromFile("gml_Object_obj_backdraw_Draw_0.gml", "gml_Object_obj_backdraw_Draw_0");
        HookCodeFromFile("gml_Object_obj_menu_instance_Draw_0.gml", "gml_Object_obj_menu_instance_Draw_0");
        HookCodeFromFile("gml_RoomCC_EndGameCredits_0_Create.gml", "gml_RoomCC_EndGameCredits_0_Create");
        HookCodeFromFile("gml_Object_obj_music_level_editor_Other_10.gml", "gml_Object_obj_music_level_editor_Other_10");
        HookCodeFromFile("gml_Object_obj_player_Other_10.gml", "gml_Object_obj_player_Other_10");
        HookCodeFromFile("gml_Object_obj_spotlight_drawer_Draw_0.gml", "gml_Object_obj_spotlight_drawer_Draw_0");
        HookCodeFromFile("gml_Object_obj_levelstyler_Create_0.gml", "gml_Object_obj_levelstyler_Create_0");
        HookCodeFromFile("gml_Object_obj_level_editor_Draw_0.gml", "gml_Object_obj_level_editor_Draw_0");
        //HookCodeFromFile("gml_Object_obj_human_kill_drone_Create_0.gml", "gml_Object_obj_human_kill_drone_Create_0");
        HookCodeFromFile("gml_Object_obj_ball_Step_1.gml", "gml_Object_obj_ball_Step_1");
        SetObjectCodeFromFile("gml_Object_obj_level_editor_GameEnd_0.gml", "obj_level_editor", EventType.Other, EventSubtypeOther.GameEnd);
        SetObjectCodeFromFile("gml_Object_obj_persistent_Other_62.gml", "obj_persistent", EventType.Other, EventSubtypeOther.AsyncHTTP);
        SetObjectCodeFromFile("gml_Object_obj_credits_renderer_Draw_64.gml", "obj_credits_renderer", EventType.Draw, EventSubtypeDraw.DrawGUI);
        SetObjectCodeFromFile("gml_Object_obj_lvlobj_parent_CleanUp_0.gml", "obj_lvlobj_parent", EventType.Draw, EventSubtypeDraw.DrawGUI);
        SetObjectCodeFromFile("gml_Object_obj_persistent_Draw_73.gml", "obj_persistent", EventType.Draw, EventSubtypeDraw.DrawEnd);
        SetObjectCodeFromFile("gml_Object_obj_td_enemy_Step_0.gml", "obj_td_enemy", EventType.Step, EventSubtypeStep.Step);
        SetObjectCodeFromFile("gml_Object_obj_level_editor_Alarm_1.gml", "obj_level_editor", EventType.Alarm, 1);
        HookCodeFromFile("gml_Object_obj_menu_Hacks_Other_10.gml", "gml_Object_obj_menu_Hacks_Other_10");
        HookCodeFromFile("gml_Object_obj_start_screen_save_slot_Step_0.gml", "gml_Object_obj_start_screen_save_slot_Step_0");
        HookCodeFromFile("gml_Object_obj_level_selection_Create_0.gml", "gml_Object_obj_level_selection_Create_0");
        HookCodeFromFile("gml_Object_obj_dialog_file_Alarm_0.gml", "gml_Object_obj_dialog_file_Alarm_0");
        HookCodeFromFile("gml_Object_obj_epilepsy_warning_Step_1.gml", "gml_Object_obj_epilepsy_warning_Step_1");
        HookCodeFromFile("gml_Object_obj_epilepsy_warning_Draw_0.gml", "gml_Object_obj_epilepsy_warning_Draw_0");
        HookCodeFromFile("gml_Object_obj_epilepsy_warning_Create_0.gml", "gml_Object_obj_epilepsy_warning_Create_0");
        HookCodeFromFile("gml_Object_obj_credits_renderer_CleanUp_0.gml", "gml_Object_obj_credits_renderer_CleanUp_0");
        HookCodeFromFile("gml_Object_obj_credits_renderer_Create_0.gml", "gml_Object_obj_credits_renderer_Create_0");
        HookCodeFromFile("gml_Object_obj_credits_renderer_Draw_0.gml", "gml_Object_obj_credits_renderer_Draw_0");
        HookCodeFromFile("gml_Object_obj_credits_renderer_Step_0.gml", "gml_Object_obj_credits_renderer_Step_0");
        HookCodeFromFile("gml_Object_obj_ball_Other_10.gml", "gml_Object_obj_ball_Other_10");
        HookCodeFromFile("gml_Object_obj_persistent_Other_10.gml", "gml_Object_obj_persistent_Other_10");
        HookCodeFromFile("gml_Object_obj_fx_death_bounce_Step_0.gml", "gml_Object_obj_fx_death_bounce_Step_0");
        HookCodeFromFile("gml_Object_obj_fx_death_bounce_Step_0.gml", "gml_Object_obj_fx_death_bounce_Step_0");
        HookCodeFromFile("gml_Object_obj_fx_death_Create_0.gml", "gml_Object_obj_fx_death_Create_0");
        HookCodeFromFile("gml_Object_obj_fx_death_Step_0.gml", "gml_Object_obj_fx_death_Step_0");
        HookCodeFromFile("gml_Object_obj_antenna_Collision_obj_player.gml", "gml_Object_obj_antenna_Collision_obj_player");
        HookCodeFromFile("gml_Object_obj_campaign_select_spawner_Create_0.gml", "gml_Object_obj_campaign_select_spawner_Create_0");
        CreateFunctionFromFile("scr_set_blood.gml", "scr_set_blood", 1);
        CreateFunctionFromFile("scr_preselect_blood.gml", "scr_preselect_blood");

    }

    public void AddMenuItems()
    {

        UndertaleGameObject specialMenu = data.CreateMenu("special");
        data.InsertMenuOptionFromEnd(Menus.Vanilla.Settings, 1, new Menus.WysMenuOption("\"Special\"")
        {
            instance = specialMenu.Name.Content
        });


        UndertaleGameObject funMenu = data.CreateMenu("funMenu");
        data.InsertMenuOptionFromEnd(specialMenu.Name.Content, 0, new Menus.WysMenuOption("\"Novelties & Jokes\"")
        {
            instance = funMenu.Name.Content
        });


        data.AddMenuOption("obj_menu_ExplorationMode", new WysMenuOption("\"Extra\"", script: "gml_Script_scr_set_explore_mode", scriptArgument: "2", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Unlocks ALL levels and dialog springs, INCLUDING secrets.\""));
        data.AddMenuOption("obj_menu_StayInBack", new WysMenuOption("\"Stay In FOREGROUND\"", script: "gml_Script_scr_set_stay_in_back_gml_Object_obj_menu_StayInBack_Other_10", scriptArgument: "2", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Makes it so squid ALWAYS stays in the foreground, and never goes into the background.\""));
        //UndertaleGameObject squidInEditorMenu =
        UndertaleGameObject levelEditorMenu = data.CreateMenu("level_editor", data.CreateToggleOption("\"Squid In Editor\"", "squidInEditorMenu", "global.setting_squid_in_editor = argument0", "selectedItem = global.setting_squid_in_editor", "global.setting_squid_in_editor", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Have squid present in your editor. He will not talk, but he will keep you company while you build.\""));
        data.InsertMenuOptionFromEnd(Menus.Vanilla.Settings, 2, new Menus.WysMenuOption("\"Level Editor\"")
        {
            instance = levelEditorMenu.Name.Content
        });
        UndertaleGameObject advancedEditorMenu = data.CreateMenu("advanced_editor", data.CreateChangeOption("\"Objects Per Frame (Multi-frame Level Loading)\"", "obj_menu_multiframe_loading", @"
        if(global.setting_multiframe_loading == 50 && argument0 < 0){
            global.setting_multiframe_loading = 0
        } else {
            global.setting_multiframe_loading = clamp(global.setting_multiframe_loading + argument0, 50, 10000)
        }",
        @"
        if(global.setting_multiframe_loading > 0)
            return string(global.setting_multiframe_loading)
        else
            return ""OFF (All objects load in one frame.)""
        ", 50), data.CreateChangeOption("\"Wires Per Frame (Only works with OBJECTS PER FRAME)\"", "obj_menu_multiframe_loading_wires", @"
            global.setting_multiframe_loading_wires = clamp(global.setting_multiframe_loading_wires + argument0, 50, 10000)
",
        @"
        if(global.setting_multiframe_loading_wires > 0)
            return string(global.setting_multiframe_loading_wires)
        else
            return ""OFF (All objects load in one frame.)""
        ", 50), data.CreateToggleOption("\"Optimized Wires (EXPERIMENTAL)\"", "optimized_wires", "global.setting_optimized_wires = argument0", "selectedItem = global.setting_optimized_wires", "global.setting_optimized_wires", "gml_Script_scr_return_input", "\"This feature is mainly designed for incredibly large and complex contraptions and probably won't affect the average wire puzzle.\n\n\nNOTE: In the vanilla game, and gates put in a chain will activate one frame at a time UNLESS you connect them in the order they were placed.\nWith the optimized wire system they ALWAYS go one frame at a time.\""));
        data.InsertMenuOptionFromEnd(levelEditorMenu.Name.Content, 1, new Menus.WysMenuOption("\"Advanced\"")
        {
            instance = advancedEditorMenu.Name.Content
        });
        UndertaleGameObject editorCameraMenu = data.CreateMenu("editor_camera", data.CreateChangeOption("\"Minimum Zoom\"", "obj_menu_camera_min_zoom",
        @"global.setting_camzoom_min = clamp(global.setting_camzoom_min + argument0, 0.05, 500)",
        @"return string(global.setting_camzoom_min * 100)", 0.5), data.CreateChangeOption("\"Maximum Zoom\"", "obj_menu_camera_max_zoom",
        @"global.setting_camzoom_max = clamp(global.setting_camzoom_max + argument0, 0.05, 500)",
        @"return string(global.setting_camzoom_max * 100)", 0.5));
        data.InsertMenuOptionFromEnd(levelEditorMenu.Name.Content, 1, new Menus.WysMenuOption("\"Camera\"")
        {
            instance = editorCameraMenu.Name.Content
        });
        data.InsertMenuOption(Menus.Vanilla.More, 3, data.CreateToggleOption("\"Epilepsy Warning\"", "epilepsy_warning", "gml_Script_scr_set_epilepsy_warning(argument0)", "gml_Script_scr_preselect_epilepsy_warning()", "global.setting_epilepsy_warning", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Having this off will skip the epilepsy warning you get at the beginning of the game.\""));
        data.InsertMenuOption(Menus.Vanilla.Extras, 2, data.CreateToggleOption("\"Show Hitboxes\"", "epilepsy_warning", "gml_Script_scr_set_show_hitboxes(argument0)", "gml_Script_scr_preselect_show_hitboxes()", "global.show_hitboxes", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Show the hitboxes of most solid objects, triggers,and interactive objects.\""));
        data.InsertMenuOption(Menus.Vanilla.More, 3, data.CreateToggleOption("\"Skip Title Animation\"", "skip_title_anim", "global.setting_skip_title_animation = argument0", "selectedITem = global.setting_skip_title_animation", "global.setting_skip_title_animation", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Skip the title screen animation from when you load a save file.\""));
        data.InsertMenuOption(Menus.Vanilla.SquidVisuals, 3, data.CreateToggleOption("\"Constant Opacity\"", "squid_constant_opacity", "gml_Script_scr_set_squid_constant_opacity(argument0)", "scr_preselect_squid_constant_opacity()", "global.setting_squid_constant_opacity", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Change whether or not squid becomes less visible when being silent.\""));
        data.AddMenuOption(Menus.Vanilla.Graphics, data.CreateChangeOption("\"Intense Background Intensity\"", "intenseBackgrounda", "global.setting_intense_backgrounds = clamp(global.setting_intense_backgrounds + argument0, 0, 1)", "return string_replace(string(global.setting_intense_backgrounds * 100), \".00\", \"\") + \"%\" ", 0.1));


        UndertaleGameObject spoilersMenu = data.CreateMenu("menu_spoilers", data.CreateToggleOption("\"Inverted Pump\"", "inverted_pump", "global.save_pump_is_inverted = argument0", "selectedItem = global.save_pump_is_inverted", "global.save_pump_is_inverted", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Change the state of the pump. (If you don't know what this is, ignore it. It is a spoiler.)\""), data.CreateToggleOption("\"Fixed Heart Mode\"", "heart_fixed", "global.save_heart_fixed = argument0", "selectedItem = global.save_heart_fixed", "global.save_heart_fixed", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Change whether or not squid's heart is fixed. (If you don't know what this is, ignore it. It is a spoiler.)\""));
        data.InsertMenuOptionFromEnd(Menus.Vanilla.Hacks, 0, new Menus.WysMenuOption("\"Spoilers\"")
        {
            instance = spoilersMenu.Name.Content
        });

        UndertaleGameObject invincibilityMenu = data.CreateMenu("menu_invincibility_hacks",
            data.CreateToggleOption("\"Player Invincibility\"", "invincibility", "global.invincible_mode = argument0", "selectedItem = global.invincible_mode", "global.invincible_mode", "gml_Script_scr_return_input", "\"Makes it so shelly can't die.\n\nNOTE: Even with the setting on, the player will still die when the self destruct button is pressed unless SELF DESTRUCT INVINCIBILITY is turned on.\""),
            data.CreateToggleOption("\"Self Destruct Invincibility\"", "restart_invincibility", "global.restart_invincible_mode = argument0", "selectedItem = global.restart_invincible_mode", "global.restart_invincible_mode", "gml_Script_scr_return_input", "\"Controls whether or not the self destruct button works.\n\nNOTE: Even with normal invincibility on, the player will still die to a restart if this setting is off.\""),
            data.CreateToggleOption("\"Ball Invincibility\"", "ball_invincibility", "global.ball_invincible_mode = argument0", "selectedItem = global.ball_invincible_mode", "global.ball_invincible_mode", "gml_Script_scr_return_input", "\"Makes it so the basketball cannot pop.\""),
            data.CreateToggleOption("\"Tower Defense Invincibility\"", "td_invincibility", "global.td_invincible_mode = argument0", "selectedItem = global.td_invincible_mode", "global.td_invincible_mode", "gml_Script_scr_return_input", "\"Makes it so you don't die when TD cores break.\"")
        );
        data.InsertMenuOptionFromEnd(Menus.Vanilla.Hacks, 0, new Menus.WysMenuOption("\"Invincibilty\"")
        {
            instance = invincibilityMenu.Name.Content
        });
        data.AddMenuOption(Menus.Vanilla.Hacks, data.CreateToggleOption("\"Infinite Double Jumps\"", "infinite_jumps", "global.infinite_jumps = argument0", "selectedItem = global.infinite_jumps", "global.infinite_jumps", "gml_Script_scr_return_input", "\"Gives shelly infinite double jumps\""));

        data.AddMenuOption(funMenu.Name.Content, data.CreateToggleOption("\"Rendering Altogether\"", "enable_rendering", "global.rendering_enabled = argument0", "selectedItem = global.rendering_enabled", "global.rendering_enabled", "gml_Script_scr_return_input", "\"\\\"You want to disable rendering altogether? If you say so. It's running on 60 FPS we did it yaaay!\\\"\""));

        data.AddMenuOption(Menus.Vanilla.AdvancedGraphics, data.CreateToggleOption("\"Unlimited FPS (IDK if this does anything)\"", "unlimited_fps", "scr_set_unlimited_fps(argument0)", "scr_preselect_unlimited_fps()", "obj_persistent.unlimited_frame_rate", "gml_Script_scr_return_input", "\"Makes it so your framerate can go as high as you want. (I ACTUALLY HAVE NO CLUE IF THIS DOES ANYTHING BUT IT WAS IN THE CODE OF THE GAME SO WHY NOT.)\""));

        data.AddMenuOption("obj_menu_wysapi_level_editor", data.CreateToggleOption("\"\\\"Press O for hotkeys\\\" message\"", "press_for_hotkeys", "global.setting_show_hotkeys_overlay = argument0", "selectedItem = global.setting_show_hotkeys_overlay", "global.setting_show_hotkeys_overlay", "gml_Script_scr_return_input", "\"Turn on/off the \\\"Press O to show list of BSE-Exclusive Hotkeys\\\" overlay that shows when you enter the editor.\""));
        UndertaleGameObject bseCredits = data.CreateMenu("BSE_credits", new WysMenuOption("\"Better Snail Editor Credits\"", Menus.Vanilla.More, "gml_Script_scr_menu_play_BSE_credits()", null, "gml_Script_scr_return_input", "\"Play the credits for Better Snail Editor\""));
        data.InsertMenuOptionFromEnd(Menus.Vanilla.More, 1, new Menus.WysMenuOption("\"Better Snail Editor Credits\"")
        {
            instance = bseCredits.Name.Content
        });

        data.AddMenuOption("obj_menu_wysapi_level_editor", data.CreateToggleOption("\"Place Multiple Players\"", "place_multiple_players", "global.setting_place_multiple_players = argument0", "selectedItem = global.setting_place_multiple_players", "global.setting_place_multiple_players", "gml_Script_scr_return_input", "\"Turn on to disable the feature that removes existing player objects when you place a new one. Useful for double shelly levels.\""));
        data.AddMenuOption("obj_menu_wysapi_level_editor", data.CreateToggleOption("\"Place Multiple 1-At-A-Time Objects\"", "place_multiple_1atATimeObjs", "global.setting_place_multiple_oneAtATime_objs = argument0", "selectedItem = global.setting_place_multiple_oneAtATime_objs", "global.setting_place_multiple_oneAtATime_objs", "gml_Script_scr_return_input", "\"Turn on to disable the feature that removes existing instances of certain objects when you place a new one. Useful for double shelly levels. (Includes the player object.)\""));
        //data.AddMenuOption("obj_menu_wysapi_level_editor", data.CreateToggleOption("\"FULLY Reset New Levels\"", "full_reset_new_levels", "global.setting_fully_reset_new_levels = argument0", "selectedItem = global.setting_fully_reset_new_levels", "global.setting_fully_reset_new_levels", "gml_Script_scr_return_input", "\"With this on, new levels will no longer have the quick slots and level size transferred over from the level you were previously editing.\""));
        data.AddMenuOption("obj_menu_wysapi_level_editor", data.CreateToggleOption("\"Custom Thumbnails\"", "custom_thumbnails", "global.setting_custom_thumbnails = argument0", "selectedItem = global.setting_custom_thumbnails", "global.setting_custom_thumbnails", "gml_Script_scr_return_input", "\"With this on, you will be asked if you want to pick a custom thumbnail every time you press the \\\"upload to steamworks\\\" button.\""));
        data.AddMenuOption("obj_menu_wysapi_level_editor", data.CreateToggleOption("\"Campaign Exploration Mode\"", "campaign_exploration_mode", "global.setting_campaign_exploration_mode = argument0", "selectedItem = global.setting_campaign_exploration_mode", "global.setting_campaign_exploration_mode", "gml_Script_scr_return_input", "\"Unlocks ALL levels in custom campaigns so you don't have to unlock them. DOES NOT ruin validity of main save file.\""));

        /*
        UndertaleGameObject ResetVanillaSettings = data.CreateMenu("Reset_Vanilla_Settings", new WysMenuOption("\"Reset Vanilla Settings\"", Menus.Vanilla.More, "gml_Script_scr_reset_vanilla_settings()", null, "gml_Script_scr_return_input", "\"Reset all settings that are included in the original game (not added with mods).\""));
        data.InsertMenuOptionFromEnd(Menus.Vanilla.More, 5, new Menus.WysMenuOption("\"Reset Vanilla Settings\"")
        {
            instance = ResetVanillaSettings.Name.Content
        });
        */

        /*
        UndertaleGameObject ResetBSESettings = data.CreateMenu("Reset_BSE_Settings", new WysMenuOption("\"Reset Better Snail Editor Settings\"", Menus.Vanilla.More, "gml_Script_scr_reset_BSE_settings()", null, "gml_Script_scr_return_input", "\"Reset all settings that were added with Better Snail Editor.\""));
        data.InsertMenuOptionFromEnd(Menus.Vanilla.More, 5, new Menus.WysMenuOption("\"Reset Better Snail Editor Settings\"")
        {
            instance = ResetVanillaSettings.Name.Content
        });
        */

        UndertaleGameObject ResetKeybindings = data.CreateMenu("Reset_Keybindings", new WysMenuOption("\"Reset Keybindings\"", Menus.Vanilla.More, "gml_Script_scr_reset_keybindings()", null, "gml_Script_scr_return_input", "\"Restore the controls of the game to their defaults.\""));
        data.InsertMenuOptionFromEnd("obj_menu_Controls", 0, new Menus.WysMenuOption("\"Reset Keybindings\"")
        {
            instance = ResetKeybindings.Name.Content
        });

        data.InsertMenuOption(levelEditorMenu.Name.Content, 3, data.CreateToggleOption("\"Ask for save upon exiting\"", "ask_for_save", "gml_Script_scr_set_autosave(argument0)", "gml_Script_scr_preselect_autosave()", "global.setting_autosave_level", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"With this on, the game will ask you if you would like to save your level when you close the game without the menu. For example, if you have your game set to windowed mode and click the \\\"X\\\" button in the corner of the window, the game will ask you if you want to save your level in case you accidentally pressed it.\""));

        
        UndertaleGameObject editorEasterEggs = data.CreateMenu("editor_easter_eggs", data.CreateToggleOption("\"Snailax Easter Egg FULL VERSION\"", "snailax_full", "gml_Script_scr_set_snailax_full(argument0)", "gml_Script_scr_preselect_snailax_full()", "global.setting_snailax_full", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Plays the FULL Snailax OST when you type S-N-A-I-L-A-X on your keyboard.\""), data.CreateToggleOption("\"Snailax FOREVER\"", "snailax_forever", "gml_Script_scr_set_snailax_forever(argument0)", "gml_Script_scr_preselect_snailax_forever()", "global.setting_snailax_forever", tooltipScript: "gml_Script_scr_return_input", tooltipArgument: "\"Plays the Snailax OST as a REPLACEMENT for the main editor OST. Also changes the player object to the prototype shelly.\""));
        data.InsertMenuOptionFromEnd(levelEditorMenu.Name.Content, 1, new Menus.WysMenuOption("\"Easter Eggs (SPOILERS)\"")
        {
            instance = editorEasterEggs.Name.Content
        });

        UndertaleGameObject MusicPlayer = data.CreateMenu("Music_Player", new WysMenuOption("\"Soundtrack Player\"", Menus.Vanilla.More, "gml_Script_scr_go_to_music_player()", null, "gml_Script_scr_return_input", "\"Go to the OST music player room\""));
        data.InsertMenuOptionFromEnd(specialMenu.Name.Content, 0, new Menus.WysMenuOption("\"Soundtrack Player\"")
        {
            instance = MusicPlayer.Name.Content
        });

        data.InsertMenuOptionFromEnd(Menus.Vanilla.Hacks, 0, data.CreateChangeOption("\"Player Speed\"", "player_speed", "global.cheat_player_speed = clamp(global.cheat_player_speed + argument0 / 100, 0, 10)", "return string(global.cheat_player_speed * 100) + \"%\"", 10));
        data.InsertMenuOptionFromEnd(Menus.Vanilla.Hacks, 0, data.CreateChangeOption("\"Player Jump Height\"", "player_jump_height", "global.cheat_jump_height = clamp(global.cheat_jump_height + argument0 / 100, 0, 10)", "return string(global.cheat_jump_height * 100) + \"%\"", 10));

        UndertaleGameObject voicelineMode = data.CreateMenu("voiceline_mode",
        new WysMenuOption("\"Default\"", null, "gml_Script_scr_set_voiceline_mode", "0"),
        new WysMenuOption("\"Yo\"", null, "gml_Script_scr_set_voiceline_mode", "1"),
        new WysMenuOption("\"KYS Please\"", null, "gml_Script_scr_set_voiceline_mode", "2"),
        new WysMenuOption("\"HAHAHAHAHAHA!!!!\"", null, "gml_Script_scr_set_voiceline_mode", "3")
        );
        data.InsertMenuOptionFromEnd(Vanilla.Extras, 0, new Menus.WysMenuOption("\"Voiceline Mode\"")
        {
            instance = voicelineMode.Name.Content,
        });

        HookCodeFromFile("gml_Object_obj_menu_wysapi_voiceline_mode_Other_10.gml", "gml_Object_obj_menu_wysapi_voiceline_mode_Other_10");
        

        UndertaleGameObject playerCharMenu = data.CreateMenu("player_character_parent",
            new Menus.WysMenuOption("global.preset_character_data[0][0]", null, "gml_Script_scr_select_preset_character", "0", "gml_Script_scr_return_input", "\"The classic shelly we know and love.\""),
            new Menus.WysMenuOption("global.preset_character_data[1][0]", null, "gml_Script_scr_select_preset_character", "1", "gml_Script_scr_return_input", "\"Squid tried simulating the current state of the US education system and ended up with this snail.\""),
            new Menus.WysMenuOption("global.preset_character_data[2][0]", null, "gml_Script_scr_select_preset_character", "2", "gml_Script_scr_return_input", "\"Squid HATES unicorns! HATES THEM HATES THEM HATES THEM!!!\""),
            new Menus.WysMenuOption("global.preset_character_data[3][0]", null, "gml_Script_scr_select_preset_character", "3", "gml_Script_scr_return_input", "\"Happy holidays! \\\"No! I decide when it's Christmas! Shut up!\\\"\""),
            new Menus.WysMenuOption("global.preset_character_data[4][0]", null, "gml_Script_scr_select_preset_character", "4", "gml_Script_scr_return_input", "\"The snail from the silly little side project that the dev is thinking about calling \\\"Did You Snail\\\" or something.\"")
        );
        data.InsertMenuOptionFromEnd(specialMenu.Name.Content, 0, new Menus.WysMenuOption("\"Player Character\"")
        {
            instance = playerCharMenu.Name.Content
        });

        data.InsertMenuOptionFromEnd(specialMenu.Name.Content, 0, data.CreateToggleOption("\"Unicorn Hat Pops Ball\"", "unicorn_ball_popping", "global.setting_unicorn_horn_ball_override = argument0", "selectedItem = global.setting_unicorn_horn_ball_override", "global.setting_unicorn_horn_ball_override", "gml_Script_scr_return_input", "\"Having this OFF makes it so the unicorn hat DOESN'T pop the ball.\""));

        data.HookCode("gml_Object_" + playerCharMenu.Name.Content + "_Other_10", "#orig#() \n bExecuteScriptsOnSwitch = 1 \n bExecuteScriptsOnExit = 1");
        

        UndertaleGameObject squidColorsMenu = MakeColorMenu("squid_color", "setting_squid_color", 0.5f);
        data.InsertMenuOptionFromEnd(specialMenu.Name.Content, 0, new Menus.WysMenuOption("\"Squid Color\"")
        {
            instance = squidColorsMenu.Name.Content
        });

        UndertaleGameObject playerColorsCustomMenu = data.CreateMenu("player_character");
        data.InsertMenuOptionFromEnd(playerCharMenu.Name.Content, 5, new Menus.WysMenuOption("\"Custom\"")
        {
            instance = playerColorsCustomMenu.Name.Content
        });
        

        UndertaleGameObject curColor = MakeColorMenu("player_body", "setting_player_body", .45f);
        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Body\"")
        {
            instance = curColor.Name.Content
        });
        curColor = MakeColorMenu("player_shell", "setting_player_shell", .55f);
        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Shell\"")
        {
            instance = curColor.Name.Content
        });
        curColor = MakeColorMenu("player_outline", "setting_player_outline", .75f);
        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Outline\"")
        {
            instance = curColor.Name.Content
        });
        curColor = MakeColorMenu("player_eye", "setting_player_eye", .6f);
        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Eye\"")
        {
            instance = curColor.Name.Content
        });
        curColor = MakeColorMenu("player_death", "setting_player_death");
        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Death FX\"")
        {
            instance = curColor.Name.Content
        });
        curColor = MakeColorMenu("player_spotlight", "setting_player_spotlight", 0.75f);
        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Spotlight (Bright)\"")
        {
            instance = curColor.Name.Content
        });
        curColor = MakeColorMenu("player_spotlight_dark", "setting_player_spotlight_dark", 0.9f);
        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Spotlight (Dark)\"")
        {
            instance = curColor.Name.Content
        });
        curColor = MakeColorMenu("player_flare", "setting_player_flare", .8f);
        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Flare\"")
        {
            instance = curColor.Name.Content
        });
        curColor = MakeColorMenu("player_trail", "setting_player_trail", .5f);
        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Trail\"")
        {
            instance = curColor.Name.Content
        });

        curColor = data.CreateMenu("player_save_hat");
        
        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Hat\"")
        {
            instance = curColor.Name.Content
        });

        HookCodeFromFile("save_hat_change_menu.gml", "gml_Object_" + curColor.Name.Content + "_Other_10");


        curColor = data.CreateMenu("player_default_hat");

        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Default Hat\"")
        {
            instance = curColor.Name.Content
        });

        HookCodeFromFile("default_hat_change_menu.gml", "gml_Object_" + curColor.Name.Content + "_Other_10");



        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Save Character\"", null, "gml_Script_scr_save_character", null, "gml_Script_scr_return_input", "\"Save a character to a .wyschar file\""));
/*
        data.HookCode("gml_Object_" + curColor.Name.Content + "_Other_10", @"#orig#()
bExecuteScriptsOnSwitch = 0
bExitSumbenuAfterConfirm = 0
bExecuteScriptsOnConfirm = 1
bExecuteScriptsOnExit = 0");
*/

        data.InsertMenuOptionFromEnd(playerColorsCustomMenu.Name.Content, 0, new Menus.WysMenuOption("\"Load Character\"", null, "gml_Script_scr_load_character", null, "gml_Script_scr_return_input", "\"Load a character from a .wyschar file\""));
/*
        data.HookCode("gml_Object_" + curColor.Name.Content + "_Other_10", @"#orig#()
bExecuteScriptsOnSwitch = 0
bExitSumbenuAfterConfirm = 0
bExecuteScriptsOnConfirm = 1
bExecuteScriptsOnExit = 0");
*/

        data.InsertMenuOption(funMenu.Name.Content, 0, data.CreateToggleOption("\"F U N N Y   S Q U I D\"", "funny_squid", "global.setting_funny_squid = argument0", "selectedItem = global.setting_funny_squid", "global.setting_funny_squid", "gml_Script_scr_return_input", "\"WEEEEEEEEEEEEEEEE!\""));

        UndertaleGameObject goreMenu = data.CreateMenu("gore_menu", new WysMenuOption("\"None\"", null, "gml_Script_scr_set_blood", "0"), new WysMenuOption("\"Blood\"", null, "gml_Script_scr_set_blood", "1"), new WysMenuOption("\"Slime\"", null, "gml_Script_scr_set_blood", "2"));
        data.InsertMenuOption(funMenu.Name.Content, 0, new WysMenuOption("\"Gore\"", goreMenu.Name.Content));

        data.HookCode("gml_Object_" + goreMenu.Name.Content + "_Other_10", @"#orig#()
bExecuteScriptsOnSwitch = 0
bExitSumbenuAfterConfirm = 0
bExecuteScriptsOnConfirm = 0
bExecuteScriptsOnExit = 1");

    }

    public UndertaleGameObject MakeColorMenu(string name, string global_var_name, float darkBlend = 0){
        UndertaleGameObject customMenu = MakeColorMenuRGB(name + "_custom", global_var_name);

        //data.HookCode("gml_Object_" + colorMenu.Name.Content + "_Other_10", "#orig#() \n bAllowLoopingUpDown = 0");
        
        UndertaleGameObject colorMenu = data.CreateMenu("colormenu_" + name,
        new Menus.WysMenuOption("\"Default\"", null, "gml_Script_scr_set_global_var_to_color_raw", "-1"),
        new Menus.WysMenuOption("\"Red\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_red"),
        new Menus.WysMenuOption("\"Orange\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_orange"),
        new Menus.WysMenuOption("\"Yellow\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_yellow"),
        new Menus.WysMenuOption("\"Green\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_lime"),
        new Menus.WysMenuOption("\"Aqua\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_aqua"),
        new Menus.WysMenuOption("\"Blue\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_blue"),
        new Menus.WysMenuOption("\"Purple\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_purple"),
        new Menus.WysMenuOption("\"Pink\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_fuchsia"),
        new Menus.WysMenuOption("\"Brown\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_maroon"),
        new Menus.WysMenuOption("\"White\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_white"),
        new Menus.WysMenuOption("\"Light Gray\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_gray"),
        new Menus.WysMenuOption("\"Dark Gray\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_dkgray"),
        new Menus.WysMenuOption("\"Black\"", null, "gml_Script_scr_set_global_var_to_color_raw", "c_black"),
        new Menus.WysMenuOption("\"Custom\"", customMenu.Name.Content));

        colorMenu.EventHandlerFor(EventType.Create, data.Strings, data.Code, data.CodeLocals)
        .ReplaceGmlSafe(@"
event_inherited()
global_variable_name = """ + global_var_name + @"""
dark_blend = " + darkBlend.ToString() + @"
        ", data);
        SetObjectCodeFromFile("gml_Object_obj_menu_color_Draw_0.gml", colorMenu.Name.Content, EventType.Draw, EventSubtypeDraw.Draw);
        
        data.HookCode("gml_Object_" + colorMenu.Name.Content + "_Other_10", "#orig#() \n bExecuteScriptsOnSwitch = 1 \n bExecuteScriptsOnExit = 1");
        
        return colorMenu;
    }

    public UndertaleGameObject MakeColorMenuRGB(string name, string global_var_name){
        UndertaleGameObject colorMenu = data.CreateMenu(name,
        data.CreateChangeOption("\"Red\"", name + "_r", "gml_Script_scr_set_global_var_to_color(\"" + global_var_name + "\", 0, argument0)", "return string(color_get_red(global." + global_var_name + "))", 5),
        data.CreateChangeOption("\"Green\"", name + "_g", "gml_Script_scr_set_global_var_to_color(\"" + global_var_name + "\", 1, argument0)", "return string(color_get_green(global." + global_var_name + "))", 5),
        data.CreateChangeOption("\"Blue\"", name + "_b", "gml_Script_scr_set_global_var_to_color(\"" + global_var_name + "\", 2, argument0)", "return string(color_get_blue(global." + global_var_name + "))", 5));
        


        
        return colorMenu;
    }

    public void BuildRooms(){

        BuildMusicRoom();


    }

    public void BuildMusicRoom()
    {

        UndertaleRoom disco_copy_me = data.Rooms.ByName("disco_copy_me");
        foreach(UndertaleRoom.GameObject g in disco_copy_me.GameObjects)
        {
            if(g.ObjectDefinition.Name.Content == "obj_wall")
            {
                g.X = -600;
                g.Y = -600;
            }
        }
        UndertaleGameObject obj_performance_test_snail = data.GameObjects.ByName("obj_performance_test_snail");
        for (var i = 0; i < 20; i++)
        {
            data.GeneralInfo.LastObj++;
            UndertaleRoom.GameObject obj_snail_inst = new UndertaleRoom.GameObject()
            {
                InstanceID = data.GeneralInfo.LastObj,
                ObjectDefinition = obj_performance_test_snail,
                X = 960,
                Y = 840
            };

            disco_copy_me.Layers.First(layer => layer.LayerName.Content == "Player").InstancesData.Instances.Add(obj_snail_inst);

            disco_copy_me.GameObjects.Add(obj_snail_inst);
        }
        UndertaleGameObject obj_wall = data.GameObjects.ByName("obj_wall");
        data.GeneralInfo.LastObj++;
        UndertaleRoom.GameObject obj_wall_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_wall,
            X = 0,
            Y = 0,
            ScaleX = 32,
            ScaleY = 1
        };

        disco_copy_me.Layers.First(layer => layer.LayerName.Content == "Walls").InstancesData.Instances.Add(obj_wall_inst);

        disco_copy_me.GameObjects.Add(obj_wall_inst);

        data.GeneralInfo.LastObj++;


        obj_wall_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_wall,
            X = 0,
            Y = 60,
            ScaleX = 1,
            ScaleY = 16
        };

        disco_copy_me.Layers.First(layer => layer.LayerName.Content == "Walls").InstancesData.Instances.Add(obj_wall_inst);

        disco_copy_me.GameObjects.Add(obj_wall_inst);

        data.GeneralInfo.LastObj++;


        obj_wall_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_wall,
            X = 0,
            Y = 1020,
            ScaleX = 32,
            ScaleY = 1
        };

        disco_copy_me.Layers.First(layer => layer.LayerName.Content == "Walls").InstancesData.Instances.Add(obj_wall_inst);

        disco_copy_me.GameObjects.Add(obj_wall_inst);

        data.GeneralInfo.LastObj++;


        obj_wall_inst = new UndertaleRoom.GameObject()
        {
            InstanceID = data.GeneralInfo.LastObj,
            ObjectDefinition = obj_wall,
            X = 1860,
            Y = 60,
            ScaleX = 1,
            ScaleY = 16
        };

        disco_copy_me.Layers.First(layer => layer.LayerName.Content == "Walls").InstancesData.Instances.Add(obj_wall_inst);

        disco_copy_me.GameObjects.Add(obj_wall_inst);
    }

    public void HookFunctionFromFile(string path, string function)
    {
        string value = "";
        if (files.TryGetValue(path, out value))
        {
            Console.WriteLine("loading " + path);
            data.HookFunction(function, value);
        }
        else
        {
            Console.WriteLine("Couldn't hook function " + path + ", it wasn't in the files dictionary.");
        }
    }
    public void CreateFunctionFromFile(string path, string function, ushort argumentCount = 0)
    {
        string value = "";
        if (files.TryGetValue(path, out value))
        {
            Console.WriteLine("loading " + path);
            data.CreateFunction(function, value, argumentCount);
        }
        else
        {
            Console.WriteLine("Couldn't create function " + path + ", it wasn't in the files dictionary.");
        }
    }

    public void HookCodeFromFile(string path, string function)
    {
        string value = "";
        if (files.TryGetValue(path, out value))
        {
            Console.WriteLine("loading " + path);
            data.HookCode(function, value);
        }
        else
        {
            Console.WriteLine("Couldn't hook object script " + path + ", it wasn't in the files dictionary.");
        }
    }

    public void LoadFromFiles(string modPath)
    {
        string[] codeF = Directory.GetFiles(Path.Combine(modPath, "code"), "*.gml");
        Console.WriteLine("Loading code files from " + Path.Combine(modPath, "code"));
        foreach (string f in codeF)
        {
            Patcher.AddFileToCache(0, f);
            if (!files.ContainsKey(Path.GetFileName(f)))
            {
                files.Add(Path.GetFileName(f), File.ReadAllText(f));
            }
        }
    }


    public void SetObjectCodeFromFile(string path, string objName, EventType eventType)
    {
        string value = "";
        UndertaleGameObject obj = data.GameObjects.ByName(objName);

        if (files.TryGetValue(path, out value))
        {
            obj.EventHandlerFor(eventType, data.Strings, data.Code, data.CodeLocals)
            .ReplaceGmlSafe(value, data);
        }
        else
        {
            Console.WriteLine("Couldn't change/create object script " + path + ", it wasn't in the files dictionary.");
        }
    }
    public void SetObjectCodeFromFile(string path, string objName, EventType eventType, EventSubtypeDraw EventSubtype)
    {
        string value = "";
        UndertaleGameObject obj = data.GameObjects.ByName(objName);

        if (files.TryGetValue(path, out value))
        {
            obj.EventHandlerFor(eventType, EventSubtype, data.Strings, data.Code, data.CodeLocals)
            .ReplaceGmlSafe(value, data);
        }
        else
        {
            Console.WriteLine("Couldn't change/create object script " + path + ", it wasn't in the files dictionary.");
        }
    }
    public void SetObjectCodeFromFile(string path, string objName, EventType eventType, uint EventSubtype)
    {
        string value = "";
        UndertaleGameObject obj = data.GameObjects.ByName(objName);

        if (files.TryGetValue(path, out value))
        {
            obj.EventHandlerFor(eventType, EventSubtype, data.Strings, data.Code, data.CodeLocals)
            .ReplaceGmlSafe(value, data);
        }
        else
        {
            Console.WriteLine("Couldn't change/create object script " + path + ", it wasn't in the files dictionary.");
        }
    }
    public void SetObjectCodeFromFile(string path, string objName, EventType eventType, EventSubtypeKey EventSubtype)
    {
        string value = "";
        UndertaleGameObject obj = data.GameObjects.ByName(objName);

        if (files.TryGetValue(path, out value))
        {
            obj.EventHandlerFor(eventType, EventSubtype, data.Strings, data.Code, data.CodeLocals)
            .ReplaceGmlSafe(value, data);
        }
        else
        {
            Console.WriteLine("Couldn't change/create object script " + path + ", it wasn't in the files dictionary.");
        }
    }

    public void SetObjectCodeFromFile(string path, string objName, EventType eventType, EventSubtypeMouse EventSubtype)
    {
        string value = "";
        UndertaleGameObject obj = data.GameObjects.ByName(objName);

        if (files.TryGetValue(path, out value))
        {
            obj.EventHandlerFor(eventType, EventSubtype, data.Strings, data.Code, data.CodeLocals)
            .ReplaceGmlSafe(value, data);
        }
        else
        {
            Console.WriteLine("Couldn't change/create object script " + path + ", it wasn't in the files dictionary.");
        }
    }


    public void SetObjectCodeFromFile(string path, string objName, EventType eventType, EventSubtypeOther EventSubtype)
    {
        string value = "";
        UndertaleGameObject obj = data.GameObjects.ByName(objName);

        if (files.TryGetValue(path, out value))
        {
            obj.EventHandlerFor(eventType, EventSubtype, data.Strings, data.Code, data.CodeLocals)
            .ReplaceGmlSafe(value, data);
        }
        else
        {
            Console.WriteLine("Couldn't change/create object script " + path + ", it wasn't in the files dictionary.");
        }
    }

    public void SetObjectCodeFromFile(string path, string objName, EventType eventType, EventSubtypeStep EventSubtype)
    {
        string value = "";
        UndertaleGameObject obj = data.GameObjects.ByName(objName);

        if (files.TryGetValue(path, out value))
        {
            obj.EventHandlerFor(eventType, EventSubtype, data.Strings, data.Code, data.CodeLocals)
            .ReplaceGmlSafe(value, data);
        }
        else
        {
            Console.WriteLine("Couldn't change/create object script " + path + ", it wasn't in the files dictionary.");
        }
    }

    //Unused because GMML is being shit and not functioning properly with the C# interop.
    /*
    [GmlInterop("gmml_return_console_command")]
    public static string ReturnConsoleCommand(ref CInstance self, ref CInstance other)
    {
        string curCommand = "";
        if(consoleCommand != "")
        {
            curCommand = consoleCommand;
            consoleCommand = "";
        }
        return curCommand;
    }
    
    [GmlInterop("gmml_console_readline")]
    public static string ConsoleReadLine(ref CInstance self, ref CInstance other)
    {
        consoleCommand = Console.ReadLine();
        return "done";
    }
    */


}