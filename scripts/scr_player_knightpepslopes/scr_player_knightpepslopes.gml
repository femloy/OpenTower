function scr_player_knightpepslopes()
{
	if ((x + hsp) == xprevious)
		slope_buffer--;
	else
		slope_buffer = 20;
	alarm[5] = 2;
	alarm[7] = 60;
	if knightmiddairstop == 0
		hsp = xscale * movespeed;
	image_speed = 0.35;
	if !key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0
	{
		vsp /= 2;
		jumpstop = true;
	}
	if grounded && vsp > 0
		jumpstop = false;
	if (!scr_slope() && grounded && sprite_index != spr_playerN_knightgroundbump)
		sprite_index = spr_knightpepcharge;
	if vsp > 0
	{
		if (scr_slope())
		{
			sprite_index = spr_knightpepdownslope;
			with (instance_place(x, y + 1, obj_slope))
			{
				if (sign(image_xscale) == other.xscale)
					other.sprite_index = other.spr_knightpepupslope;
			}
		}
	}
	if input_buffer_jump > 0
	{
		if (can_jump || !doublejump)
		{
			scr_fmod_soundeffect(jumpsnd, x, y);
			vsp = -11;
			sprite_index = spr_knightpepfly;
			image_index = 0;
			input_buffer_jump = 0;
			if !can_jump
			{
				repeat 4
				{
					with (instance_create(x + random_range(-50, 50), y + random_range(0, 50), obj_highjumpcloud2))
					{
						vspeed = 2;
						sprite_index = spr_cloudeffect;
					}
				}
				vsp = -11;
				doublejump = true;
				sprite_index = spr_knightpepdoublejump;
			}
			if !doublejump
			{
				particle_set_scale(particle.jumpdust, xscale, 1);
				create_particle(x, y, particle.jumpdust, 0);
			}
		}
	}
	if sprite_index != spr_knightpepfly && sprite_index != spr_playerN_knightdoublejumpfall && sprite_index != spr_knightpepdoublejump && sprite_index != spr_knightpepjump && !grounded
		sprite_index = spr_knightpepfly;
	if ((sprite_index == spr_knightpepdoublejump || sprite_index == spr_knightpepfly) && floor(image_index) == image_number - 1)
		image_index = image_number - 1;
	if (sprite_index == spr_playerN_knightgroundbump && floor(image_index) == image_number - 1)
		sprite_index = spr_knightpepcharge;
	if (scr_solid(x + sign(hsp), y) && (!scr_slope() || place_meeting(x + sign(hsp), y - 2, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		if ispeppino
		{
			instance_create(x + (xscale * 40), y, obj_bumpeffect);
			movespeed = 0;
			vsp = -6;
			sprite_index = spr_knightpepbump;
			image_index = floor(image_number - 1);
			state = states.knightpepbump;
			fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
		}
		else
		{
			instance_create(x + (xscale * 35), y + 15, obj_bumpeffect);
			repeat 6
				create_debris(x + (xscale * 35), y + 15, spr_spark);
			xscale *= -1;
			sprite_index = spr_playerN_knightgroundbump;
			image_index = 0;
			fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
		}
		notification_push(notifs.knightpep_bump, []);
	}
	if (scr_slope())
	{
		with (instance_place(x, y + 1, obj_slope))
		{
			if (other.xscale == -sign(image_xscale))
			{
				if other.movespeed < 14
					other.movespeed += 0.25;
			}
		}
	}
	if (!grounded && scr_check_groundpound() && sprite_index != spr_knightpepdowntrust)
	{
		fmod_event_one_shot_3d("event:/sfx/knight/down", x, y);
		if vsp >= 12
		{
			with (instance_create(x, y - 16, obj_parryeffect))
				sprite_index = spr_knightpep_downcloud;
		}
		sprite_index = spr_knightpepdowntrust;
		vsp = -5;
		hsp = 0;
		movespeed = 0;
		state = states.knightpep;
		knightdowncloud = true;
	}
}
