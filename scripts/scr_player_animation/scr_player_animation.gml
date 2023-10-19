function scr_player_animation()
{
	hsp = 0;
	vsp = 0;
	if (instance_exists(obj_pizzahead_whitefade))
		image_index = image_number - 1;
	if (floor(image_index) == (image_number - 1) && !instance_exists(obj_pizzahead_whitefade))
	{
		if (room == boss_pizzafacehub)
		{
			switch (sprite_index)
			{
				case spr_slipbanan2:
					if (buffer > 0)
					{
						buffer--;
						image_index = image_number - 1;
					}
					else
					{
						sprite_index = spr_facehurtup;
						image_index = 0;
					}
					break;
				case spr_facehurtup:
					sprite_index = spr_facehurt;
					image_index = 0;
					buffer = 10;
					state = tauntstoredstate;
					landAnim = false;
					facehurt = true;
					break;
				case spr_facehurt:
					if (buffer > 0)
						buffer--;
					else
					{
						state = tauntstoredstate;
						landAnim = false;
						sprite_index = spr_idle;
					}
					break;
			}
		}
		else
			state = tauntstoredstate;
	}
}
