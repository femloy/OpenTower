if room == rm_editor
	exit;
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
	repeat 6
	{
		with (create_debris(x + 16, y, sprite_index))
		{
			if sprite_index == spr_destroyable2
				sprite_index = spr_debris;
			else
				sprite_index = spr_halloweendebris;
		}
	}
	with (instance_create(x + 16, y + 16, obj_parryeffect))
		sprite_index = spr_pizzablockdead;
	scr_sleep(5);
	create_baddiegibsticks(x + 16, y + 16);
	scr_sound_multiple("event:/sfx/misc/collect", x, y);
	global.heattime += 10;
	global.heattime = clamp(global.heattime, 0, 60);
	global.combotime += 10;
	global.combotime = clamp(global.combotime, 0, 60);
	var val = heat_calculate(10);
	global.collect += val;
	with (instance_create(x + 16, y, obj_smallnumber))
		number = string(val);
	tile_layer_delete_at(1, x, y);
	notification_push(notifs.block_break, [room]);
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
	ds_list_add(global.saveroom, id);
}
