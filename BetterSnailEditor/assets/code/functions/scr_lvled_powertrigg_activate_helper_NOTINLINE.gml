
if (instance_number(argument0) == 0)
    return 0;
for (var i = 0; i < instance_number(argument0); i++)
{
    var curO = instance_find(argument0, i)
    if (curO.x > x && curO.y > y && curO.x < (x + (image_xscale * 60)) && curO.y < (y + (image_yscale * 60)))
    {
        if (!player_is_in_trigger)
            event_user(1)
        player_is_in_trigger = 1
        markForTriggerEnd = 0
        return 1;
    }
    else
        markForTriggerEnd = 1
}
return 0;