if (vsp > 0)
{
	if (obj_player1.character == "V")
		global.playerhealth = clamp(global.playerhealth + 5, 0, 100);
	var val = heat_calculate(10);
	if (other.object_index == obj_player1)
		global.collect += val;
	else
		global.collectN += val;
	global.combotime += 10;
	global.combotime = clamp(global.combotime, 0, 60);
	with (obj_camera)
		healthshaketime = 40;
	with (instance_create(x + 16, y, obj_smallnumber))
		number = string(val);
	scr_sound_multiple("event:/sfx/misc/collect", x, y);
	instance_destroy();
}
