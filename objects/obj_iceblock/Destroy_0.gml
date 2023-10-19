with (obj_collect)
{
	if (place_meeting(x, y, other))
	{
		image_speed = 0.35;
		image_alpha = 1;
	}
}
if (ds_list_find_index(global.saveroom, id) == -1)
{
	var a = image_xscale + image_yscale;
	repeat (6 * a)
	{
		var xx = x + (irandom(abs(sprite_width)) * image_xscale);
		var yy = y + (irandom(abs(sprite_height)) * image_yscale);
		if (point_in_camera(xx, yy, view_camera[0]))
			create_debris(xx, yy, spr_icedebris);
	}
	repeat (a)
	{
		xx = x + (irandom(abs(sprite_width)) * image_xscale);
		yy = y + (irandom(abs(sprite_height)) * image_yscale);
		if (point_in_camera(xx, yy, view_camera[0]))
			instance_create(xx, yy, obj_parryeffect);
	}
	var val = heat_calculate(10);
	if (other.object_index == obj_player1)
		global.collect += val;
	else
		global.collectN += val;
	with (instance_create(x + 16, y, obj_smallnumber))
		number = string(val);
	global.heattime += 10;
	global.heattime = clamp(global.heattime, 0, 60);
	global.combotime += 10;
	global.combotime = clamp(global.combotime, 0, 60);
	ds_list_add(global.saveroom, id);
}
scr_destroy_tiles(32, "Tiles_1");
scr_destroy_tiles(32, "Tiles_2");
scr_destroy_tiles(32, "Tiles_3");
