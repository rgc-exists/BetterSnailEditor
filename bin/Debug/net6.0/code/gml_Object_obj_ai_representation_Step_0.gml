if (go_completely_dark_when_not_talking == -1)
{
    go_completely_dark_when_not_talking = instance_exists(obj_dark_level)
    if (room == S_12_nested_sim || room == S_12_nested_sim2 || room == S_12_nested_sim3)
        go_completely_dark_when_not_talking = 1
}
switch mode
{
    case 0:
        scr_airep_normal()
        break
    case 1:
        scr_airep_destroyed()
        break
    case 2:
        scr_airep_bossfight()
        break
}

talkyblend *= 0.99
talkyblend = max(talkyblend, talking, image_alpha > 0.99)
if(global.setting_squid_color == -1 || is_undefined(global.setting_squid_color)){
    col_ai = obj_levelstyler.col_ai
    col_ai2 = obj_levelstyler.col_ai2
    col_ai_inback = obj_levelstyler.col_ai_inback
} else {
    col_ai = global.setting_squid_color
    col_ai2 = merge_color(c_white, global.setting_squid_color, 0.825)
    col_ai_inback = global.setting_squid_color
}
image_blend = merge_color(col_ai, col_ai2, ((sin((time * 0.2)) * 0.5) + 0.5))
image_blend = merge_color(col_ai_inback, image_blend, talkyblend)
if (!visiblus && !global.setting_squid_constant_opacity)
    image_alpha = 0
change_face_probability = 45
if (mood == 0)
    change_face_probability = 100
if (mood != mood_last || random(change_face_probability) < 1)
{
    with (obj_ai_mouth)
        event_user(0)
    with (obj_ai_eye)
        event_user(0)
    mood_last = mood
    if (mode == 1)
    {
        with (obj_ai_eye)
        {
            browB_YOff_target = 11
            browB_XOff_target = 0
            browB_angle_target = 0
        }
        with (obj_ai_mouth)
            rotOffset_target = 0
    }
}
talking = 0
if instance_exists(obj_aivl_parent)
{
    reset_facial_expression_in = max(reset_facial_expression_in, 60)
    talking = 1
}
reset_facial_expression_in -= 1
if (reset_facial_expression_in <= 0)
{
    if (mood == 3 || mood == 6 || mood == 1 || mood == 14 || mood == 9 || mood == 11 || mood == 13)
        mood = 0
    if (mood == 8 || mood == 7 || mood == 12 || mood == 10)
        mood = 5
    with (obj_override_default_mood)
        event_user(0)
}
