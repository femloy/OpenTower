func = function(player)
{
	if (active == 0 && player.state == states.backbreaker)
	{
		active = true;
		obj_secretmanager.touchedtriggers += 1;
	}
};
