function scr_player_arenaintro()
{
	hsp = 0;
	hurted = false;
	inv_frames = false;
	if (sprite_index == spr_player_bossintro && floor(image_index) == (image_number - 1))
		image_index = 3;
	if (sprite_index == spr_player_levelcomplete && floor(image_index) == (image_number - 1))
		image_speed = 0;
	else
		image_speed = 0.35;
}
