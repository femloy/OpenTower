function scr_player_boxxedpep()
{
	mask_index = spr_crouchmask;
	if boxxeddash == 1
		image_speed = abs(movespeed) / 15;
	else
		image_speed = 0.5;
	doublejump = false;
	if (abs(hsp) <= 2)
		boxxeddash = false;
	if !ispeppino
		noisejetpack = 80;
	if !key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0
	{
		vsp /= 2;
		jumpstop = true;
	}
	if grounded && vsp > 0
		jumpstop = false;
	if dir != xscale
		dir = xscale;
	if sprite_index != spr_boxxedpepintro
	{
		move = key_left + key_right;
		if (place_meeting(x, y + 1, obj_railparent))
		{
			var _railinst = instance_place(x, y + 1, obj_railparent);
			railmovespeed = _railinst.movespeed;
			raildir = _railinst.dir;
		}
		hsp = movespeed + (railmovespeed * raildir);
	}
	if (scr_solid(x + sign(hsp), y) && xscale == 1 && move == 1 && (!place_meeting(x + 1, y, obj_slope) || scr_solid_slope(x + 1, y)))
		movespeed = 0;
	if (scr_solid(x + sign(hsp), y) && xscale == -1 && move == -1 && (!place_meeting(x - 1, y, obj_slope) || scr_solid_slope(x - 1, y)))
		movespeed = 0;
	if (xscale == sign(hsp) && scr_solid(x + sign(hsp), y) && (!place_meeting(x - 1, y, obj_slope) || scr_solid_slope(x - 1, y)))
		boxxeddashbuffer = 0;
	if !grounded && boxxeddashbuffer > 0
		boxxeddashbuffer--;
	if ((can_jump && input_buffer_jump > 0 && vsp > 0) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		GamepadSetVibration(0, 0.4, 0.4, 0.65);
		if ispeppino
			fmod_event_one_shot_3d("event:/sfx/boxxed/flap", x, y);
		instance_create(x, y, obj_highjumpcloud2);
		vsp = -boxxedpepjump;
		if !ispeppino
		{
			target_vsp = -4;
			vsp = target_vsp;
		}
		state = states.boxxedpepjump;
		sprite_index = spr_boxxedpep_flap;
		if !ispeppino
			sprite_index = spr_playerN_boxxedjetpack;
		image_index = 0;
		repeat 7
		{
			with (instance_create(x + random_range(-50, 50), y + random_range(0, 50), obj_highjumpcloud2))
			{
				vspeed = 2;
				sprite_index = spr_cloudeffect;
			}
		}
		jumpstop = false;
	}
	if (sprite_index == spr_boxxedpepdash || sprite_index == spr_boxxedpepdashstart)
	{
		sprite_index = spr_boxxedpepdashend;
		image_index = 0;
	}
	if (sprite_index == spr_boxxedpepdashend && floor(image_index) == image_number - 1)
		sprite_index = (move != 0) ? spr_boxxedpepwalk : spr_boxxedpepidle;
	if sprite_index != spr_boxxedpepintro && boxxeddashbuffer <= 0
	{
		if move != 0
		{
			if (((xscale > 0 && movespeed < 12) || (xscale < 0 && movespeed > -12)) && move == xscale)
				movespeed += (xscale * 0.8);
			if boxxeddash == 0
				xscale = move;
			else if move != xscale
				movespeed = Approach(movespeed, 0, 0.8);
		}
		else if boxxeddash == 0
			movespeed = Approach(movespeed, 0, 0.8);
		else
			movespeed = Approach(movespeed, 0, 0.25);
	}
	if (sprite_index == spr_boxxedpepintro && floor(image_index) == image_number - 1)
		sprite_index = spr_boxxedpepidle;
	if sprite_index != spr_boxxedpepintro
	{
		if sprite_index != spr_boxxedpep_flap
		{
			if grounded
			{
				if sprite_index != spr_boxxedpepdashend
				{
					if movespeed != 0
						sprite_index = spr_boxxedpepwalk;
					else
						sprite_index = spr_boxxedpepidle;
				}
			}
			else if boxxeddashbuffer <= 0
			{
				sprite_index = spr_boxxedpepair;
				state = states.boxxedpepjump;
			}
		}
	}
	if input_buffer_slap > 0
	{
		GamepadSetVibration(0, 0.8, 0.8, 0.65);
		input_buffer_slap = 0;
		state = states.boxxedpepspin;
		sprite_index = spr_boxxedpep_spin;
		if !ispeppino
			sprite_index = spr_playerN_boxxedhit;
		boxxedspinbuffer = 25;
		image_index = 0;
		movespeed = xscale * 12;
		with (instance_create(x, y, obj_crazyrunothereffect))
			image_xscale = other.xscale;
	}
	if move != 0 && grounded && vsp > 0
	{
		if steppybuffer > 0
			steppybuffer--;
		else
		{
			create_particle(x, y + 43, particle.cloudeffect, 0);
			steppybuffer = 14;
			fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
		}
	}
	if (sprite_index == spr_boxxedpepwalk && !steppy && floor(image_index) == image_number - 1)
	{
		steppy = true;
		if ispeppino
			fmod_event_one_shot_3d("event:/sfx/boxxed/step", x, y);
	}
	else if floor(image_index) != image_number - 1
		steppy = false;
}
