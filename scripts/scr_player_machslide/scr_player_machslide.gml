function scr_player_machslide()
{
	if (!place_meeting(x, y + 1, obj_railparent))
		hsp = xscale * movespeed;
	else
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		hsp = (xscale * movespeed) + (_railinst.movespeed * _railinst.dir);
	}
	move = key_right + key_left;
	movespeed = Approach(movespeed, 0, 0.4);
	if (sprite_index == spr_machslidestart && floor(image_index) == image_number - 1)
		sprite_index = spr_machslide;
	if (floor(image_index) == image_number - 1 && (sprite_index == spr_machslideboost || sprite_index == spr_mach3boost))
	{
		if !grounded
		{
			if sprite_index == spr_machslideboost
				sprite_index = spr_machslideboostfall;
			else if sprite_index == spr_mach3boost
				sprite_index = spr_mach3boostfall;
		}
		else
			image_index = image_number - 1;
	}
	else
		image_speed = 0.35;
	landAnim = false;
	if (floor(movespeed) <= 0 && (sprite_index == spr_machslide || sprite_index == spr_crouchslide))
	{
		state = states.normal;
		image_index = 0;
		if sprite_index == spr_machslide
			machslideAnim = true;
		movespeed = 0;
	}
	if (place_meeting(x + xscale, y, obj_solid) && (sprite_index == spr_machslide || sprite_index == spr_machslidestart))
	{
		fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y);
		sprite_index = spr_wallsplat;
		state = states.bump;
		image_index = 0;
	}
	if (((floor(image_index) == image_number - 1 && sprite_index == spr_machslideboost) || sprite_index == spr_machslideboostfall) && grounded)
	{
		hsp = 0;
		image_index = 0;
		xscale *= -1;
		movespeed = 8;
		state = states.mach2;
	}
	if (((floor(image_index) == image_number - 1 && sprite_index == spr_mach3boost) || sprite_index == spr_mach3boostfall) && grounded)
	{
		if !launch
		{
			hsp = 0;
			sprite_index = spr_mach4;
			image_index = 0;
			xscale *= -1;
			movespeed = 12;
			state = states.mach3;
		}
		else
		{
			xscale *= -1;
			sprite_index = spr_dashpadmach;
			image_index = 0;
			state = states.mach3;
			movespeed = 14;
			launched = true;
			launch = false;
			launch_buffer = 20;
		}
	}
	if sprite_index == spr_player_crouchslide && movespeed == 0 && grounded
	{
		facehurt = true;
		state = states.normal;
		sprite_index = spr_facehurtup;
	}
	if input_buffer_shoot > 0
	{
		if shotgunAnim
		{
			if move != 0
				xscale = move;
			scr_shotgunshoot();
		}
		else if global.pistol
			scr_pistolshoot(states.normal);
	}
	if (!instance_exists(dashcloudid) && grounded && !place_meeting(x, y + 1, obj_water))
	{
		with (instance_create(x, y, obj_dashcloud2))
		{
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
	if (!instance_exists(dashcloudid) && grounded && place_meeting(x, y + 1, obj_water))
	{
		with (instance_create(x, y, obj_dashcloud2))
		{
			sprite_index = spr_watereffect;
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
}
