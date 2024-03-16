function scr_player_rideweenie()
{
	hsp = movespeed;
	move = key_right + key_left;
	if sprite_index != spr_weenieturn
		sprite_index = spr_rideweenie;
	if move != 0
	{
		if move == xscale
			movespeed = Approach(movespeed, xscale * 16, 0.35);
		else
		{
			movespeed = Approach(movespeed, 0, 0.7);
			if (abs(movespeed) <= 0)
			{
				xscale = move;
				sprite_index = spr_weenieturn;
				image_index = 0;
			}
		}
		if (abs(movespeed) < 3 && move != 0)
			image_speed = 0.35;
		else if (abs(movespeed) > 3 && abs(movespeed) < 6)
			image_speed = 0.45;
		else
			image_speed = 0.6;
	}
	else
		movespeed = Approach(movespeed, 0, 0.7);
	if (sprite_index == spr_weenieturn && floor(image_index) == image_number - 1)
		sprite_index = spr_rideweenie;
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_ratblock) && !place_meeting(x + hsp, y, obj_destructibles))
	{
		if (abs(hsp) < 3)
			hsp = 0;
		else
		{
			scr_fmod_soundeffect(weeniebumpsnd, x, y);
			movespeed = -movespeed * 0.5;
			repeat 3
			{
				with (create_debris(x, y, spr_slapstar))
				{
					hsp = random_range(-5, 5);
					vsp = random_range(-10, 10);
				}
			}
		}
	}
	if input_buffer_jump > 0
	{
		input_buffer_jump = 0;
		scr_fmod_soundeffect(jumpsnd, x, y);
		movespeed = abs(hsp);
		if movespeed < 8
			movespeed = 8;
		dir = xscale;
		state = states.mach2;
		sprite_index = spr_mach2jump;
		jumpstop = false;
		vsp = -11;
		instance_create(x, y, obj_jumpdust);
		with (instance_create(x, y, obj_weeniemount))
		{
			buffer = 30;
			depth = -2;
			image_xscale = other.xscale;
		}
	}
	if ((dashcloudtimer == 0 && abs(hsp) > 12) && grounded)
	{
		with (instance_create(x, y, obj_superdashcloud))
			image_xscale = other.xscale;
		dashcloudtimer = 15;
	}
	if dashcloudtimer > 0
		dashcloudtimer--;
	if punch_afterimage > 0
		punch_afterimage--;
	else if (abs(hsp) > 12)
	{
		punch_afterimage = 10;
		if punch_afterimage > 0
			punch_afterimage--;
		else
		{
			punch_afterimage = 5;
			with (create_mach3effect(x, y, sprite_index, image_index, true))
				image_xscale = other.xscale;
		}
	}
	if (abs(movespeed) < 10)
		image_speed = 0.35;
	else
		image_speed = abs(movespeed) / 16;
}
