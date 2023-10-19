if (ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_create(x + 32, y + 32, obj_debris))
		sprite_index = spr_secretdebris;
	with (instance_create(x + 32, y + 32, obj_debris))
		sprite_index = spr_secretdebris;
	with (instance_create(x + 32, y + 32, obj_debris))
		sprite_index = spr_secretdebris;
	with (instance_create(x + 32, y + 32, obj_debris))
		sprite_index = spr_secretdebris;
	with (instance_create(x + 32, y + 32, obj_debris))
		sprite_index = spr_secretdebris;
	with (instance_create(x + 32, y + 32, obj_debris))
		sprite_index = spr_secretdebris;
	with (instance_create(x + 32, y + 32, obj_debris))
		sprite_index = spr_secretdebris;
	tile_layer_delete_at(1, x, y);
	tile_layer_delete_at(1, x + 32, y);
	tile_layer_delete_at(1, x + 32, y + 32);
	tile_layer_delete_at(1, x, y + 32);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
}
