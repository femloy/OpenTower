function scr_player_shotgun()
{
	if (sprite_index == spr_shotgunpullout)
	{
		image_speed = 0.4;
		hsp = 0;
		vsp = 0;
		movespeed = 0;
		if (floor(image_index) == (image_number - 1))
		{
			sprite_index = spr_shotgunidle;
			image_index = 0;
			state = states.normal
			exit;
		}
		else
			exit;
	}
	if (dir != xscale)
	{
		dir = xscale;
		movespeed = 2;
	}
	move = key_left + key_right;
	hsp = move * movespeed;
	if (move != 0)
	{
		xscale = move;
		if (movespeed < 8)
			movespeed += 0.5;
		else if (floor(movespeed) == 8)
			movespeed = 6;
		if (movespeed < 3)
			image_speed = 0.35;
		else if (movespeed > 3 && movespeed < 6)
			image_speed = 0.45;
		else
			image_speed = 0.6;
	}
	else
		movespeed = 0;
	if (movespeed > 8)
		movespeed -= 0.1;
	if (!landAnim)
	{
		if (grounded && move != 0)
			sprite_index = spr_shotgunwalk;
		else if (grounded)
			sprite_index = spr_shotgunidle;
	}
	else if (floor(image_index) == (image_number - 1))
	{
		if (move != 0)
			sprite_index = spr_shotgunwalk;
		else
			sprite_index = spr_shotgunidle;
		image_index = 0;
	}
	if (!grounded)
	{
		state = states.shotgunjump;
		sprite_index = spr_shotgunfall;
		image_index = 0;
	}
	else if (input_buffer_jump > 0)
	{
		input_buffer_jump = 0;
		state = states.shotgunjump;
		sprite_index = spr_shotgunjump;
		image_index = 0;
		jumpstop = false;
		vsp = -11;
	}
	if (grounded && key_down)
	{
		state = states.shotguncrouch;
		sprite_index = spr_shotgungoduck;
		image_index = 0;
	}
	if (key_attack2)
	{
		state = states.shotgundash;
		sprite_index = spr_shotgunsuplexdash;
		image_index = 0;
		movespeed = 10;
	}
	if (key_slap2)
	{
		fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
		state = states.shotgunshoot;
		sprite_index = spr_shotgunshoot;
		image_index = 0;
		with (instance_create(x, y, obj_pistoleffect))
			image_xscale = other.xscale;
		with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
		{
			image_xscale = other.xscale;
			shotgun = true;
		}
		with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
		{
			image_xscale = other.xscale;
			spdh = 4;
			shotgun = true;
		}
		with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
		{
			image_xscale = other.xscale;
			spdh = -4;
			shotgun = true;
		}
	}
}
