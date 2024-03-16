function scr_player_arenaintro()
{
	hsp = 0;
	hurted = false;
	inv_frames = false;
	if (sprite_index == spr_player_bossintro && floor(image_index) == image_number - 1)
		image_index = 3;
	if (sprite_index == spr_player_levelcomplete && floor(image_index) == image_number - 1)
		image_speed = 0;
	else
		image_speed = 0.35;
	if sprite_index == spr_playerN_levelcomplete
	{
		var ix = floor(image_index);
		if ix == image_number - 1
			image_index = image_number - 1;
		var _step = false;
		var mv = 2;
		if ix >= 0 && ix < 12
		{
			hsp = xscale * mv;
			_step = true;
		}
		else if ix >= 15 && ix < 27
		{
			hsp = -xscale * mv;
			_step = true;
		}
		if steppybuffer > 0
			steppybuffer--;
		else
		{
			steppybuffer = 10;
			if _step
				create_particle(x, y + 43, particle.cloudeffect, 0);
		}
	}
}
