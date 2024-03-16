image_speed = 0.35;
bg_spd = 24;
bg_x = sprite_get_width(bg_space1);
bg_y = 0;
shake_mag = 3;
buffer = 105;
fade = 0;
depth = -600;
start = false;
time = 0;
fadein = true;
fmod_event_one_shot("event:/sfx/misc/escaperumble");
if !obj_player1.ispeppino
	sprite_index = spr_spacetravelcutsceneN;
