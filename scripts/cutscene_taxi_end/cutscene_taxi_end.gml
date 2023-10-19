function cutscene_taxi_end(_player, _room)
{
	var player = _player;
	var target_room = _room;
	with (player)
	{
		var handler = other;
		cutscene = true;
		state = states.actor;
		if (grounded && state != states.hurt)
		{
			hsp = 0;
			vsp = 0;
			with (instance_create(x - 1000, y, obj_taxi_cutscene))
			{
				targetplayer = player;
				depth = -127;
				targetDoor = "E";
				targetRoom = target_room;
			}
			with (handler)
			{
				global.failcutscene = true;
				cutscene_end_action();
			}
		}
	}
}
