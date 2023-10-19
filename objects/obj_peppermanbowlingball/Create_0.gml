alarm[0] = 100;
alarm[1] = 1;
fall = false;
fallbuffer = 100;
depth = -599;
image_speed = 0.2;
sprite_index = choose(spr_pepperman_smallstatue1, spr_pepperman_smallstatue2, spr_pepperman_smallstatue3);
destroy = false;
fmod_event_one_shot_3d("event:/sfx/pepperman/statueappear", x, y + 100);
