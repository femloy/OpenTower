if (ds_list_find_index(global.baddieroom, id) == -1 && important == 0)
{
	obj_camera.targetgolf = -4;
	var _repeat = 10;
	if global.golfhit < 10
		_repeat = 10;
	else if global.golfhit < 20
		_repeat = 5;
	else if global.golfhit < 30
		_repeat = 1;
	else
		_repeat = 0;
	with (instance_create(player.x, player.y, obj_onebyone))
	{
		depth = other.player.depth;
		targetplayer = other.player.id;
		_times = _repeat;
		content = obj_pizzaslice;
		sprite_index = spr_pizzaslice;
		timer = 10;
		alarm[0] = timer;
	}
	global.golfhit = 0;
	ds_list_add(global.baddieroom, id);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	with obj_camera
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	instance_create(x, y + 30, obj_bangeffect);
	with obj_camera
	{
		shake_mag = 5;
		shake_mag_acc = 20 / room_speed;
	}
	hsp = 0;
	vsp = 0;
}
