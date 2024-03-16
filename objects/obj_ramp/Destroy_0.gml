ds_list_add(global.baddieroom, id);
repeat (irandom_range(3, 6))
	instance_create(x + (sprite_width / 2) + irandom_range(-60, 60), y + (sprite_height / 2) + irandom_range(-32, 32), obj_playerexplosion);
repeat 4
	create_debris(x + irandom_range(-40, 40) + (sprite_width / 2), y + irandom_range(-40, 40) + (sprite_height / 2), spr_wooddebris);
