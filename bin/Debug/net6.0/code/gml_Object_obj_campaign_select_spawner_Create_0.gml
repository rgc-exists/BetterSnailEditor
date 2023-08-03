#orig#()
if(global.setting_campaign_exploration_mode){
    for (var i = 0; i < array_length(camp_data.levels); i++)
    {
        var lvlsec = instance_find(obj_level_select_portal, i)
        with (lvlsec)
        {
            locked_level = false
        }
    }
}