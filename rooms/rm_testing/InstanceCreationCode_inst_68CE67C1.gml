func = function(player)
{
	if (!active && player.state == states.handstandjump)
	{
		active = true;
		obj_secretmanager.hittriggers++;
		with (player)
			scr_pummel();
	}
};
