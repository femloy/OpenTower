function scr_player_runonball()
{
	move = key_left + key_right;
	if !key_attack
		hsp = move * movespeed;
	else
		hsp = image_xscale * movespeed;
	jumpstop = false;
	vsp = obj_player.vsp;
	sprite_index = spr_player_slipnslide;
	if key_attack && grounded
	{
		if mach2 < 35
		{
			mach2++;
			movespeed = 4;
		}
		if mach2 >= 35
			movespeed = 6;
	}
	if !key_attack
		mach2 = 0;
	image_speed = 0.35;
}
