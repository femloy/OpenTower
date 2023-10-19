alarm[0] = 220;
fall = false;
image_speed = 0.2;
depth = -1;
noshake = false;
sprite_index = choose(spr_peppermanartdude1, spr_peppermanartdude2, spr_peppermanartdude3);
alarm[2] = 1;
snd = fmod_event_create_instance("event:/sfx/pepperman/artdude");
fmod_event_instance_play(snd);
