if (state != states.grabbing && x == xstart && y == ystart)
{
	with (other)
	{
		other.playerid = id;
		other.state = states.grabbing;
		if (state == states.grabbed)
		{
			state = states.normal;
			with (playerid)
				bombgrabID = -4;
		}
	}
}
