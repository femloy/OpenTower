var _notif = false;
if (sprite_index != spr_button_pressed && sprite_index != spr_button_goingpressed)
{
	timedgate_trigger();
	if (sprite_index != spr_button_goingidle)
	{
		global.timedgateid = id;
		_notif = true;
	}
}
else if (global.timedgateid != id)
{
	_notif = true;
	global.timedgateid = id;
}
if (_notif && !instance_exists(obj_ghostcollectibles))
	notification_push(notifs.timedgateclock, [room, id, time]);
with (obj_timedgateclock)
{
	if (sprite_index != spr_button_pressed && sprite_index != spr_button_goingpressed)
	{
		sprite_index = spr_button_goingpressed;
		image_index = 0;
	}
}
global.timedgatetimer = true;
global.timedgatetime = time;
global.timedgatetimemax = time;
with (instance_create_unique(obj_player1.x, obj_player1.y, obj_clock))
	objectID = obj_player1.id;
