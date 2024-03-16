function scr_fakepeppino_idle()
{
	hsp = image_xscale * movespeed;
	if x != obj_player.x
		image_xscale = -sign(x - obj_player.x);
	if (sprite_index == spr_fakepeppino_land && floor(image_index) == image_number - 1)
	{
		image_index = 0;
		sprite_index = spr_fakepeppino_idle;
	}
	if (sprite_index == spr_fakepeppino_idle && floor(image_index) == image_number - 1)
	{
		movespeed = 8;
		image_index = 0;
		sprite_index = spr_fakepeppino_walk;
		state = states.walk;
	}
}
