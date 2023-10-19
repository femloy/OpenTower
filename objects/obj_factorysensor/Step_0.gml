prevclosed = closed;
var _closed = false;
if (!graffiti)
{
	with (obj_player)
	{
		if (check_player_coop() && x > other.bbox_right)
		{
			_closed = true;
			if (!other.closed)
				other.closed = true;
		}
	}
	if (!_closed)
	{
		with (obj_player)
		{
			if (check_player_coop() && x < other.bbox_left)
				other.closed = false;
		}
	}
}
else
	closed = false;
if (prevclosed != closed)
{
	if (closed)
	{
		with (obj_factorygate)
		{
			state = states.transition;
			sprite_index = spr_arenagate_close;
			image_index = 0;
		}
	}
	else
	{
		with (obj_factorygate)
		{
			state = states.transition;
			sprite_index = spr_arenagate_open;
			image_index = 0;
		}
	}
}
