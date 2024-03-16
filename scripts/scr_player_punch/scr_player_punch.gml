function scr_player_punch()
{
	if (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend)
	{
		move = key_left + key_right;
		landAnim = true;
		jumpstop = false;
		image_speed = 0.4;
		hsp = movespeed;
		if move != 0
		{
			dir = move;
			movespeed = Approach(movespeed, move * 4, 0.5);
		}
		else
			movespeed = Approach(movespeed, 0, 0.5);
		if (floor(image_index) == image_number - 1 && sprite_index == spr_breakdanceuppercut)
			sprite_index = spr_breakdanceuppercutend;
		if (grounded && vsp > 0 && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend))
		{
			if hsp != 0
			{
				dir = sign(hsp);
				xscale = dir;
			}
			movespeed = abs(movespeed);
			state = states.normal;
		}
		if punch_afterimage > 0
			punch_afterimage--;
		else if vsp < 0
		{
			punch_afterimage = 5;
			if !ispeppino
			{
				with (instance_create(x, y, obj_explosioneffect))
				{
					sprite_index = spr_shineeffect;
					image_speed = 0.35;
				}
			}
			with (create_mach3effect(x, y, sprite_index, image_index, true))
			{
				image_xscale = other.xscale;
				playerid = other.id;
				vertical = true;
			}
		}
	}
	else
	{
		switch character
		{
			case "P":
			case "N":
				move = key_left + key_right;
				landAnim = true;
				jumpstop = false;
				image_speed = 0.4;
				if breakdance > 0
					breakdance--;
				if move != 0
				{
					if move != xscale && movespeed > -6
					{
						if sprite_index != spr_player_kungfujump
							movespeed -= 1;
						else
							movespeed -= 0.1;
					}
					else if move == xscale && movespeed < 6 && sprite_index == spr_player_kungfujump
						movespeed += 0.2;
				}
				hsp = xscale * movespeed;
				var _kungfuground = sprite_index == spr_player_kungfu1 || sprite_index == spr_player_kungfu2 || sprite_index == spr_player_kungfu3 || sprite_index == spr_shotgunsuplexdash;
				var _Sjumpcancel = sprite_index == spr_player_Sjumpcancel || sprite_index == spr_player_Sjumpcancelland || sprite_index == spr_player_Sjumpcancelslide;
				if _kungfuground && image_index > 7 && !key_attack && movespeed > 0
					movespeed -= 0.5;
				if floor(image_index) == image_number - 1
				{
					switch sprite_index
					{
						case spr_player_kungfu1:
						case spr_player_kungfu2:
						case spr_player_kungfu3:
						case spr_shotgunsuplexdash:
							state = states.normal;
							if move != xscale && move != 0
								movespeed = 2;
							break;
						case spr_player_kungfuair1transition:
							sprite_index = spr_player_kungfuair1;
							break;
						case spr_player_kungfuair2transition:
							sprite_index = spr_player_kungfuair2;
							break;
						case spr_player_kungfuair3transition:
							sprite_index = spr_player_kungfuair3;
							break;
						case spr_player_Sjumpcancelland:
							sprite_index = spr_player_Sjumpcancelslide;
							break;
					}
				}
				if !_kungfuground && !_Sjumpcancel
				{
					if grounded && vsp >= 0
						state = states.normal;
				}
				if _Sjumpcancel
				{
					if grounded && vsp > 0
					{
						if sprite_index == spr_player_Sjumpcancel
						{
							sprite_index = spr_player_Sjumpcancelland;
							image_index = 0;
						}
						if key_attack
						{
							if movespeed >= 12
								state = states.mach3;
							else
								state = states.mach2;
							movespeed = abs(movespeed);
							sprite_index = spr_rollgetup;
							image_index = 0;
						}
						else if movespeed > 6
						{
							state = states.machslide;
							sprite_index = spr_machslidestart;
							image_index = 0;
						}
						else
							state = states.normal;
					}
					if sprite_index == spr_player_Sjumpcancelslide
						image_speed = abs(movespeed) / 15;
				}
				if (sprite_index != spr_player_kungfujump && place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_slope))
				{
					vsp = -4;
					sprite_index = spr_player_kungfujump;
					image_index = 0;
					state = states.punch;
					movespeed = -6;
				}
				if punch_afterimage > 0
					punch_afterimage--;
				else
				{
					punch_afterimage = 5;
					with (create_mach3effect(x, y, sprite_index, image_index, true))
					{
						image_xscale = other.xscale;
						playerid = other.id;
					}
				}
				if (!instance_exists(obj_dashcloud2) && grounded && movespeed > 5)
				{
					with (instance_create(x, y, obj_dashcloud2))
						image_xscale = other.xscale;
				}
				break;
		}
	}
}
