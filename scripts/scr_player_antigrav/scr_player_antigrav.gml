function scr_player_antigrav()
{
	sprite_index = spr_currentplayer;
	move = key_right + key_left;
	hsp = Approach(hsp, move * 8, 0.5);
	movespeed = hsp;
	if (vsp > -14)
		vsp -= 0.5;
	if (input_buffer_jump > 0)
	{
		input_buffer_jump = 0;
		movespeed = abs(hsp);
		state = states.jump;
		sprite_index = spr_machfreefall;
		fmod_event_one_shot_3d("event:/sfx/antigrav/end", x, y);
	}
	if (scr_solid(x, y - 1))
	{
		GamepadSetVibration(0, 0.6, 0.6, 0.2);
		fmod_event_one_shot_3d("event:/sfx/antigrav/bump", x, y);
		vsp = 8;
		with (obj_antigravbubble)
		{
			sprite_index = spr_antigrav_bubblesquish;
			image_index = 0;
		}
		with (create_debris(x, y, spr_slapstar))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
		}
	}
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_ratblock) && !place_meeting(x + hsp, y, obj_destructibles))
	{
		GamepadSetVibration(0, 0.6, 0.6, 0.2);
		fmod_event_one_shot_3d("event:/sfx/antigrav/bump", x, y);
		hsp = -hsp * 0.8;
		repeat (3)
		{
			with (create_debris(x, y, spr_slapstar))
			{
				hsp = random_range(-5, 5);
				vsp = random_range(-10, 10);
			}
		}
	}
	if (steppybuffer > 0)
		steppybuffer--;
	else
	{
		instance_create(x + random_range(-50, 50), y + random_range(0, 50), obj_antigravbubbleeffect);
		steppybuffer = 8;
	}
	image_speed = abs(vsp) / 15;
}
