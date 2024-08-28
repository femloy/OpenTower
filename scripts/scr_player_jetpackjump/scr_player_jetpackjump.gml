function scr_player_jetpackjump()
{
	landAnim = false;
	if firemouth_afterimage > 0
		firemouth_afterimage--;
	else if ((collision_flags & colflag.secret) == 0)
	{
		firemouth_afterimage = 8;
		with (create_firemouth_afterimage(x, y, sprite_index, image_index - 1, xscale))
			playerid = other.id;
	}
	if sprite_index == spr_jetpackstart2
	{
		if !jumpstop
		{
			if !key_jump2 && vsp < 0.5 && !stompAnim
			{
				vsp /= 20;
				jumpstop = true;
			}
			else if (scr_solid(x, y - 1) && !jumpAnim)
			{
				vsp = grav;
				jumpstop = true;
			}
		}
	}
	if global.noisejetpack && !ispeppino && noisepizzapepper
	{
		if noisepeppermissile > 0
			noisepeppermissile--;
		else if (instance_exists(obj_baddie) && distance_to_object(obj_baddie) < 400)
		{
			noisepeppermissile = 5;
			instance_create(x, y, obj_pizzapeppermissile);
		}
	}
	if (grounded && vsp > 0 && !place_meeting(x, y + vsp, obj_destructibles) && !place_meeting(x, y + vsp, obj_iceblock_breakable))
	{
		state = states.normal;
		if sprite_index != spr_jetpackstart2
		{
			with (instance_create(x, y, obj_rocketdead))
				sprite_index = spr_jetpackdebris;
		}
	}
	with obj_iceblock_breakable
	{
		if place_meeting(x - other.hsp, y, other) || place_meeting(x - other.xscale, y, other) || place_meeting(x, y - other.vsp, other)
		{
			instance_destroy();
			GamepadSetVibration(0, 0.5, 0.5, 0.8);
			if other.vsp < 0
				other.vsp = -14;
			else if other.vsp > -11
				other.vsp = -11;
			jumpstop = false;
		}
	}
	with obj_iceblock_breakable
	{
		if place_meeting(x, y + 1, other)
		{
			instance_destroy();
			GamepadSetVibration(0, 0.5, 0.5, 0.8);
			if other.vsp < 0
				other.vsp = -14;
			else if other.vsp > -11
				other.vsp = -11;
			jumpstop = false;
		}
	}
	with obj_destructibles
	{
		if place_meeting(x - other.hsp, y, other) || place_meeting(x - other.xscale, y, other) || place_meeting(x, y - other.vsp, other) || place_meeting(x, y + 2, other)
		{
			instance_destroy();
			GamepadSetVibration(0, 0.4, 0.4, 0.8);
			if other.vsp < 0
				other.vsp = -14;
			else if other.vsp > -11
				other.vsp = -11;
			jumpstop = false;
		}
	}
	with instance_place(x + xscale, y, obj_tntblock)
	{
		instance_destroy();
		if other.vsp > -11
			other.vsp = -11;
		jumpstop = false;
	}
	with instance_place(x, y + 1, obj_tntblock)
	{
		instance_destroy();
		if other.vsp > -11
			other.vsp = -11;
		jumpstop = false;
	}
	move = key_left + key_right;
	dir = xscale;
	var spin = spr_rockethitwall;
	if (sprite_index != spin || !jetpackdash)
	{
		dir = xscale;
		if key_jump2 && sprite_index == spr_jetpackstart2
		{
			GamepadSetVibration(0, 0.3, 0.3, 0.65);
			if !key_down
				vsp = Approach(vsp, -11, 0.8);
			else
				vsp = Approach(vsp, 0, 0.8);
			image_speed = Approach(image_speed, 0.6, 0.05);
		}
		else
			image_speed = Approach(image_speed, 0.4, 0.1);
		if sprite_index == spr_player_jetpackstart && vsp > 0
		{
			sprite_index = spr_player_jetpackmid;
			image_index = 0;
		}
		else if (sprite_index == spr_player_jetpackmid && floor(image_index) == image_number - 1)
			sprite_index = spr_player_jetpackend;
		if move != 0
		{
			if move != xscale
			{
				if movespeed > 0
					movespeed -= 0.7;
				if movespeed <= 0
					xscale = move;
			}
			else if movespeed < 8
				movespeed += 0.7;
		}
		else
			movespeed = Approach(movespeed, 0, 0.7);
		hsp = move * movespeed;
	}
	else if jetpackdash
	{
		image_speed = 0.35;
		hsp = xscale * movespeed;
		vsp = 0;
		if floor(image_index) == image_number - 1
			jetpackdash = false;
	}
	if input_buffer_slap > 0 && sprite_index != spr_suplexbump
	{
		if sprite_index != spr_jetpackstart2
		{
			with (instance_create(x, y, obj_rocketdead))
				sprite_index = spr_jetpackdebris;
		}
		input_buffer_slap = 0;
		particle_set_scale(particle.jumpdust, xscale, 1);
		create_particle(x, y, particle.jumpdust, 0);
		image_index = 0;
		sprite_index = spr_suplexdashjumpstart;
		flash = true;
		suplexmove = true;
		fmod_event_instance_play(suplexdashsnd);
		state = states.handstandjump;
		movespeed = 5;
	}
	if (place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + xscale, y, obj_destructibles))
		movespeed = 0;
	if (sprite_index == spin && jetpackbounce == 1 && place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + xscale, y, obj_destructibles))
	{
		jetpackdash = false;
		instance_create(x + (xscale * 10), y, obj_bangeffect);
		jetpackbounce = false;
		vsp = -11;
		image_index = 0;
	}
	hsp = xscale * movespeed;
	if firemouth_afterimage > 0
		firemouth_afterimage--;
	else if ((collision_flags & colflag.secret) == 0)
	{
		firemouth_afterimage = 8;
		with (create_firemouth_afterimage(x, y, sprite_index, image_index - 1, xscale))
			playerid = other.id;
	}
	if punch_afterimage > 0
		punch_afterimage--;
	else
	{
		punch_afterimage = 8 + irandom_range(-4, 2);
		create_heatpuff(x - (xscale * 2), y);
	}
}
