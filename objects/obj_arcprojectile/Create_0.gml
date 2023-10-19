grav = 0.5;
hsp = 0;
vsp = 0;
image_speed = 0.4;
alarm[0] = 5;
snd = fmod_event_create_instance("event:/sfx/enemies/axethrow");
fmod_event_instance_play(snd);
event_inherited();
