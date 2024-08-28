function scr_player_bombgrab()
{
	move = key_left + key_right;
	if sprite_index != spr_uppercutfinishingblow && sprite_index != spr_player_throw
		hsp = move * movespeed;
	else
		hsp = 0;
	if hsp != 0
		xscale = sign(hsp);
	if dir != xscale
	{
		dir = xscale;
		movespeed = 0;
	}
	if grounded
		jumpstop = false;
	if !key_jump2 && !jumpstop && vsp < 0.5 && !stompAnim
	{
		vsp /= 2;
		jumpstop = true;
	}
	image_speed = 0.35;
	if (sprite_index == spr_haulingstart && floor(image_index) == image_number - 1)
		sprite_index = spr_haulingidle;
	if move != 0
	{
		if movespeed < 8
			movespeed += 0.5;
		else if movespeed == 6
			movespeed = 6;
		else
			movespeed -= 0.5;
	}
	else
		movespeed = 0;
	if (!instance_exists(bombgrabID))
		state = states.normal;
	if sprite_index != spr_haulingstart && sprite_index != spr_uppercutfinishingblow && sprite_index != spr_player_throw
	{
		if grounded && vsp > 0
		{
			if hsp != 0
				sprite_index = spr_haulingwalk;
			else
				sprite_index = spr_haulingidle;
		}
		else if sprite_index != spr_haulingjump
			sprite_index = spr_haulingfall;
		if input_buffer_jump > 0 && can_jump
		{
			scr_fmod_soundeffect(jumpsnd, x, y);
			instance_create(x, y, obj_highjumpcloud2);
			vsp = -11;
			input_buffer_jump = 0;
			sprite_index = spr_haulingjump;
			image_index = 0;
		}
		if ((sprite_index == spr_haulingjump || sprite_index == spr_haulingfall) && grounded && vsp > 0)
		{
			fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
			create_particle(x, y, particle.landcloud);
		}
		if !ispeppino
		{
			if (place_meeting(x + hsp, y, obj_ratblock) || place_meeting(x, y + vsp, obj_ratblock))
			{
				with bombgrabID
				{
					hurtplayer = false;
					x = other.x + hsp;
					y = other.y + vsp;
					instance_destroy();
				}
				pizzapepper = 0;
				sprite_index = spr_rockethitwall;
				fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
				fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
				image_speed = 0.35;
				flash = false;
				state = states.bump;
				hsp = -3.5 * xscale;
				vsp = -6;
				image_index = 0;
			}
		}
		if (sprite_index == spr_haulingjump && floor(image_index) == image_number - 1)
			sprite_index = spr_haulingfall;
		if input_buffer_slap > 0 && ispeppino
		{
			input_buffer_slap = 0;
			image_index = 0;
			if key_up
			{
				fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
				sprite_index = spr_uppercutfinishingblow;
				image_index = 3;
				with bombgrabID
				{
					state = states.normal;
					vsp = -20;
					hsp = 0;
				}
			}
			else
			{
				sprite_index = spr_player_throw;
				with bombgrabID
				{
					state = states.normal;
					movespeed = 9;
					vsp = -11;
				}
			}
			with bombgrabID
			{
				while (scr_solid(x, y))
				{
					y++;
					if y > room_height
					{
						y = other.y;
						break;
					}
				}
			}
		}
		else if key_down
		{
			if grounded
			{
				state = states.normal;
				with bombgrabID
				{
					state = states.normal;
					x = other.x;
					y = other.y;
				}
			}
		}
	}
	else if sprite_index != spr_haulingstart
	{
		if floor(image_index) == image_number - 1
			state = states.normal;
	}
}
function scr_player_bombpepup()
{
	image_speed = 0.35;
	vsp = bombup_dir * 11;
	hsp = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles))
	{
		pizzapepper = 0;
		a = 0;
		if sprite_index == spr_player_supersidejump
			sprite_index = spr_player_supersidejumpland;
		if (sprite_index == spr_superjump || sprite_index == spr_superspringplayer)
			sprite_index = spr_superjumpland;
		with obj_camera
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		with obj_baddie
		{
			if (point_in_camera(x, y, view_camera[0]))
			{
				image_index = 0;
				if grounded
					vsp = -7;
			}
		}
		fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
		image_index = 0;
		state = states.Sjumpland;
		machhitAnim = false;
	}
	if (bombup_dir == 1 && scr_solid(x, y + 1) && !place_meeting(x, y + 1, obj_destructibles))
	{
		state = states.freefallland;
		sprite_index = spr_bodyslamland;
		image_index = 0;
		with obj_camera
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		with obj_baddie
		{
			if (point_in_camera(x, y, view_camera[0]))
			{
				image_index = 0;
				if grounded
					vsp = -7;
			}
		}
	}
	with (instance_place(x, y + vsp, obj_metalblock))
		instance_destroy();
}
function scr_player_bombpepside()
{
	hsp = xscale * movespeed;
	vsp = 0;
	mach2 = 0;
	if movespeed < 25
		movespeed += 0.5;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	with (instance_place(x + hsp, y, obj_metalblock))
		instance_destroy();
	if (scr_solid(x + xscale, y) && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles))
	{
		sprite_index = spr_hitwall;
		fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
		fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
		with obj_camera
		{
			shake_mag = 20;
			shake_mag_acc = 40 / room_speed;
		}
		hsp = 0;
		with obj_baddie
		{
			if (point_in_camera(x, y, view_camera[0]))
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
		hsp = -2.5;
		vsp = -3;
		mach2 = 0;
		image_index = 0;
		instance_create(x + 10, y + 10, obj_bumpeffect);
	}
}
function scr_player_bombpep()
{
	alarm[8] = 60;
	alarm[7] = 120;
	hurted = true;
	if key_jump
		input_buffer_jump = 0;
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
	if (sprite_index == spr_bombpepintro && floor(image_index) == image_number - 1)
		sprite_index = spr_bombpeprun;
	if (sprite_index == spr_bombpeprun || sprite_index == spr_bombpeprunabouttoexplode)
	{
		if movespeed <= 8
			movespeed += 0.2;
		move = key_left + key_right;
		if grounded
		{
			if (move != 0 && !instance_exists(obj_bumpeffect))
				xscale = move;
		}
		hsp = floor(xscale * movespeed);
	}
	else
	{
		hsp = 0;
		movespeed = 0;
	}
	if bombpeptimer < 20 && bombpeptimer != 0
		sprite_index = spr_bombpeprunabouttoexplode;
	if (sprite_index == spr_bombpepend && floor(image_index) == image_number - 1)
	{
		alarm[5] = 2;
		alarm[7] = 60;
		hurted = true;
		state = states.normal;
		sprite_index = spr_idle;
		image_index = 0;
	}
	if bombpeptimer == 0 && sprite_index == spr_bombpeprunabouttoexplode
	{
		hurted = true;
		scr_losepoints();
		instance_create(x, y, obj_bombexplosion);
		GamepadSetVibration((object_index == obj_player1) ? 0 : 1, 1, 1, 0.9);
		sprite_index = spr_bombpepend;
	}
	if bombpeptimer > 0
		bombpeptimer -= 0.5;
	if (scr_solid(x + 1, y) && xscale == 1 && hsp != 0 && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
	{
		instance_create(x + 10, y + 10, obj_bumpeffect);
		xscale *= -1;
		GamepadSetVibration((object_index == obj_player1) ? 0 : 1, 0.2, 0.2, 0.4);
	}
	if (scr_solid(x - 1, y) && xscale == -1 && hsp != 0 && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)))
	{
		instance_create(x - 10, y + 10, obj_bumpeffect);
		xscale *= -1;
		GamepadSetVibration((object_index == obj_player1) ? 0 : 1, 0.2, 0.2, 0.4);
	}
	if input_buffer_jump > 0 && can_jump && hsp != 0
	{
		input_buffer_jump = 0;
		vsp = -11;
	}
	if movespeed < 4
		image_speed = 0.35;
	else if movespeed > 4 && movespeed < 8
		image_speed = 0.45;
	else
		image_speed = 0.6;
	if (hsp != 0 && (floor(image_index) == 0 || floor(image_index) == 2) && steppy == 0 && grounded)
		steppy = true;
	if (floor(image_index) != 0 && floor(image_index) != 2)
		steppy = false;
	if key_slap2 && state != states.normal && sprite_index != spr_bombpepintro && sprite_index != spr_bombpepend
	{
		sprite_index = spr_player_throw;
		fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y);
		image_index = 0;
		hsp = 0;
		bombpeptimer = 0;
		movespeed = 0;
		state = states.backbreaker;
		with (instance_create(x + (xscale * 50), y, obj_pizzagoblinbomb))
		{
			hsp = other.xscale * 8;
			vsp = -11;
			if (scr_solid(x, y))
			{
				var _dir = -sign(other.xscale);
				var tx = try_solid(_dir, 0, obj_solid, 78);
				if tx != -1
					x += (tx * _dir);
			}
		}
	}
	if (!instance_exists(obj_dashcloud) && grounded && hsp != 0)
	{
		with (instance_create(x, y, obj_dashcloud))
			image_xscale = other.xscale;
	}
}
