if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat (8 * max(abs(image_xscale), abs(image_yscale)))
	{
		with (create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), particlespr))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
			image_index = random_range(0, image_number - 1);
			image_speed = 0;
		}
	}
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	notification_push(notifs.block_break, [room]);
	ds_list_add(global.saveroom, id);
}
scr_cutoff();
if (is_string(targettiles))
	scr_destroy_tiles(32, targettiles);
else
	scr_destroy_tile_arr(32, targettiles);
scr_destroy_nearby_tiles();
