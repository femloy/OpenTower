function scr_player_noisejetpack()
{
	hsp = xscale * movespeed;
	move = key_left + key_right;
	if key_jump2 && jetpackfuel > 0
	{
		jetpackfuel--;
		vsp = -6;
		sprite_index = spr_playerN_doublejump;
	}
	else
		sprite_index = spr_playerN_doublejumpfall;
	if move != 0
	{
		if xscale != move
		{
			movespeed = Approach(movespeed, 0, 0.5);
			if movespeed <= 0
			{
				movespeed = 0;
				xscale = move;
			}
		}
		else if movespeed < 8
			movespeed = Approach(movespeed, 8, 0.5);
	}
	if (place_meeting(x + sign(hsp), y, obj_solid) || scr_solid_slope(x + sign(hsp), y))
	{
		movespeed = 4;
		xscale *= -1;
	}
	if key_down2
	{
		sprite_index = spr_bodyslamstart;
		image_index = 0;
		state = states.freefallprep;
		vsp = (character == "P") ? -5 : -7;
	}
	if grounded && vsp > 0
	{
		state = states.normal;
		if movespeed >= 12
		{
			state = states.mach3;
			sprite_index = spr_dashpadmach;
			image_index = 0;
		}
	}
}
