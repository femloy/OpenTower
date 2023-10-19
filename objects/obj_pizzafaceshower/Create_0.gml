image_speed = 0.35;
state = states.idle;
alarm[0] = 1;
depth = 10;
start = false;
snd = fmod_event_create_instance("event:/sfx/pizzaface/shower");
fmod_event_instance_play(snd);
fmod_event_instance_set_3d_attributes(snd, x, y);
