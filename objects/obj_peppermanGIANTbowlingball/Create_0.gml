alarm[0] = 150;
fall = false;
alarm[1] = 1;
image_speed = 0.2;
depth = 0;
alarm[2] = 1;
fmod_event_one_shot_3d("event:/sfx/pepperman/knightappear", x, y);
snd = fmod_event_create_instance("event:/sfx/pepperman/knightslide");
