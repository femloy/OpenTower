function scr_player_estampede()
{
	hsp = movespeed;
	move = key_left + key_right;
	if (hsp != 0)
		image_xscale = sign(hsp);
	if (floor(image_index) == (image_number - 1) && sprite_index != spr_rockethitwall)
	{
		image_speed = 0;
		if (sprite_index == spr_slipbanan2 && abs(hsp) <= 2)
		{
			state = states.normal;
			movespeed = 0;
		}
	}
	else
		image_speed = 0.35;
	if (grounded && vsp > 0)
	{
		movespeed = Approach(movespeed, 0, 0.5);
		if (sprite_index != spr_slipbanan2)
		{
			sprite_index = spr_slipbanan2;
			image_index = 0;
		}
	}
	else if (move != 0)
		movespeed = Approach(movespeed, move * 6, 0.5);
	else
		movespeed = Approach(movespeed, 0, 0.5);
}
