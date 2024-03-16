function scr_player_firemouth()
{
	alarm[5] = 2;
	alarm[7] = 60;
	if sprite_index == spr_firemouthintro
		global.combotimepause = 5;
	move = key_left + key_right;
	with (instance_place(x + hsp, y, obj_iceblock_breakable))
	{
		instance_destroy();
		if other.vsp > -11
			other.vsp = -11;
		jumpstop = false;
	}
	with (instance_place(x + xscale, y, obj_iceblock_breakable))
	{
		instance_destroy();
		if other.vsp > -11
			other.vsp = -11;
		jumpstop = false;
	}
	with (instance_place(x, y + vsp, obj_iceblock_breakable))
	{
		instance_destroy();
		if other.vsp > -11
			other.vsp = -11;
		jumpstop = false;
	}
	with (instance_place(x, y + vsp, obj_ratblock))
		instance_destroy();
	if ((scr_slope() && hsp != 0) && movespeed > 8)
		scr_player_addslopemomentum(0.1, 0.25);
	with (instance_place(x + xscale, y, obj_destructibles))
	{
		instance_destroy();
		if other.vsp > -11
			other.vsp = -11;
		jumpstop = false;
	}
	if !key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0
	{
		vsp /= 2;
		jumpstop = true;
	}
	if grounded && vsp > 0
		jumpstop = false;
	mach2 = 0;
	landAnim = false;
	alarm[5] = 2;
	if (sprite_index == spr_firemouthintro && floor(image_index) == image_number - 1)
	{
		scr_losepoints();
		sprite_index = spr_firemouth;
		dir = xscale;
	}
	if !ispeppino && !grounded && key_jump2 && !jumpstop
		vsp -= 0.25;
	if (scr_check_groundpound() && !grounded)
		vsp += 10;
	if sprite_index != spr_firemouthintro && sprite_index != spr_firemouthend
	{
		move = key_left + key_right;
		if grounded
		{
			doublejump = false;
			if move != 0
			{
				if ispeppino
				{
					if movespeed <= 8
						movespeed += 0.5;
				}
				else if movespeed <= 10
					movespeed += 0.5;
				xscale = move;
			}
			else
				movespeed = Approach(movespeed, 0, 0.5);
			if dir != xscale
			{
				dir = xscale;
				movespeed = 0;
			}
			hsp = xscale * movespeed;
			if hsp != 0
				sprite_index = spr_firemouth;
			else
				sprite_index = spr_firemouthidle;
		}
		else if sprite_index != spr_firemouthdash
		{
			dir = xscale;
			sprite_index = spr_firemouthspin;
			if move != 0
			{
				if move != xscale
				{
					if movespeed > 0
						movespeed -= 0.5;
					if movespeed <= 0
						xscale = move;
				}
				else if ispeppino
				{
					if movespeed <= 8
						movespeed += 0.5;
				}
				else if movespeed <= 10
					movespeed += 0.5;
			}
			if !doublejump && input_buffer_slap > 0
			{
				GamepadSetVibration(0, 1, 1, 0.8);
				input_buffer_slap = 0;
				doublejump = true;
				repeat 5
					instance_create(x, y, obj_firemouthflame);
				sprite_index = spr_firemouthdash;
				image_index = 0;
				if move != 0
					xscale = move;
				fmod_event_one_shot_3d("event:/sfx/firemouth/dash", x + (12 * xscale), y);
				dir = xscale;
				movespeed = 12;
			}
			hsp = xscale * movespeed;
		}
		else
		{
			hsp = xscale * movespeed;
			vsp = 0;
			if floor(image_index) == image_number - 1
				sprite_index = spr_firemouthspin;
		}
		if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_tntblock) && !place_meeting(x + hsp, y, obj_iceblock) && !place_meeting(x + hsp, y, obj_ratblock))
			movespeed = 0;
		if firemouth_afterimage > 0
			firemouth_afterimage--;
		else if ((collision_flags & colflag.secret) == 0)
		{
			firemouth_afterimage = 8;
			with (create_firemouth_afterimage(x, y, sprite_index, image_index - 1, xscale))
				playerid = other.id;
		}
	}
	else
	{
		hsp = 0;
		movespeed = 0;
	}
	if (sprite_index == spr_firemouthend && floor(image_index) == image_number - 1)
	{
		alarm[5] = 2;
		alarm[7] = 60;
		state = states.normal;
		sprite_index = spr_idle;
		image_index = 0;
	}
	if input_buffer_jump > 0 && can_jump && sprite_index != spr_firemouthintro && sprite_index != spr_firemouthend
	{
		GamepadSetVibration(0, 0.2, 0.2, 0.4);
		input_buffer_jump = 0;
		fmod_event_one_shot_3d("event:/sfx/firemouth/jump", x, y);
		with (instance_create(x, y, obj_highjumpcloud2))
			sprite_index = spr_player_firemouthjumpdust;
		repeat 5
			instance_create(x, y, obj_firemouthflame);
		vsp = -15;
		if !ispeppino
			vsp = -12;
	}
	if sprite_index == spr_firemouthintro && image_index > 22 && firemouthflames == 0
	{
		repeat 10
			instance_create(x, y, obj_firemouthflame);
		firemouthflames = true;
	}
	if sprite_index == spr_firemouth
	{
		if movespeed < 4
			image_speed = 0.35;
		else if movespeed > 4 && movespeed < 8
			image_speed = 0.45;
		else
			image_speed = 0.6;
	}
	else if sprite_index == spr_player_firemouthspin
	{
		image_speed = abs(vsp) / 10;
		if image_speed < 0.25
			image_speed = 0.25;
	}
	else
		image_speed = 0.35;
	if (hsp != 0 && (floor(image_index) == 0 || floor(image_index) == 2) && steppy == 0 && grounded)
		steppy = true;
	if (floor(image_index) != 0 && floor(image_index) != 2)
		steppy = false;
	if (!instance_exists(obj_dashcloud) && grounded && hsp != 0)
	{
		with (instance_create(x, y, obj_dashcloud))
			image_xscale = other.xscale;
	}
}
