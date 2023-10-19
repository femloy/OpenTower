instance_create(x - 50, y + random_range(0, 100), obj_cheesedragonflames);
if (attackcycle == 2 && floor(image_index) > 13 && floor(image_index) < 21 && sprite_index == spr_cheesedragon_flames)
	alarm[1] = 30;
else
	alarm[1] = -1;
