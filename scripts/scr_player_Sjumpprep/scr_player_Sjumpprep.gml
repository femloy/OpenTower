function scr_player_Sjumpprep()
{
	switch character
	{
		case "P":
			if (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft)
				move = key_left + key_right;
			else
				move = xscale;
			if (!place_meeting(x, y + 1, obj_railparent))
				hsp = move * movespeed;
			else
			{
				var _railinst = instance_place(x, y + 1, obj_railparent);
				hsp = (move * movespeed) + (_railinst.movespeed * _railinst.dir);
			}
			if sprite_index == spr_superjumpprep
				movespeed = Approach(movespeed, 0, 1);
			if (floor(image_index) == image_number - 1 && sprite_index == spr_superjumpprep)
				sprite_index = spr_superjumppreplight;
			if sprite_index == spr_superjumppreplight
				movespeed = 2;
			if sprite_index != spr_superjumpprep
			{
				if (move != 0 && (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpright || sprite_index == spr_superjumpleft))
				{
					if xscale == 1
					{
						if key_right
							sprite_index = spr_superjumpright;
						if -key_left
							sprite_index = spr_superjumpleft;
					}
					if xscale == -1
					{
						if key_right
							sprite_index = spr_superjumpleft;
						if -key_left
							sprite_index = spr_superjumpright;
					}
				}
				else
					sprite_index = spr_superjumppreplight;
			}
			if (!scr_check_superjump() && grounded && (character == "S" || (sprite_index == spr_superjumppreplight || sprite_index == spr_superjumpleft || sprite_index == spr_superjumpright)) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
			{
				instance_create(x, y, obj_explosioneffect);
				sprite_index = spr_superjump;
				state = states.Sjump;
				vsp = -17;
				image_index = 0;
				if !ispeppino
					scr_fmod_soundeffect(snd_noiseSjumprelease, x, y);
			}
			image_speed = 0.35;
			break;
		case "N":
			hsp = 0;
			vsp = 0;
			pogochargeactive = false;
			pogocharge = 50;
			if floor(image_index) == image_number - 1
			{
				if sprite_index == spr_playerN_jetpackstart
				{
					if pizzapepper == 0
					{
						state = states.mach3;
						sprite_index = spr_playerN_jetpackboost;
						instance_create(x, y, obj_jumpdust);
						movespeed = 15;
					}
					else
					{
						state = states.mach3;
						sprite_index = spr_crazyrun;
						instance_create(x, y, obj_jumpdust);
						movespeed = 21;
					}
				}
				else if sprite_index == spr_superjumpprep
				{
					var sjumpsnd = superjumpsnd;
					if !ispeppino
						sjumpsnd = snd_noiseSjump;
					fmod_event_instance_set_parameter(superjumpsnd, "state", 2, true);
					instance_create(x, y, obj_explosioneffect);
					sprite_index = spr_superjump;
					state = states.Sjump;
					vsp = -15;
					if !ispeppino
						scr_fmod_soundeffect(snd_noiseSjumprelease, x, y);
				}
			}
			if sprite_index == spr_playerN_jetpackstart
				image_speed = 0.5;
			else
				image_speed = 0.3;
			break;
	}
}
