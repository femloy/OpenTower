function scr_player_animation()
{
	hsp = 0;
	vsp = 0;
	if (sprite_index == spr_watchitbub2 || sprite_index == spr_playerN_glovesstart)
	{
		if sprite_index == spr_watchitbub2
		{
			with obj_camera
			{
				shake_mag = 2;
				shake_mag_acc = 10 / room_speed;
			}
		}
		global.combotimepause = 5;
		if actor_buffer > 0
			actor_buffer--;
		else
			state = 0;
		exit;
	}
	if (instance_exists(obj_pizzahead_whitefade))
	{
		image_index = image_number - 1;
		if !ispeppino
			image_index = 0;
	}
	if (floor(image_index) == image_number - 1 && !instance_exists(obj_pizzahead_whitefade))
	{
		if room == boss_pizzafacehub
		{
			switch sprite_index
			{
				case spr_slipbanan2:
					if buffer > 0
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
					if buffer > 0
						buffer--;
					else
					{
						state = tauntstoredstate;
						landAnim = false;
						sprite_index = spr_idle;
					}
					break;
				case spr_playerN_bombend:
					state = tauntstoredstate;
					sprite_index = spr_idle;
					image_index = 0;
					landAnim = false;
					facehurt = false;
					break;
			}
		}
		else
		{
			state = tauntstoredstate;
			if sprite_index == spr_playerN_freezerintro
			{
				create_transformation_tip(lang_get_value("jetpack2tip"));
				state = states.normal;
				global.noisejetpack = true;
			}
		}
	}
}
