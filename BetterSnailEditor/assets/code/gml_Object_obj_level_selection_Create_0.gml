layer_goal = layer_get_id("Goal")
exploration_mode_remember = global.save_exploration_mode
collected_difficulty_points = 0
collected_difficulty_points_underw = 0
available_difficulty_points = 0
collected_exploration_points = 0
available_exploration_points = 0
with (obj_aivl_parent)
    instance_destroy()
xpos = x
chapter_last = -1
levelselect_main_story_highlight = self
for (i = 0; i < ds_list_size(global.li_lvldat_ids); i++)
{
    levelid = ds_list_find_value(global.li_lvldat_ids, i)
    type = scr_level_dat_get_type(levelid)
    beaten_on_diff = scr_level_dat_get_beaten_on_diff(levelid)
    beaten_on_diff_underw = scr_level_dat_get_beaten_on_diff_underw(levelid)
    if (type == 2 || type == 5)
    {
        available_difficulty_points += 4
        if (beaten_on_diff >= 0)
            collected_difficulty_points += (beaten_on_diff + 1)
        if (beaten_on_diff_underw >= 0)
            collected_difficulty_points_underw += (beaten_on_diff_underw + 1)
    }
    exploration_points_lvl = scr_level_dat_get_exploration_points(levelid)
    exploration_points_lvl_count = array_length_1d(exploration_points_lvl)
    available_exploration_points += exploration_points_lvl_count
    exploration_points_collected_lvl = 0
    for (iexpl = 0; iexpl < array_length_1d(exploration_points_lvl); iexpl++)
    {
        if (ds_list_find_index(global.save_collected_exploration_points, exploration_points_lvl[iexpl]) >= 0)
            exploration_points_collected_lvl++
    }
    collected_exploration_points += exploration_points_collected_lvl
    locked_level = 0
    if (scr_level_dat_get_unlocked(levelid) == 0)
    {
        if(global.save_exploration_mode == 2){
            locked_level = 0
        } else {
            if (global.save_exploration_mode == 0)
                locked_level = 1
            else if (type == 5 || type == 6 || type == 4)
                locked_level = 1
        }
    }
    chaptter = (scr_level_dat_get_chapter(levelid) - 1)
    level_portal = instance_create_layer((xpos + (chaptter * 30)), y, layer_goal, obj_level_select_portal)
    level_portal.level = levelid
    level_portal.beaten_on_diff = beaten_on_diff
    level_portal.beaten_on_diff_underw = beaten_on_diff_underw
    level_portal.type = type
    level_portal.deaths = scr_level_dat_get_deaths(levelid)
    level_portal.playtime = scr_level_dat_get_playtime(levelid)
    level_portal.autodiff_difficulty = scr_level_dat_get_autodiff_difficulty(levelid)
    level_portal.autodiff_playtime = scr_level_dat_get_autodiff_playtime(levelid)
    level_portal.sprite_index = scr_level_dat_get_icon(levelid)
    if ((level_portal.sprite_index == spr_lvlico_finalboss || level_portal.sprite_index == spr_lvlico_finalbossS2) && global.save_heart_fixed)
        level_portal.sprite_index = spr_lvlico_squidgone
    level_portal.name = scr_level_dat_get_name(levelid)
    if(global.save_exploration_mode == 2){
        level_portal.more_to_explore = false
    } else {
        level_portal.more_to_explore = scr_level_dat_get_moretoexplore(levelid)
    }
    level_portal.is_boss = scr_level_dat_is_boss(levelid)
    level_portal.exploration_points = exploration_points_lvl_count
    level_portal.exploration_points_collected = exploration_points_collected_lvl
    level_portal.locked_level = locked_level
    if (chaptter != chapter_last)
    {
        level_seperator = instance_create_layer(((xpos + (chaptter * 30)) - 45), y, "MiniGames", obj_level_select_seperator)
        level_seperator.text = string_copy(level_portal.name, 0, 1)
        level_seperator.reference = level_portal
    }
    chapter_last = chaptter
    if locked_level
    {
        if (type == 5 || type == 6 || type == 4)
        {
            level_portal.sprite_index = spr_lvlico_questionmark
            level_portal.name = ""
            level_portal.exploration_points = 0
            level_portal.exploration_points_collected = 0
        }
    }
    if (!locked_level)
    {
        if (type == 2 || type == 1 || type == 0 || type == 3)
            levelselect_main_story_highlight = level_portal
    }
    if (global.coming_from_room == level_portal.level || (level_portal.level == 131 && global.coming_from_room == 133 && global.credits_mode != 0))
    {
        obj_player.x = (xpos + (chaptter * 30))
        obj_player.xlast = obj_player.x
    }
    if (level_portal.level == 70)
    {
        if (!level_portal.locked_level)
        {
            if global.save_pump_is_inverted
            {
                level_portal.playsound = audio_play_sound_at(sou_thruster_a, level_portal.x, level_portal.y, 400, 600, 2500, 1, true, 0.9)
                audio_sound_pitch(level_portal.playsound, 0.25)
                audio_sound_gain_fx(level_portal.playsound, 0.5, 0)
            }
        }
    }
    xpos += 60
}
xpos += 300
idmerk = instance_create_layer(xpos, 780, "Goal", obj_manual_door)
idmerk.image_angle = 180
idmerk.image_yscale = 11
idmerk.yscale = idmerk.image_yscale
if (scr_level_dat_get_beaten_on_diff(130) >= 0 || scr_level_dat_get_unlocked(131) || global.save_exploration_mode)
    idmerk.open = 1
xpos += 300
idmerk = instance_create_layer(xpos, 780, "Goal", obj_dialog_file)
idmerk.dialog_file = "finished_the_game"
scr_add_exploration_pints_that_are_not_in_main_levels()
if (levelselect_main_story_highlight != self)
{
    if instance_exists(levelselect_main_story_highlight)
    {
        if levelselect_main_story_highlight.more_to_explore
            levelselect_main_story_highlight.main_story_highlight = 1
    }
}
