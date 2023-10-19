with (obj_bosscontroller)
	persistent = false;
depth = -6;
image_speed = 0.35;
alarm[0] = 10;
movespeed = 0;
state = states.normal;
snd = fmod_event_create_instance("event:/sfx/fakepep/chase");
fmod_event_instance_play(snd);
