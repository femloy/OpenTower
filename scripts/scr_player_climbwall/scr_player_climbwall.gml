function scr_player_climbwall()
{
	switch character
	{
		case "P":
			if windingAnim < 200
				windingAnim++;
			move = key_left + key_right;
			suplexmove = false;
			vsp = -wallspeed;
			if wallspeed < 20
				wallspeed += 0.15;
			if wallspeed < 0
			{
				if mach4mode == 0
					movespeed += 0.2;
				else
					movespeed += 0.4;
			}
			if wallspeed < 0
			{
				if (!scr_solid(x + xscale, y + 50))
					vsp = 0;
			}
			crouchslideAnim = true;
			if vsp < -5
				sprite_index = spr_machclimbwall;
			else
				sprite_index = spr_player_clingwall;
			if skateboarding
			{
				if wallspeed < 0
					wallspeed = 6;
				sprite_index = spr_player_clownwallclimb;
				if !ispeppino
					sprite_index = spr_playerN_clownwallclimb;
			}
			if grabclimbbuffer > 0
				grabclimbbuffer--;
			if !key_attack && !skateboarding && grabclimbbuffer == 0
			{
				state =	states.normal;
				movespeed = 0;
				railmovespeed = 6;
				raildir = -xscale;
			}
			if (verticalbuffer <= 0 && wallspeed > 0 && !scr_solid(x + xscale, y) && !place_meeting(x, y, obj_verticalhallway) && !place_meeting(x, y - 12, obj_verticalhallway))
			{
				trace("climbwall out");
				instance_create(x, y, obj_jumpdust);
				vsp = 0;
				
				var old_x = x;
				var old_y = y;
				
				var i = 0;
				while !scr_solid(x + xscale, y)
				{
					i++;
					y++;
					if scr_solid(x + xscale, y)
					{
						y--;
						if key_slap // popup is intended
							y -= 11;
						break;
					}
					if i > 40
					{
						x = old_x;
						y = old_y;
						break;
					}
				}
				
				if wallspeed < 6
					wallspeed = 6;
				if (wallspeed >= 6 && wallspeed < 12) || skateboarding
				{
					state = states.mach2;
					movespeed = wallspeed;
				}
				else if wallspeed >= 12
				{
					state = states.mach3;
					sprite_index = spr_mach4;
					movespeed = wallspeed;
				}
				hsp = wallspeed * xscale;
			}
			if (wallspeed < 0 && place_meeting(x, y + 12, obj_solid))
				wallspeed = 0;
			if !ispeppino && !skateboarding
			{
				with (instance_create(x, y, obj_noiseeffect))
					sprite_index = spr_noisewalljumpeffect;
				sprite_index = spr_playerN_wallbounce;
				state = states.machcancel;
				savedmove = xscale;
				vsp = -(17 * (1 - (noisewalljump * 0.15)));
				noisewalljump++;
				hsp = 0;
				movespeed = 0;
				image_index = 0;
			}
			if input_buffer_jump > 8 && ispeppino
			{
				fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y);
				input_buffer_jump = 0;
				key_jump = false;
				movespeed = 10;
				railmovespeed = 0;
				state = states.mach2;
				image_index = 0;
				sprite_index = spr_walljumpstart;
				if skateboarding
					sprite_index = spr_clownjump;
				vsp = -11;
				xscale *= -1;
				jumpstop = false;
				walljumpbuffer = 4;
			}
			if (state != states.mach2 && verticalbuffer <= 0 && place_meeting(x, y - 1, obj_solid) && scr_solid(x + xscale, y) && !place_meeting(x, y - 1, obj_verticalhallway) && !place_meeting(x, y - 1, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x - sign(hsp), y, obj_slope))
			{
				trace("climbwall hit head");
				if !skateboarding
				{
					sprite_index = spr_superjumpland;
					fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
					image_index = 0;
					state = states.Sjumpland;
					machhitAnim = false;
				}
				else if !key_jump
				{
					state = states.bump;
					hsp = -2.5 * xscale;
					vsp = -3;
					mach2 = 0;
					image_index = 0;
				}
			}
			image_speed = 0.6;
			if steppybuffer > 0
				steppybuffer--;
			else
			{
				create_particle(x + (xscale * 10), y + 43, particle.cloudeffect, 0);
				steppybuffer = 10;
			}
			break;
		case "V":
			if windingAnim < 200
				windingAnim++;
			move = key_left + key_right;
			suplexmove = false;
			vsp = -wallspeed;
			if wallspeed < 24 && move == xscale
				wallspeed += 0.1;
			crouchslideAnim = true;
			sprite_index = spr_machclimbwall;
			if grabclimbbuffer > 0
				grabclimbbuffer--;
			if !key_attack && grabclimbbuffer == 0
			{
				state = states.normal
				movespeed = 0;
			}
			if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x - sign(hsp), y, obj_slope))
			{
				sprite_index = spr_superjumpland;
				fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
				image_index = 0;
				state = states.Sjumpland;
				machhitAnim = false;
			}
			if (!scr_solid(x + xscale, y) && !place_meeting(x, y, obj_verticalhallway))
			{
				instance_create(x, y, obj_jumpdust);
				vsp = 0;
				if movespeed >= 6
					state = states.mach2;
				if movespeed >= 12
				{
					state = states.mach3;
					sprite_index = spr_mach4;
				}
			}
			if input_buffer_jump > 8
			{
				input_buffer_jump = 0;
				movespeed = 8;
				state = states.mach2;
				image_index = 0;
				sprite_index = spr_walljumpstart;
				vsp = -11;
				xscale *= -1;
				jumpstop = false;
			}
			if ((grounded && wallspeed <= 0) || wallspeed <= 0)
			{
				state = states.jump;
				sprite_index = spr_fall;
			}
			image_speed = 0.6;
			if (!instance_exists(obj_cloudeffect))
				instance_create(x, y + 43, obj_cloudeffect);
			break;
		case "N":
			hsp = 0;
			if (sprite_index == spr_playerN_wallclingstart && floor(image_index) == image_number - 1)
				sprite_index = spr_playerN_wallcling;
			if sprite_index == spr_playerN_wallcling
				vsp = 2;
			else
				vsp = 0;
			wallclingcooldown = 0;
			if (floor(image_index) == image_number - 1 || !key_jump2)
			{
				vsp = -15;
				state = states.jump;
				sprite_index = spr_playerN_jump;
				image_index = 0;
			}
			if key_jump
			{
				vsp = -15;
				state = states.jump;
				sprite_index = spr_playerN_jump;
				image_index = 0;
			}
			image_speed = 0.35;
			break;
	}
}
