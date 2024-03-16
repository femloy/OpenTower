if use_collision
	scr_collide();
if (sprite_index == spr_antigrav_activate && floor(image_index) == image_number - 1)
	sprite_index = spr_antigrav;
if cooldown > 0
	cooldown--;
