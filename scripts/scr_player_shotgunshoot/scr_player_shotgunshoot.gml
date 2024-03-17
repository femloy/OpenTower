function scr_player_shotgunshoot()
{
	image_speed = 0.4;
	move = key_left + key_right;
	hsp = xscale * movespeed;
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope))
		movespeed = 0;
	if move != 0
	{
		if move == xscale
			movespeed = Approach(movespeed, 4, 0.25);
		else
			movespeed = Approach(movespeed, -8, 0.2);
	}
	else
		movespeed = Approach(movespeed, 0, 0.1);
	if ispeppino
	{
		if floor(image_index) == image_number - 1
		{
			if grounded
				state = states.normal;
			else
				state = states.jump;
			if move == -xscale
			{
				xscale = move;
				dir = xscale;
				movespeed = abs(movespeed);
				momemtum = true;
			}
		}
		if (input_buffer_slap > 0 && image_index > image_number - 3)
			scr_shotgunshoot();
	}
	else
	{
		if sprite_index != spr_shotgunshoot && sprite_index != spr_playerN_minigundown
		{
			image_index = 0;
			sprite_index = spr_shotgunshoot;
		}
		if minigunbuffer > 0
			minigunbuffer--;
		else if minigunshot > 0
		{
			minigunshot--;
			minigunbuffer = 1.5;
			fmod_event_one_shot_3d("event:/sfx/playerN/minigunshot", x, y);
			if sprite_index != spr_playerN_minigundown
			{
				with (instance_create(x + (xscale * 60), y + 27, obj_shotgunbullet))
				{
					alarm[1] = 1;
					image_xscale = other.xscale;
					sprite_index = spr_minigunprojectile;
					image_index = random_range(0, image_number - 1);
					shotgun = true;
					minigun = true;
					spdh = random_range(-4.5, 4.5);
				}
			}
			else
			{
				vsp = -4;
				with (instance_create(x + (xscale * 10), y + 25, obj_shotgunbullet))
				{
					image_xscale = other.xscale;
					sprite_index = spr_minigunprojectile;
					image_index = random_range(0, image_number - 1);
					shotgun = true;
					minigun = true;
					spdh = -25;
					spd = random_range(-4.5, 4.5);
				}
			}
		}
		else if sprite_index != spr_playerN_minigundown
		{
			if key_slap
				scr_shotgunshoot();
			else
			{
				notification_push(notifs.shotgunblast_end, [room]);
				if grounded
					state = states.normal;
				else
					state = states.jump;
				if move == -xscale
				{
					xscale = move;
					dir = xscale;
					movespeed = abs(movespeed);
					momemtum = true;
				}
			}
		}
		else if !scr_check_groundpound2()
		{
			notification_push(notifs.shotgunblast_end, [room]);
			vsp = -8;
			state = states.freefall;
			sprite_index = spr_shotgunjump1;
			image_index = 0;
		}
		else
		{
			minigunshot = 1;
			minigunbuffer = 0;
			vsp = -1;
		}
	}
}
