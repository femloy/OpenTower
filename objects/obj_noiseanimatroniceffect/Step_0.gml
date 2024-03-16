vsp += 0.5;
if vsp > 20
	vsp = 20;
y += vsp;
if y >= ystart
{
	depth = 0;
	y = ystart;
	if sprite_index != spr_playerN_animatronic
	{
		sprite_index = spr_playerN_animatronic;
		if !global.swapmode
		{
			with obj_player1
			{
				state = states.normal;
				landAnim = true;
				sprite_index = spr_land;
				image_index = 0;
			}
		}
	}
}
