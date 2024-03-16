function scr_player_balloon()
{
	if !ispeppino
	{
		image_speed = 0.35;
		hsp = movespeed;
		move = key_left + key_right;
		if move != 0
			savedmove = move;
		if move != 0
			movespeed = Approach(movespeed, move * 6, 0.35);
		else
			movespeed = Approach(movespeed, 0, 0.35);
		if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope))
			movespeed = 0;
		var _jump = false;
		if key_slap2
		{
			input_buffer_slap = 0;
			_jump = true;
			balloonbuffer = 0;
		}
		if (key_jump2 || _jump)
		{
			if sprite_index != spr_playerN_ratballoonfloat
			{
				image_index = 0;
				shot = false;
			}
			sprite_index = spr_playerN_ratballoonfloat;
			vsp = -5;
			if savedmove != 0
				xscale = savedmove;
			if balloonbuffer > 0
			{
				balloonbuffer--;
				if balloonbuffer <= 30 && alarm[5] == -1 && alarm[6] == -1
					alarm[5] = -1;
			}
			else
			{
				create_particle(x, y - 20, particle.genericpoofeffect, 0);
				instance_create(x, y - 20, obj_balloongrabbableeffect);
				state = states.machcancel;
				savedmove = xscale;
				sprite_index = spr_playerN_wallbounce;
				image_index = 0;
				jumpAnim = false;
				vsp = -17;
				noisewalljump = 1;
				image_alpha = 1;
				alarm[5] = -1;
				alarm[6] = -1;
			}
		}
		else
		{
			sprite_index = spr_playerN_ratballoonfall;
			if vsp < 2
				vsp += 0.1;
			else
				vsp = 2;
		}
		if sprite_index == spr_playerN_ratballoonfloat
		{
			if (floor(image_index) >= 4)
			{
				if !shot
				{
					shot = true;
					fmod_event_one_shot_3d("event:/sfx/playerN/balloonflap", x, y);
				}
			}
			else
				shot = false;
		}
		exit;
	}
	sprite_index = spr_player_ratballoon;
	hsp = movespeed;
	move = key_left + key_right;
	vsp = -5;
	image_speed = 0.35;
	if move != 0
		movespeed = Approach(movespeed, move * 6, 0.35);
	else
		movespeed = Approach(movespeed, 0, 0.35);
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope))
		movespeed = 0;
	if balloonbuffer > 0
		balloonbuffer--;
	else
	{
		create_particle(x, y - 20, particle.genericpoofeffect, 0);
		instance_create(x, y - 20, obj_balloongrabbableeffect);
		state = states.jump;
		sprite_index = spr_fall;
		jumpAnim = false;
	}
	if key_jump
	{
		create_particle(x, y - 20, particle.genericpoofeffect, 0);
		instance_create(x, y - 20, obj_balloongrabbableeffect);
		state = states.jump;
		sprite_index = spr_jump;
		image_index = 0;
		jumpAnim = true;
		movespeed = abs(movespeed);
		vsp = -11;
		jumpstop = false;
	}
}
