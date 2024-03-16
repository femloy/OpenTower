function scr_player_knightpep()
{
	alarm[5] = 2;
	alarm[7] = 60;
	if sprite_index == spr_knightpep_attack && movespeed > 0
		movespeed -= 0.05;
	if (sprite_index == spr_knightpep_attack && floor(image_index) == image_number - 1)
		sprite_index = spr_knightpep_idle;
	if (sprite_index == spr_knightpepland || sprite_index == spr_knightpepwalk || sprite_index == spr_knightpepidle)
	{
		move = key_left + key_right;
		hsp = move * movespeed;
	}
	else if (sprite_index == spr_knightpep_attack || sprite_index == spr_knightpepjump || sprite_index == spr_knightpepfall || sprite_index == spr_knightpepdoublejump || sprite_index == spr_knightpepdowntrust)
	{
		hsp = xscale * movespeed;
		move = key_left + key_right;
		var _accel = 0.1;
		if move != 0
		{
			if move != xscale
			{
				movespeed = Approach(movespeed, 0, _accel);
				if movespeed <= 0
				{
					xscale = move;
					movespeed = 0;
				}
			}
			else if sprite_index != spr_knightpepstart
				movespeed = Approach(movespeed, 6, _accel);
		}
	}
	else if grounded
		hsp = 0;
	if (!grounded && scr_check_groundpound() && sprite_index != spr_knightpepdowntrust)
	{
		fmod_event_one_shot_3d("event:/sfx/knight/down", x, y);
		knightdowncloud = true;
		sprite_index = spr_knightpepdowntrust;
		vsp = -5;
		hsp = 0;
		movespeed = 0;
	}
	if sprite_index == spr_knightpepdowntrust && vsp >= 0
	{
		if knightdowncloud == 1 && vsp >= 12
		{
			with (instance_create(x, y - 16, obj_parryeffect))
				sprite_index = spr_knightpep_downcloud;
			knightdowncloud = false;
		}
		vsp += 0.5;
	}
	if grounded && vsp > 0
		jumpstop = false;
	if dir != xscale && grounded
	{
		dir = xscale;
		movespeed = 0;
	}
	if grounded && move != 0 && sprite_index == spr_knightpepidle
		sprite_index = spr_knightpepwalk;
	else if grounded && move == 0 && sprite_index == spr_knightpepwalk
		sprite_index = spr_knightpepidle;
	if !key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0
	{
		vsp /= 2;
		jumpstop = true;
	}
	if grounded && vsp > 0
		jumpstop = false;
	var dj = true;
	if ((input_buffer_jump > 0 && vsp > 0) && can_jump && (sprite_index == spr_knightpepidle || sprite_index == spr_knightpepdowntrust || sprite_index == spr_knightpepland || sprite_index == spr_knightpepwalk || sprite_index == spr_knightpepfall))
	{
		create_particle(x, y, particle.highjumpcloud1);
		dj = false;
		input_buffer_jump = 0;
		image_index = 0;
		sprite_index = spr_knightpepjumpstart;
		scr_fmod_soundeffect(jumpsnd, x, y);
		vsp = -11;
		if move == 0
			movespeed = 0;
		if move != 0
			movespeed = 6;
	}
	if (floor(image_index) == image_number - 1 && sprite_index == spr_knightpepjumpstart)
		sprite_index = spr_knightpepjump;
	if ((floor(image_index) == image_number - 1 && sprite_index == spr_knightpepjump) || (!grounded && sprite_index != spr_knightpepjumpstart && sprite_index != spr_knightpepjump && sprite_index != spr_knightpepthunder && sprite_index != spr_knightpepdowntrust && sprite_index != spr_knightpepdoublejump && sprite_index != spr_playerN_knightdoublejumpfall))
		sprite_index = spr_knightpepfall;
	if ((sprite_index == spr_knightpepdowntrust || sprite_index == spr_knightpepfall || sprite_index == spr_knightpepdoublejump || sprite_index == spr_playerN_knightdoublejumpfall) && grounded && vsp > 0 && !scr_slope())
	{
		with obj_baddie
		{
			if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
			{
				vsp = -7;
				hsp = 0;
			}
		}
		with obj_camera
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		combo = 0;
		bounce = false;
		image_index = 0;
		freefallstart = 0;
		momemtum = false;
		fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
		create_particle(x, y + 3, particle.groundpoundeffect, 0);
		sprite_index = spr_knightpepland;
		GamepadSetVibration((object_index == obj_player1) ? 0 : 1, 1, 1, 0.9);
	}
	if (floor(image_index) == image_number - 1 && sprite_index == spr_knightpepland)
	{
		sprite_index = spr_knightpepidle;
		knightmomentum = 0;
	}
	if move != 0 && grounded
		xscale = move;
	if grounded
	{
		doublejump = false;
		if move != 0
		{
			if movespeed < 6
				movespeed += 0.5;
			else if movespeed == 6
				movespeed = 6;
		}
		else if sprite_index != spr_knightpepjumpstart
			movespeed = 0;
	}
	else if knightmiddairstop == 0
	{
		hsp = xscale * movespeed;
		if !doublejump && input_buffer_jump > 0 && !can_jump && sprite_index != spr_knightpepdowntrust
		{
			scr_fmod_soundeffect(jumpsnd, x, y);
			doublejump = true;
			input_buffer_jump = 0;
			vsp = -11;
			repeat 4
			{
				with (instance_create(x + random_range(-50, 50), y + random_range(0, 50), obj_highjumpcloud2))
				{
					vspeed = 2;
					sprite_index = spr_cloudeffect;
				}
			}
			sprite_index = spr_knightpepdoublejump;
			image_index = 0;
			move = key_left + key_right;
			if move != 0
				xscale = move;
			if move != 0
				movespeed = 6;
			if move == 0
				movespeed = 0;
		}
	}
	if (!grounded && place_meeting(x + sign(hsp), y, obj_solid) && !scr_slope())
		movespeed = 0;
	if move != 0 && hsp != 0 && sprite_index != spr_knightpepdoublejump
	{
		if movespeed < 1
			image_speed = 0.15;
		else if movespeed > 1 && movespeed < 4
			image_speed = 0.35;
		else
			image_speed = 0.6;
	}
	else
		image_speed = 0.35;
	if (floor(image_index) == 4 && sprite_index == spr_knightpepstart)
		instance_create(x, y - 600, obj_thunder);
	if (floor(image_index) == image_number - 1 && sprite_index == spr_knightpepthunder)
		sprite_index = spr_knightpepidle;
	if (floor(image_index) == image_number - 1 && sprite_index == spr_knightpepdoublejump)
		image_index = image_number - 1;
	if (floor(image_index) == image_number - 1 && sprite_index == spr_playerN_knightdoublejumpfall)
		image_index = image_number - 1;
	if move != 0 && grounded && vsp > 0 && sprite_index != spr_knightpepstart && sprite_index != spr_knightpepthunder
	{
		if steppybuffer > 0
			steppybuffer--;
		else
		{
			create_particle(x, y + 43, particle.cloudeffect, 0);
			steppybuffer = 13;
			fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
		}
	}
	if (sprite_index == spr_knightpepfall || sprite_index == spr_knightpepdowntrust)
	{
		knightmomentum += 0.35;
		trace(knightmomentum);
	}
	if (scr_slope() && sprite_index != spr_knightpepthunder)
	{
		if sprite_index == spr_knightpepdowntrust
			movespeed = 11;
		else
			movespeed = 8;
		with (instance_place(x, y + 1, obj_slope))
			other.xscale = -sign(image_xscale);
		state = states.knightpepslopes;
		sprite_index = spr_knightpepdownslope;
		slope_buffer = 20;
	}
}
