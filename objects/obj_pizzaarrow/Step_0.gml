old_x = x;
x += (image_xscale * 5);
var num = collision_line_list(x, y, old_x, y, obj_player, false, true, global.instancelist, false);
if num > 0
{
	for (var i = 0; i < num; i++)
	{
		var b = ds_list_find_value(global.instancelist, i);
		scr_hurtplayer(b);
	}
}
ds_list_clear(global.instancelist);
if (scr_solid(x + image_xscale, y))
	instance_destroy();
