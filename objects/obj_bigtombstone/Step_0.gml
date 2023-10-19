mask_index = spr_player_mask;
switch (state)
{
	case states.normal:
		if (grounded)
			hsp = 0;
		substate = states.normal;
		break;
	case states.ghostpossess:
		key_left = playerid.key_left;
		key_right = playerid.key_right;
		key_jump = playerid.key_jump;
		move = key_left + key_right;
		playerid.x = x;
		playerid.y = y;
		playerid.xscale = xscale;
		switch (substate)
		{
			case states.normal:
				hsp = 0;
				if (key_jump)
					playerid.input_buffer_jump = 0;
				if (playerid.input_buffer_jump < 8)
				{
					playerid.input_buffer_jump = 8;
					vsp = -14;
					if (move != 0)
						xscale = sign(move);
					hsp = xscale * 6;
					substate = states.jump;
				}
				break;
			case states.jump:
				if (key_jump)
					playerid.input_buffer_jump = 0;
				if (grounded)
					substate = states.normal;
				if (playerid.key_down2)
				{
					substate = states.freefall;
					vsp = 20;
					hsp = 0;
				}
				break;
			case states.freefall:
				instance_destroy(instance_place(x, y + vsp, obj_metalblock));
				with (obj_destructibles)
				{
					if (place_meeting(x, y - other.vsp, other))
						instance_destroy();
				}
				if (grounded)
				{
					substate = states.normal;
					fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
					with (obj_camera)
					{
						shake_mag = 3;
						shake_mag_acc = 3 / room_speed;
					}
				}
				break;
		}
		break;
}
scr_collide();
event_inherited();
