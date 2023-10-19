if (playerid.object_index == obj_vigilanteboss && place_meeting(x, y, obj_player))
{
	playerid.state = states.walk;
	playerid.walkstate = states.walk;
	playerid.movespeed = 0;
}
