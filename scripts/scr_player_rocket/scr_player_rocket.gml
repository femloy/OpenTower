function scr_player_rocket()
{
	hsp = xscale * movespeed;
	move = key_right + key_left;
	alarm[5] = -1;
	alarm[8] = 60;
	alarm[7] = 120;
	hurted = true;
	if !ispeppino && sprite_index == spr_rocketstart
	{
		global.combotimepause = 5;
		image_speed = 0.35;
		hsp = 0;
		vsp = 0;
		if floor(image_index) == image_number - 1
			sprite_index = spr_rocket;
		exit;
	}
	with (instance_place(x + hsp, y, obj_asteroid))
		instance_destroy();
	if sprite_index != spr_rocketstart
	{
		var _spd = 6;
		var _accel = 1;
		if key_up && !key_down
			rocketvsp = Approach(rocketvsp, -_spd, _accel);
		else if key_down && !key_up
			rocketvsp = Approach(rocketvsp, _spd, _accel);
		else
			rocketvsp = Approach(rocketvsp, 0, _accel);
		vsp = rocketvsp;
		if move == xscale
			movespeed = Approach(movespeed, 16, 0.15);
		else if movespeed > 12
			movespeed = Approach(movespeed, 12, 0.15);
	}
	else
	{
		rocketvsp = 0;
		vsp = 0;
		if floor(image_index) == image_number - 1
		{
			sprite_index = spr_rocket;
			image_index = 0;
			movespeed = 12;
		}
	}
	if input_buffer_jump > 0
	{
		input_buffer_jump = 0;
		dir = xscale;
		state = states.mach2;
		sprite_index = spr_mach2jump;
		jumpstop = false;
		vsp = -11;
		instance_create(x, y, obj_jumpdust);
		with (instance_create(x, y + 12, obj_rocketdead))
		{
			hsp = other.xscale * 6;
			vsp = 5;
			image_xscale = sign(hsp);
		}
	}
	if fightball == 0
	{
		if sprite_index != spr_rocketstart
		{
			sprite_index = spr_rocket;
			if grounded && vsp >= 0 && ispeppino
				sprite_index = spr_player_rocketrun;
		}
	}
	if grounded
	{
		move = key_left + key_right;
		if ispeppino && move != 0 && move != xscale && sprite_index != spr_rocketstart && state != states.mach2
		{
			state = states.rocketslide;
			fmod_event_one_shot_3d("event:/sfx/pep/machslideboost", x, y);
			sprite_index = spr_player_rocketslide;
			image_index = 0;
		}
	}
	if (scr_solid(x + sign(hsp), y) && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && (!place_meeting(x + sign(hsp), y, obj_metalblock) && (!place_meeting(x + sign(hsp), y, obj_ratblock) || place_meeting(x + sign(hsp), y, obj_rattumble)) && character != "V") && (!place_meeting(x + sign(hsp), y, obj_destructibles) && character != "V") && !place_meeting(x + sign(hsp), y, obj_hungrypillar))
	{
		if ispeppino
		{
			pizzapepper = 0;
			sprite_index = spr_rockethitwall;
			fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
			fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
			with obj_camera
			{
				shake_mag = 20;
				shake_mag_acc = 40 / room_speed;
			}
			hsp = 0;
			image_speed = 0.35;
			with obj_baddie
			{
				if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
				{
					stun = true;
					alarm[0] = 200;
					ministun = false;
					vsp = -5;
					hsp = 0;
				}
			}
			flash = false;
			state = states.bump;
			hsp = -3.5 * xscale;
			vsp = -6;
			mach2 = 0;
			image_index = 0;
			instance_create(x - 10, y + 10, obj_bumpeffect);
			instance_create(x, y, obj_playerexplosion);
		}
		else
		{
			fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y);
			sprite_index = spr_playerN_rocketbump;
			with (instance_create(x + (xscale * 26), y + 10, obj_bumpeffect))
			{
				image_speed = 0.35;
				sprite_index = spr_playerN_rocketbumpeffect;
				image_xscale = other.xscale;
			}
			with (instance_create(x + (xscale * 10), y, obj_hurtstars))
				sprite_index = spr_playerN_rocketbumpdebris;
			image_index = 0;
			state = states.rocketslide;
		}
	}
	if (!instance_exists(dashcloudid) && grounded && !place_meeting(x, y + 1, obj_water))
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if other.fightball == 1
				instance_create(obj_player.x, obj_player.y, obj_slapstar);
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
	if (!instance_exists(dashcloudid) && grounded && place_meeting(x, y + 1, obj_water))
	{
		with (instance_create(x, y, obj_superdashcloud))
		{
			if other.fightball == 1
				instance_create(obj_player.x, obj_player.y, obj_slapstar);
			image_xscale = other.xscale;
			sprite_index = spr_watereffect;
			other.dashcloudid = id;
		}
	}
	if (sprite_index != spr_rocketstart && !instance_exists(chargeeffectid))
	{
		with (instance_create(x, y, obj_chargeeffect))
		{
			playerid = other.object_index;
			other.chargeeffectid = id;
		}
	}
	if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
		image_speed = 0.4;
	if sprite_index == spr_crazyrun
		image_speed = 0.75;
	if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
		image_speed = 0.4;
	else
		image_speed = 0.4;
	if steppybuffer > 0
		steppybuffer--;
	else if ((collision_flags & colflag.secret) <= 0)
	{
		create_particle(x, y + random_range(10, 20), particle.cloudeffect, 0);
		steppybuffer = 8;
	}
}
