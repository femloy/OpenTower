if (place_meeting(x, y - 1, obj_player1))
{
	with obj_player1
	{
		if (place_meeting(x, y + 1, obj_stairs) && !place_meeting(other.x + 16, y + 1, obj_solid) && !place_meeting(x, y + 1, obj_solid) && key_down && (state == states.crouch || ((character == "S" || character == "M") && (state == states.normal || state == states.mach1))) && place_meeting(x, y + 1, obj_platform))
		{
			y += 5;
			state = states.ladder;
			y = floor(y);
			if ((y % 2) == 1)
				y -= 1;
		}
	}
}
if (instance_exists(obj_player2))
{
	if (place_meeting(x, y - 2, obj_player2))
	{
		with obj_player2
		{
			if (place_meeting(x, y + 2, obj_ladder) && !place_meeting(other.x + 16, y + 2, obj_solid) && !place_meeting(x, y + 1, obj_solid) && key_down && (state == states.crouch || (character == "S" && (state == states.normal || state == states.mach1))) && place_meeting(x, y + 1, obj_platform))
			{
				y += 5;
				state = states.ladder;
				y = floor(y);
				if ((y % 2) == 1)
					y -= 1;
			}
		}
	}
}
