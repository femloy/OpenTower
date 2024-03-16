if other.state != states.gotoplayer
{
	if obj_player1.character == "V"
		global.playerhealth = clamp(global.playerhealth + 10, 0, 100);
	global.heattime = 60;
	with obj_camera
		healthshaketime = 60;
	fmod_event_one_shot("event:/sfx/misc/collectpizza");
	instance_destroy();
	var _number = 0;
	if global.fill <= 2500
	{
		global.fill += 500;
		_number = 500;
	}
	else
	{
		_number = heat_calculate(50);
		global.collect += _number;
	}
	create_collect(x, y, sprite_index, val);
	with (instance_create(x + 16, y, obj_smallnumber))
		number = string(_number);
}
