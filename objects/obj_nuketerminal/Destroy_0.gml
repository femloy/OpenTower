if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_create_unique(0, 0, obj_wartimer);
	fmod_event_one_shot("event:/sfx/ui/wartimerup");
	with obj_wartimer
	{
		for (addseconds += other.seconds; other.minutes > 0; addseconds += 60)
			other.minutes--;
		alarm[0] = -1;
		alarm[2] = 1;
	}
	for (var i = 0; i < sprite_get_number(spr_warterminal_debris); i++)
	{
		with (create_debris(x, y, spr_warterminal_debris))
			image_index = i;
	}
	tile_layer_delete_at(1, x, y);
	tile_layer_delete_at(1, x + 32, y);
	tile_layer_delete_at(1, x + 32, y + 32);
	tile_layer_delete_at(1, x, y + 32);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	ds_list_add(global.saveroom, id);
	notification_push(notifs.block_break, [room]);
}
