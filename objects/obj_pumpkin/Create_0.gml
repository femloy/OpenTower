depth = 10;
image_speed = 0.35;
active = true;
visibleradius = 200;
soundradius = 400;
trickytreat = false;
snd = fmod_event_create_instance("event:/sfx/misc/halloweenpumpkin");
fmod_event_instance_play(snd);
fmod_event_instance_set_3d_attributes(snd, x, y);
