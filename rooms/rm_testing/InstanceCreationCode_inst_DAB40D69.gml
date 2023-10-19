trigger = 1;
func = function(player)
{
	if (!active)
	{
		if (player.state == states.freefallland)
			active = true;
	}
};
