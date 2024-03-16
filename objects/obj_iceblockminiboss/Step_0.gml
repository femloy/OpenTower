if visible == 1 && obj_player.state != states.ejected
{
	if (place_meeting(x, y - 1, obj_player1))
	{
		with obj_player1
		{
			if state == states.knightpep
				state = states.knightpepslopes;
			else if state != states.knightpepslopes
			{
				state = states.slipnslide;
				sprite_index = spr_slipnslide;
			}
			if movespeed < 12
				movespeed = 12;
		}
	}
	if (place_meeting(x, y - 1, obj_player2))
	{
		with obj_player2
		{
			if state == states.knightpep
				state = states.knightpepslopes;
			else if state != states.knightpepslopes
			{
				state = states.slipnslide;
				sprite_index = spr_slipnslide;
			}
			if movespeed < 12
				movespeed = 12;
		}
	}
}
if visible == 0 && global.boxhp <= 5
{
	x = xstart;
	y = ystart;
	visible = true;
	repeat 4
		instance_create(x, y, obj_debris);
	mask_index = sprite_index;
}
