function scr_player_antigrav()
{
	if !ispeppino
	{
		sprite_index = spr_playerN_bubbleidle;
		move_h = key_right_axis + key_left_axis;
		move_v = key_up_axis + key_down_axis;
		move = key_left + key_right;
		if move_h == 0
			move_h = key_right + key_left;
		if move_v == 0
			move_v = key_down - key_up;
		if target_vsp > -16
		{
			if target_vsp > 0
				target_vsp -= 0.3;
			else
				target_vsp -= 0.2;
		}
		hsp = Approach(hsp, move_h * 8, 0.5);
		image_speed = abs(vsp) / 15;
		if key_up
		{
			image_speed = clamp(image_speed, 0.35, 0.65);
			sprite_index = spr_playerN_bubbleup;
			if target_vsp > -16 && target_vsp <= 0
				target_vsp -= 0.8;
		}
		vsp = target_vsp;
		if input_buffer_jump > 0
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
			target_vsp = 8;
			with obj_antigravbubble
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
			repeat 3
			{
				with (create_debris(x, y, spr_slapstar))
				{
					hsp = random_range(-5, 5);
					vsp = random_range(-10, 10);
				}
			}
		}
		if steppybuffer > 0
			steppybuffer--;
		else
		{
			instance_create(x + random_range(-50, 50), y + random_range(0, 50), obj_antigravbubbleeffect);
			steppybuffer = 8;
		}
		exit;
	}
	sprite_index = spr_currentplayer;
	if !ispeppino
		sprite_index = spr_playerN_bubbleidle;
	move = key_right + key_left;
	hsp = Approach(hsp, move * 8, 0.5);
	movespeed = hsp;
	if vsp > -14
		vsp -= 0.5;
	if input_buffer_jump > 0
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
		with obj_antigravbubble
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
		repeat 3
		{
			with (create_debris(x, y, spr_slapstar))
			{
				hsp = random_range(-5, 5);
				vsp = random_range(-10, 10);
			}
		}
	}
	if steppybuffer > 0
		steppybuffer--;
	else
	{
		instance_create(x + random_range(-50, 50), y + random_range(0, 50), obj_antigravbubbleeffect);
		steppybuffer = 8;
	}
	image_speed = abs(vsp) / 15;
}
