if (!obj_player.started_playing)
{
    if player_is_in_trigger
        event_user(2)
    player_is_in_trigger = 0
    return false;
}
markForTriggerEnd = 0
if doPlayerCollisions
{
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(obj_player)
    {
        return false;
    }
}
if doPathCollisions
{
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(obj_r_squid)
        return false;
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(obj_target)
        return false;
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(obj_td_enemy)
    {
        return false;
    }
}
if doBallCollisions
{
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(obj_ball)
    {
        return false;
    }
}
if doPredictCollisions
{
    if (predictCollisionHold > 0)
    {
        predictCollisionHold--
        if (!player_is_in_trigger)
            event_user(1)
        player_is_in_trigger = 1
        markForTriggerEnd = 0
        return false;
    }
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(obj_ai_level_editor)
        predictCollisionHold = 40
}
if markForTriggerEnd
{
    if player_is_in_trigger
        event_user(2)
    player_is_in_trigger = 0
}
