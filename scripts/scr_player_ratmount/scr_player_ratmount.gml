function scr_player_ratmount()
{
	if (global.swapmode && key_attack && key_fightball && ratmount_movespeed >= 12 && !instance_exists(obj_swapmodegrab) && !instance_exists(obj_swapdeatheffect) && !instance_exists(obj_noiseanimatroniceffect) && obj_swapmodefollow.animatronic <= 0)
	{
		sprite_index = spr_fightball;
		jump_p2 = false;
		instance_create_unique(x, y, obj_swapgusfightball);
		state = states.mach3;
		movespeed = abs(hsp);
		if movespeed < 12
			movespeed = 12;
		if hsp != 0
			xscale = sign(hsp);
		exit;
	}
	move = key_left + key_right;
	doublejump = false;
	if (ratgrabbedID != -4 && !instance_exists(ratgrabbedID))
		ratgrabbedID = -4;
	hsp = movespeed;
	var r = ratmount_movespeed;
	if ((place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + hsp, y, obj_destructibles)) || (abs(movespeed) < 8 && move != xscale) || !key_attack || abs(movespeed) <= 6)
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
				instance_create(x + (xscale * 15), y + 10, obj_bumpeffect);
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
	if ratmount_movespeed >= 12 && gustavodash != 51
	{
		instance_create(x, y, obj_jumpdust);
		gustavodash = 51;
	}
	if (ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
	{
		if (!instance_exists(chargeeffectid))
		{
			with (instance_create(x, y, obj_chargeeffect))
			{
				playerid = other.object_index;
				other.chargeeffectid = id;
			}
		}
	}
	if move != xscale && move != 0 && gusdashpadbuffer <= 0 && sprite_index != spr_lonegustavo_kick
	{
		xscale = move;
		if (abs(movespeed) > 2 && abs(hsp) > 2 && grounded)
		{
			fmod_event_one_shot_3d("event:/sfx/pep/backslide", x, y);
			state = states.ratmountskid;
			movespeed = abs(movespeed);
		}
	}
	if gusdashpadbuffer > 0 && movespeed != 0
		xscale = sign(movespeed);
	if gusdashpadbuffer > 0
		gusdashpadbuffer--;
	if gusdashpadbuffer <= 0
	{
		if move != 0
		{
			if move == xscale
				movespeed = Approach(movespeed, xscale * ratmount_movespeed, 0.5);
			else
				movespeed = Approach(movespeed, 0, 0.5);
		}
		else
			movespeed = Approach(movespeed, 0, 0.5);
	}
	else
	{
		ratmount_movespeed = 12;
		movespeed = xscale * ratmount_movespeed;
	}
	if (abs(movespeed) > 2)
		image_speed = abs(movespeed) / 12;
	else
		image_speed = 0.35;
	if (sprite_index == spr_player_ratmountmach3 || sprite_index == spr_lonegustavo_mach3)
		image_speed = 0.4;
	var front = scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_slope);
	if brick
	{
		if !landAnim
		{
			if hsp != 0 && !front
			{
				if (ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
					sprite_index = spr_player_ratmountmach3;
				else if key_attack
					sprite_index = spr_player_ratmountattack;
				else
					sprite_index = spr_player_ratmountmove;
			}
			else
			{
				image_speed = 0.35;
				if sprite_index != spr_player_ratmountidleanim
				{
					sprite_index = spr_player_ratmountidle;
					if ratgrabbedID == noone
					{
						if idle < 400
							idle++;
						if idle >= 150
						{
							sprite_index = spr_player_ratmountidleanim;
							image_index = 0;
						}
					}
				}
				else if floor(image_index) == image_number - 1
				{
					idle = 0;
					sprite_index = spr_player_ratmountidle;
				}
			}
		}
		if floor(image_index) == image_number - 1
		{
			landAnim = false;
			if sprite_index == spr_player_ratmountland
				sprite_index = spr_player_ratmountidle;
		}
		if sprite_index == spr_player_ratmountland
			image_speed = 0.35;
	}
	else
	{
		if hsp != 0 && !front
		{
			if (ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
				sprite_index = spr_lonegustavo_mach3;
			else if key_attack
				sprite_index = spr_lonegustavo_dash;
			else
				sprite_index = spr_lonegustavo_walk;
		}
		else
			sprite_index = spr_lonegustavo_idle;
		image_speed = 0.35;
	}
	if hsp != 0 && grounded && vsp > 0 && !front
	{
		if steppybuffer > 0
			steppybuffer--;
		else
		{
			create_particle(x, y + 43, particle.cloudeffect, 0);
			steppybuffer = 18;
			if sprite_index != spr_player_ratmountattack
				fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
		}
	}
	if input_buffer_jump > 0 && can_jump && gusdashpadbuffer == 0 && state != states.ratmountskid
	{
		input_buffer_jump = 0;
		particle_set_scale(particle.highjumpcloud2, xscale, 1);
		create_particle(x, y, particle.highjumpcloud2, 0);
		scr_fmod_soundeffect(jumpsnd, x, y);
		if brick
		{
			if ((ratmount_movespeed >= 12 && key_attack) || gusdashpadbuffer > 0)
				sprite_index = spr_player_ratmountdashjump;
			else
				sprite_index = spr_player_ratmountjump;
		}
		else if ((ratmount_movespeed >= 12 && key_attack) || gusdashpadbuffer > 0)
			sprite_index = spr_lonegustavo_dashjump;
		else
			sprite_index = spr_player_ratmountgroundpound;
		image_index = 0;
		jumpAnim = true;
		state = states.ratmountjump;
		vsp = -11;
		jumpstop = false;
	}
	if !grounded && sprite_index != spr_player_ratmountswallow
	{
		state = states.ratmountjump;
		jumpAnim = false;
		if ratmount_movespeed >= 12
		{
			if brick
				sprite_index = spr_player_ratmountdashjump;
			else
				sprite_index = spr_lonegustavo_dashjump;
		}
		else if brick
			sprite_index = spr_player_ratmountfall;
		else
			sprite_index = spr_player_ratmountgroundpoundfall;
	}
	if (key_attack && grounded && !place_meeting(x + xscale, y, obj_solid))
	{
		move = xscale;
		if ratmount_movespeed < 12
			ratmount_movespeed = Approach(ratmount_movespeed, 12, 0.15);
	}
	if (((input_buffer_slap > 0 && key_up) || key_shoot2) && brick && gusdashpadbuffer == 0)
	{
		input_buffer_slap = 0;
		ratmount_kickbrick();
		if state == states.ratmountskid
		{
			movespeed = -movespeed;
			hsp = movespeed;
		}
	}
	if input_buffer_slap > 0 && !key_up && gusdashpadbuffer == 0
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
		ratmountpunchtimer = 25;
		gustavohitwall = false;
		state = states.ratmountpunch;
		image_index = 0;
		if move != 0
			xscale = move;
		movespeed = xscale * 12;
		sprite_index = spr_lonegustavo_punch;
	}
	if (!instance_exists(dashcloudid) && grounded && ratmount_movespeed >= 12)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
	if ((key_down && grounded && vsp > 0 && gusdashpadbuffer <= 0) || scr_solid(x, y))
	{
		state = states.ratmountcrouch;
		if brick == 1
		{
			with (instance_create(x, y, obj_brickcomeback))
				wait = true;
		}
		brick = false;
	}
	with ratgrabbedID
		scr_enemy_ratgrabbed();
	ratmount_shootpowerup();
	ratmount_dotaunt();
}
function ratmount_dotaunt()
{
	if key_taunt2 && state != states.backbreaker && brick && gusdashpadbuffer == 0
	{
		notification_push(notifs.taunt, [room]);
		tauntstoredisgustavo = true;
		taunttimer = 20;
		tauntstoredmovespeed = movespeed;
		tauntstoredratmount_movespeed = ratmount_movespeed;
		tauntstoredsprite = sprite_index;
		tauntstoredstate = state;
		tauntstoredvsp = vsp;
		state = states.backbreaker;
		if (!supercharged || !key_up)
		{
			scr_create_parryhitbox();
			fmod_event_one_shot_3d("event:/sfx/pep/taunt", x, y);
			sprite_index = spr_player_ratmounttaunt;
			image_index = irandom(sprite_get_number(sprite_index) - 1);
			with (instance_create(x, y, obj_taunteffect))
				player = other.id;
		}
		else if supercharged && key_up
		{
			ini_open_from_string(obj_savesystem.ini_str);
			ini_write_real("Game", "supertaunt", true);
			obj_savesystem.ini_str = ini_close();
			fmod_event_one_shot_3d("event:/sfx/pep/supertaunt", x, y);
			sprite_index = spr_player_ratmountsupertaunt;
			image_index = 0;
		}
	}
}
function ratmount_kickbrick()
{
	var _pad = 32;
	fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x + (image_xscale * _pad), y);
	with (instance_create(x + (image_xscale * _pad), y, obj_brickball))
	{
		if (other.state == states.ratmountjump || other.state == states.ratmountbounce)
			up = true;
		image_xscale = other.xscale;
		xoffset = _pad;
	}
	state = states.ratmountgroundpound;
	sprite_index = spr_lonegustavo_kick;
	image_index = 0;
	image_speed = 0.35;
	gustavokicktimer = 5;
	brick = false;
}
function ratmount_shootpowerup()
{
	if key_shoot2 && ratpowerup != -4 && ratshootbuffer <= 0
	{
		switch ratpowerup
		{
			case obj_noisegoblin:
				with (instance_create(x + (20 * xscale), y, obj_playernoisearrow))
					direction = point_direction(x, y, x + (other.xscale * 4), y);
				break;
			case obj_smokingpizzaslice:
				with (instance_create(x + (20 * xscale), y + 20, obj_playersmokehitbox))
				{
					spd += (other.movespeed / 2);
					image_xscale = other.xscale;
				}
				break;
			case obj_spitcheese:
				with (instance_create(x + (20 * xscale), y, obj_playerspikecheese))
				{
					spd += other.movespeed;
					image_xscale = other.xscale;
				}
				break;
		}
		ratshootbuffer = 30;
	}
}
