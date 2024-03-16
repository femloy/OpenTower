if global.timedgatetimer == 1
	sprite_index = spr_button_pressed;
time = time_max;
timedgate_add_objects(obj_baddie, global.baddieroom);
timedgate_add_objects(obj_destructibles, global.saveroom);
timedgate_add_objects(obj_metalblock, global.saveroom);
