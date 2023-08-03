visible = false
alarm = 1
layer_laser = layer_get_id("Spikes")
fire_in = random(100)
speedo = (0.4 + random(0.2))
activetimer = 600
image_xscale = 0
image_yscale = 0
spawn_music_no_hope = 0
emitter = audio_emitter_create()
audio_emitter_position(emitter, x, y, 100)
audio_emitter_falloff(emitter, 150, 2500, 1.5)
propellersound = audio_play_sound_on(emitter, sou_drone_loop_b, true, 0.3)
audio_sound_set_track_position(propellersound, random(10))
audio_sound_pitch(propellersound, (0.9 + random(0.3)))
audio_sound_gain_fx(propellersound, 0, 0)
global.goto_2nd_wipe_secret = 1
if (global.save_equipped_hat != 2 || !global.setting_unicorn_horn_ball_override)
    global.goto_2nd_wipe_secret = 0
player_moved = 0
chase_player_offset = (50 - random(100))
ggain = 0.4
