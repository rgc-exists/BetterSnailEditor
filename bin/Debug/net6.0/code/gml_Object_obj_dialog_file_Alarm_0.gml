event_user(0)
ds_list_dialog = ds_map_find_value(global.loca_ds_map_dialog_translations, dialog_file)
if instance_exists(obj_dark_level)
    in_the_dark = 1
if(global.save_exploration_mode != 2)
    discovered = ds_list_find_index(global.save_unlocked_dialogs, dialog_file) != -1
else
    discovered = true
file_number = ds_list_find_value(ds_list_dialog, 0)
file_name = ds_list_find_value(ds_list_dialog, 1)
