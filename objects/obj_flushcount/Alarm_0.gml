if (count > 0)
{
	count--;
	scr_sound_multiple("event:/sfx/misc/collect", obj_player1.x, obj_player1.y);
	global.heattime += 10;
	global.heattime = clamp(global.heattime, 0, 60);
	global.combotime += 10;
	global.combotime = clamp(global.combotime, 0, 60);
	with (obj_camera)
		healthshaketime = 30;
	global.collect += val;
	create_collect(obj_player1.x, obj_player1.y, spr, val);
	with (instance_create(obj_player1.x, obj_player1.y, obj_smallnumber))
		number = string(other.val);
	alarm[0] = timer;
}
else
	instance_destroy();
