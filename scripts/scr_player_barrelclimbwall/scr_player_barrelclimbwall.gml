function scr_player_barrelclimbwall()
{
	if !ispeppino
	{
		move = key_left + key_right;
		vsp = -wallspeed;
		sprite_index = spr_playerN_barrelclimbwall;
		if ((!key_attack && !place_meeting(x, y + 1, obj_current)) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
		{
			mask_index = spr_player_mask;
			if (!place_meeting(x, y, obj_solid))
			{
				movespeed = 0;
				state = states.barreljump;
				sprite_index = spr_barrelfall;
			}
		}
		if (scr_solid(x, y - 1))
		{
			movespeed = 0;
			state = states.barreljump;
			sprite_index = spr_barrelfall;
			mask_index = spr_player_mask;
			while (place_meeting(x, y, obj_solid))
				y++;
		}
		if (!scr_solid(x + xscale, y))
		{
			ledge_bump(32);
			state = states.barrelslide;
			vsp = 0;
			if wallspeed < 6
				wallspeed = 6;
			movespeed = wallspeed;
			sprite_index = spr_barrelroll;
		}
		if input_buffer_jump > 8
		{
			fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y);
			input_buffer_jump = 0;
			key_jump = false;
			state = states.barrelslide;
			vsp = -11;
			jumpstop = false;
			movespeed = 10;
			xscale *= -1;
			hsp = xscale * movespeed;
			sprite_index = spr_barrelroll;
		}
		with (instance_place(x, y + vsp, obj_destructibles))
			instance_destroy();
		exit;
	}
	move = key_left + key_right;
	hsp = 0;
	if (sprite_index == spr_barrelslipnslide && floor(image_index) == image_number - 1)
		sprite_index = spr_barrelroll;
	if ((!key_attack && !place_meeting(x, y + 1, obj_current)) && !scr_solid(x, y - 16) && !scr_solid(x, y - 32))
	{
		mask_index = spr_player_mask;
		if (!place_meeting(x, y, obj_solid))
		{
			movespeed = 0;
			state = states.barreljump;
			sprite_index = spr_barrelfall;
		}
	}
	if grounded && vsp > 0
	{
		state = states.barrelslide;
		xscale *= -1;
		movespeed = xscale * 8;
	}
	with (instance_place(x, y + vsp, obj_destructibles))
		instance_destroy();
}
