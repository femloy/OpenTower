if (state == states.tube)
{
	if (floor(image_index) >= 6)
	{
		with (playerid)
		{
			visible = true;
			state = states.freefall;
			vsp = 10;
			sprite_index = spr_player_rockethitwall;
			if (place_meeting(x, y, obj_solid))
			{
				while (place_meeting(x, y, obj_solid))
					y--;
			}
			var p = (object_index == obj_player1) ? 0 : 1;
			GamepadSetVibration(p, 1, 1, 0.9);
		}
	}
	with (playerid)
	{
		if (!place_meeting(x, y, other.id))
		{
			with (other)
			{
				GamepadSetVibration(0, 1, 1, 0.65);
				playerid = -1;
				state = states.normal;
			}
		}
	}
}
