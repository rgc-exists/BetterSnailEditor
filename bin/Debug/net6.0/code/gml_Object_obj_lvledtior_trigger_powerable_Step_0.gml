if (!obj_player.started_playing)
{
    if player_is_in_trigger
        event_user(2)
    player_is_in_trigger = 0
    return;
}
markForTriggerEnd = 0
if doPlayerCollisions
{
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(284)
    {
        return false;
    }
}
if doPathCollisions
{
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(568)
        return false;
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(369)
        return false;
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(532)
    {
        return false;
    }
}
if doBallCollisions
{
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(245)
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
        return;
    }
    if gml_Script_scr_lvled_powertrigg_activate_helper_NOTINLINE(155)
        predictCollisionHold = 40
}
if markForTriggerEnd
{
    if player_is_in_trigger
        event_user(2)
    player_is_in_trigger = 0
}
