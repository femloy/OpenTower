if (instance_number(obj_hardmode) > 1)
	instance_destroy();
depth = -108;
hsp = 0;
vsp = 0;
fake_y = y;
random_max = 300;
random_random = 120;
random_buffer = random_max + irandom_range(-(random_random + 1), random_random);

content[0] = obj_cheeseslime;
content[1] = obj_forknight;
content[2] = obj_fencer;
content[3] = obj_noisegoblin;
content[4] = obj_indiancheese;
content[5] = obj_pickle;
content[6] = obj_robot;
content[7] = obj_swedishmonkey;
content[8] = obj_coolpineapple;
content[9] = obj_ancho;
content[10] = obj_banditochicken;
