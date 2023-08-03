cccollision = collision_point(argument0, argument1, argument2, 1, 1)
rrradius = 3
while (rrradius <= 30 && cccollision == -4)
{
    cccollision = collision_rectangle((argument0 - rrradius), (argument1 - rrradius), (argument0 + rrradius), (argument1 + rrradius), argument2, 1, 1)
    rrradius += 3
}
return cccollision;