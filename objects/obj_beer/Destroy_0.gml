if (ds_list_find_index(global.saveroom, id) == -1)
{
	if sprite_index == spr_bigbeer
	{
		repeat 6
			create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), spr_beerdebris);
	}
	else
	{
		repeat 3
			create_debris(x + random_range(0, sprite_width), y + random_range(0, sprite_height), spr_beerdebris);
	}
	fmod_event_one_shot_3d("event:/sfx/misc/beerbreak", x, y);
	notification_push(notifs.beer_destroy, [room, id, object_index]);
	if obj_player1.character == "V"
		global.playerhealth = clamp(global.playerhealth + 1, 0, 100);
	global.heattime += 10;
	global.heattime = clamp(global.heattime, 0, 60);
	global.combotime += 10;
	global.combotime = clamp(global.combotime, 0, 60);
	with obj_camera
		healthshaketime = 30;
	var val = heat_calculate(10);
	global.collect += val;
	create_collect(x, y, spr_beerliquid, val);
	with (instance_create(x + 16, y, obj_smallnumber))
		number = string(val);
	ds_list_add(global.saveroom, id);
}
