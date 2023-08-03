global.mask_outlines = []
global.mask_names = []
var masks_path = global.betterSE_assets + "sprites/Mask_Outlines/";
var spr_path = file_find_first(masks_path + "/*.png", 0)
//clipboard_set_text(spr_path)
while(file_exists(masks_path + spr_path)){
    //show_message(spr_path)
    //clipboard_set_text(spr_path)
    var spr_name =  string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(string_replace_all(spr_path, "\\", "/"), "mask_", ""), "_0.png", ""), "_1.png", ""), "_3.png", ""), "_4.png", "")
    var sprite = sprite_add(masks_path + spr_path, 0, false, false, sprite_get_xoffset(asset_get_index(spr_name)), sprite_get_yoffset(asset_get_index(spr_name)))
    array_push(global.mask_names, spr_name)
    array_push(global.mask_outlines, sprite)
    spr_path = file_find_next()
}
file_find_close()
global.li_solid_objects = []
for(var i = 0; i < 10000; i++){
    if(object_exists(i)){
        if(object_get_solid(i)){
            array_push(global.li_solid_objects, i)
        }
    }
}
array_push(global.li_solid_objects, obj_difficulty_shower)
global.li_deadly_objects = [obj_spike, obj_cat, obj_lasertrap, obj_laserstorm, obj_rusty_spike, obj_fuse_voice, obj_badball, obj_enemy, obj_fish, obj_jellyfish, obj_ice_spike, obj_deadly_bubble, obj_missile, obj_dance_drone, obj_spike_permanent, obj_squasher, obj_sh_enemy_splitty, obj_protector, obj_bomb, obj_destructable_block_drop, obj_sh_enemy_normy, obj_disco_laser, obj_enemy_drone, obj_ai_laser, obj_enemy_piranha, obj_waterboss, obj_tentacle, obj_bubble, obj_jerry, obj_snowman_shot, obj_mafia_snowman, obj_torpedo, obj_baby_shark, obj_evil_snail, obj_boss, obj_boss_missle, obj_boss_p2, obj_badball_boss_p2, obj_glitchy_projectile, obj_glitchy_thing, obj_enemy_snail, obj_destroyed_wall, obj_danceboss_head_old, obj_danceboss_leg, obj_shark_submarine, obj_danceboss_head, obj_fuse_aftersecret, obj_firewall, obj_sd_enemy]
global.li_collectible_objects = [obj_sh_gun, obj_sh_gun2, obj_sh_gun3, obj_sh_gun4, obj_hat_collectible_parent, obj_hat_collectible_heart, obj_exploration_point, obj_chip_editor, obj_dialog_file]
global.li_collectible_object_names = ["UPWARD GUN", "FORWARD GUN", "DOWNWARD GUN", "AUTO-AIM GUN", "HAT", "COLLECTIBLE HEART", "EXPLORATION POINT", "VICTORY ITEM", "DIALOG FILE"];
global.li_trigger_objects = [obj_lt_music_trigger, obj_lt_AI_trigger, obj_lvledtior_trigger_powerable, obj_stop_playing_music_trigger, obj_lt_action_trigger, obj_lt_zoom_trigger, obj_end_game_trigger, obj_snowman_trigger, obj_aivl_trigger_parent, obj_spike_trigger_trailer]
global.li_trigger_object_names = ["MUSIC TRIGGER", "AI TRIGGER", "PLAYER TRIGGER", "STOP MUSIC TRIGGER", "ACTION TRIGGER", "LVLEDITOR ZOOM TRIGGER", "END GAME TRIGGER", "SNOWMAN TRIGGER", "VOICELINE TRIGGER", "TRAILER SPIKE TRIGGER"]
//show_message(string(global.li_solid_objects))


for(global.object_index_count = 0; global.object_index_count < 10000; global.object_index_count++){
    if(!object_exists(global.object_index_count)){
        break;
    }
}