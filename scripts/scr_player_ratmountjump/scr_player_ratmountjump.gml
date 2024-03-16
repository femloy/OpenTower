function scr_player_ratmountjump()
{
	move = key_left + key_right;
	if sprite_index == spr_lonegustavo_dashjump
		image_speed = 0.6;
	else
		image_speed = 0.35;
	if !jumpstop && vsp < 0.5 && !key_jump2
	{
		vsp /= 10;
		jumpstop = true;
	}
	hsp = movespeed;
	var r = ratmount_movespeed;
	if ((place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles)) || (abs(movespeed) < 8 && move != xscale) || abs(movespeed) <= 6)
	{
		gustavodash = 0;
		ratmount_movespeed = 8;
	}
	if ((place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope) && !place_meeting(x + hsp, y, obj_destructibles)) && gustavodash != 51)
	{
		movespeed = 0;
		if r >= 12
		{
			var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
			if _bump
			{
				fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
				state = states.bump;
				if brick
					sprite_index = spr_player_ratmountbump;
				else
					sprite_index = spr_lonegustavo_bump;
				image_index = 0;
				hsp = -xscale * 4;
				vsp = -5;
				with obj_camera
				{
					shake_mag = 4;
					shake_mag_acc = 5 / room_speed;
				}
				exit;
			}
		}
	}
	if gusdashpadbuffer > 0
		gusdashpadbuffer--;
	if gusdashpadbuffer <= 0
	{
		if move != 0
		{
			if move == xscale
				movespeed = Approach(movespeed, xscale * ratmount_movespeed, 0.5);
			else if gustavodash == 51
				movespeed = Approach(movespeed, 0, 0.5);
			else
				movespeed = Approach(movespeed, 0, 0.5);
		}
		else if gustavodash == 51
			movespeed = Approach(movespeed, 0, 0.5);
		else
			movespeed = Approach(movespeed, 0, 0.5);
		if move != xscale && move != 0
		{
			ratmount_movespeed = 8;
			xscale = move;
		}
	}
	if gusdashpadbuffer > 0 && movespeed != 0
		xscale = sign(movespeed);
	if (jumpAnim && floor(image_index) == image_number - 1)
	{
		jumpAnim = false;
		switch sprite_index
		{
			case spr_lonegustavo_jumpstart:
				sprite_index = spr_lonegustavo_jump;
				break;
			case spr_lonegustavo_dashjump:
				sprite_index = spr_lonegustavo_dashjump;
				break;
			case spr_player_ratmountgroundpound:
				sprite_index = spr_player_ratmountgroundpoundfall;
				break;
			case spr_player_ratmountjump:
				sprite_index = spr_player_ratmountfall;
				break;
			case spr_player_ratmountjump2:
				sprite_index = spr_player_ratmountfall2;
				break;
			case spr_player_ratmountballoonend2:
				sprite_index = spr_player_ratmountballoonend3;
				break;
			case spr_player_ratmountmushroombounce:
				jumpAnim = true;
				image_index = image_number - 1;
				break;
			case spr_player_ratmountballoonend1:
				if vsp > 0
				{
					jumpAnim = true;
					sprite_index = spr_player_ratmountballoonend2;
				}
				else
					jumpAnim = true;
				break;
		}
	}
	if (scr_check_groundpound())
	{
		if brick
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = true;
				instance_create(x, y, obj_genericpoofeffect);
			}
		}
		brick = false;
		movespeed = hsp;
		state = states.ratmountgroundpound;
		image_index = 0;
		sprite_index = spr_lonegustavo_groundpoundstart;
	}
	if (((input_buffer_slap > 0 && key_up) || key_shoot2) && brick)
	{
		input_buffer_slap = 0;
		ratmount_kickbrick();
	}
	if input_buffer_slap > 0 && !key_up
	{
		particle_set_scale(particle.jumpdust, xscale, 1);
		create_particle(x, y, particle.jumpdust, 0);
		input_buffer_slap = 0;
		if brick == 1
		{
			with (instance_create(x, y, obj_brickcomeback))
				wait = true;
		}
		brick = false;
		state = states.ratmountpunch;
		gustavohitwall = false;
		ratmountpunchtimer = 25;
		image_index = 0;
		if move != 0
			xscale = move;
		movespeed = xscale * 12;
		sprite_index = spr_lonegustavo_punch;
	}
	var bounce = true;
	if (input_buffer_jump > 0 && can_jump && gusdashpadbuffer == 0 && !place_meeting(x, y + 5, obj_grindrail))
	{
		bounce = false;
		input_buffer_jump = 0;
		particle_set_scale(particle.highjumpcloud2, xscale, 1);
		create_particle(x, y, particle.highjumpcloud2, 0);
		scr_fmod_soundeffect(jumpsnd, x, y);
		if brick
		{
			if ratmount_movespeed >= 12 && key_attack
				sprite_index = spr_player_ratmountdashjump;
			else
				sprite_index = spr_player_ratmountjump;
		}
		else if ratmount_movespeed >= 12 && key_attack
			sprite_index = spr_lonegustavo_dashjump;
		else
			sprite_index = spr_player_ratmountgroundpound;
		image_index = 0;
		jumpAnim = true;
		state = states.ratmountjump;
		vsp = -11;
		jumpstop = false;
	}
	if key_jump && brick && bounce
	{
		GamepadSetVibration(0, 0.8, 0.8, 0.65);
		state = states.ratmountbounce;
		instance_create(x, y, obj_highjumpcloud2);
		sprite_index = spr_player_ratmountwalljump;
		image_index = 0;
		vsp = -16;
	}
	if grounded && vsp > 0 && sprite_index != spr_lonegustavo_kick
	{
		doublejump = false;
		create_particle(x, y, particle.landcloud, 0);
		state = states.ratmount;
		landAnim = true;
		jumpstop = false;
		if brick && !key_attack
			sprite_index = spr_player_ratmountland;
		else
			landAnim = false;
		image_index = 0;
	}
	with ratgrabbedID
		scr_enemy_ratgrabbed();
	ratmount_shootpowerup();
	ratmount_dotaunt();
}
