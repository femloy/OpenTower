if (floor(image_index) == image_number - 1 && sprite_index == spr_goblinbot_kick)
	sprite_index = spr_goblinbot;
if use_collision
	scr_collide();
if rail
	scr_rail_phy();
