function scr_player_slipnslide()
{
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	alarm[5] = -1;
	alarm[8] = 60;
	alarm[7] = 120;
	hurted = true;
	machhitAnim = false;
	crouchslideAnim = true;
	
	if (!ispeppino && instance_exists(obj_surfback))
	{
		image_speed = 0.35;
		sprite_index = spr_playerN_surfing;
		move = key_left + key_right;
		hsp = xscale * movespeed;
		if move != 0
		{
			if xscale == move
				movespeed = Approach(movespeed, 15, 0.4);
			else
			{
				movespeed = Approach(movespeed, 0, 0.2);
				if movespeed == 0
					xscale = move;
			}
		}
		else
			movespeed = Approach(movespeed, 0, 0.1);
		if (scr_noise_machcancel_grab())
			exit;
		if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_slope))
			movespeed = 0;
		if grounded && vsp > 0
		{
			if (place_meeting(x, y + 1, obj_current))
			{
				if key_jump2
					vsp = -10;
				else
					vsp = -3;
				with (instance_create(x, y, obj_slidecloud))
				{
					image_xscale = other.xscale;
					sprite_index = spr_watereffect;
					fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
				}
			}
			else
			{
				state = 0;
				if key_attack
				{
					state = states.mach2;
					if movespeed < 6
						movespeed = 6;
				}
				image_index = 0;
			}
		}
		exit;
	}
	hsp = xscale * movespeed;
	
	if movespeed <= 0
	{
		state = states.normal;
		movespeed = 0;
		mach2 = 0;
		image_index = 0;
	}
	if (scr_solid(x + xscale, y) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		state = states.jump;
		vsp = -14;
		jumpstop = true;
	}
	if (scr_slope() && movespeed <= 0)
		movespeed = 2;
	image_speed = 0.35;
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 1.5 && sprite_index == spr_slipnslide)
	{
		with (instance_create(x, y, obj_slidecloud))
			image_xscale = other.xscale;
	}
	if (!instance_exists(obj_slidecloud) && grounded && movespeed > 1.5 && place_meeting(x, y + 1, obj_current))
	{
		with (instance_create(x, y, obj_slidecloud))
		{
			image_xscale = other.xscale;
			sprite_index = spr_watereffect;
			fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
		}
	}
	if (sprite_index == spr_currentplayer && !place_meeting(x, y + 1, obj_current))
	{
		fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
		fmod_event_one_shot_3d("event:/sfx/pep/slip", x, y);
		vsp = -5;
		sprite_index = spr_slipbanan1;
		image_index = 0;
		state = states.slipbanan;
		if !ispeppino
		{
			with (instance_create(x, y, obj_floaterdebris))
				image_index = 0;
			with (instance_create(x, y, obj_floaterdebris))
				image_index = 1;
			with (instance_create(x, y, obj_floaterdebris))
				image_index = 2;
		}
	}
	if (sprite_index == spr_slipnslide && place_meeting(x, y + 1, obj_current))
		sprite_index = spr_currentplayer;
}
