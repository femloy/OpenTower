if (ds_list_find_index(global.saveroom, id) == -1)
{
	repeat 2
	{
		with (create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), particlespr))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
			image_speed = 0.35;
		}
	}
	if particlespr == spr_towerblockdebris
	{
		with (instance_create(x + random_range(0, sprite_width), y + random_range(0, sprite_height), obj_parryeffect))
		{
			sprite_index = spr_deadjohnsmoke;
			image_speed = 0.35;
		}
	}
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	ds_list_add(global.saveroom, id);
	notification_push(notifs.block_break, [room]);
}
scr_cutoff();
scr_destroy_tiles(32, "Tiles_1");
scr_destroy_tiles(32, "Tiles_2");
scr_destroy_tiles(32, "Tiles_3");
scr_destroy_tiles(32, "Tiles_4");
scr_destroy_tiles(32, "Tiles_Foreground1");
scr_destroy_tiles(32, "Tiles_Foreground2");
scr_destroy_nearby_tiles();
