function state_player_normal()
{
	var maxmovespeed = 8;
	var maxmovespeed2 = 6;
	var accel = 0.5;
	var deccel = 0.1;
	var jumpspeed = -11;
	
	mach2 = 0;
	move = key_left + key_right;
	skateboarding = false;
	momemtum = false;
	jumpstop = false;
	if dir != xscale
	{
		dir = xscale;
		movespeed = 2;
		facehurt = false;
	}
	if key_taunt2
	{
		input_finisher_buffer = 60;
		input_attack_buffer = 0;
		input_up_buffer = 0;
		input_down_buffer = 0;
	}
	var idlespr = spr_idle;
	var movespr = spr_move;
	if global.leveltosave == "freezer" && !global.noisejetpack
		idlespr = spr_player_freezeridle;
	if global.pistol && ispeppino
	{
		idlespr = spr_player_pistolidle;
		movespr = spr_player_pistolwalk;
	}
	if room == tower_soundtest && obj_soundtest.play
	{
		idlespr = spr_pepdance;
		movespr = spr_pepdance;
		if !ispeppino
		{
			idlespr = spr_noise_vulnerable2;
			movespr = spr_noise_vulnerable2;
		}
		idle = 0;
	}
	var breakdance_max = 10;
	if (key_taunt && !shotgunAnim && (!global.pistol || !ispeppino))
		breakdance_pressed++;
	else
		breakdance_pressed = 0;
	if breakdance_pressed >= breakdance_max && !shotgunAnim
	{
		breakdance_speed = Approach(breakdance_speed, 0.6, 0.005);
		if breakdance_pressed - 1 < breakdance_max
			notification_push(notifs.breakdance, []);
	}
	else
		breakdance_speed = 0.25;
	if breakdance_speed >= 0.5
	{
		if (!instance_exists(obj_beatbox))
		{
			instance_create(x, y, obj_genericpoofeffect);
			with (instance_create(x, y, obj_beatbox))
				vsp = -11;
		}
		notecreate--;
	}
	if notecreate <= 0 && !shotgunAnim
	{
		instance_create(x + random_range(-70, 70), y + random_range(-70, 70), obj_notes);
		notecreate = 10;
	}
	if (place_meeting(x, y + 1, obj_railparent))
	{
		var _railinst = instance_place(x, y + 1, obj_railparent);
		railmovespeed = _railinst.movespeed;
		raildir = _railinst.dir;
		railmomentum = true;
	}
	hsp = (move * movespeed) + (railmovespeed * raildir);
	if move != 0
	{
		if (move != 0) // redundant...
			xscale = move;
		if movespeed < maxmovespeed
			movespeed += accel;
		else if (floor(movespeed) == maxmovespeed)
			movespeed = maxmovespeed2;
		if (movespeed < (floor(maxmovespeed2) / 2) && move != 0)
			image_speed = 0.35;
		else if (movespeed > (floor(maxmovespeed2) / 2) && movespeed < maxmovespeed2)
			image_speed = 0.45;
		else
			image_speed = 0.6;
		if !machslideAnim && !landAnim && !shotgunAnim
		{
			machslideAnim = false;
			idle = 0;
			facehurt = false;
			if shoot
				sprite_index = spr_pistolwalk;
			else if mort
				sprite_index = spr_player_mortwalk;
			else if breakdance_pressed >= breakdance_max
				sprite_index = spr_breakdance;
			else if (global.fill <= 0 && !instance_exists(obj_ghostcollectibles))
				sprite_index = spr_hurtwalk;
			else if ((global.combo >= 25 && global.combo < 50) || instance_exists(obj_pizzafaceboss)
			|| (global.noisejetpack && (ispeppino || noisepizzapepper)))
				sprite_index = spr_3hpwalk;
			else if (global.combo >= 50 || (ispeppino && instance_exists(obj_pizzaface_thunderdark)))
				sprite_index = spr_ragemove;
			else
				sprite_index = movespr;
		}
		if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_slope) && xscale == move && !place_meeting(x, y + 1, obj_slope))
			movespeed = 0;
		if move != 0 && grounded && vsp > 0
		{
			if steppybuffer > 0
				steppybuffer--;
			else if sprite_index != spr_breakdance && sprite_index != spr_pepdance && sprite_index != spr_noise_vulnerable2
			{
				create_particle(x, y + 43, particle.cloudeffect, 0);
				steppybuffer = 12;
				if (place_meeting(x, y, obj_poodebris))
					fmod_event_one_shot_3d("event:/sfx/pep/stepinshit", x, y);
				else
					fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
			}
		}
	}
	else
	{
		steppybuffer = 12;
		if sprite_index == spr_breakdance
			image_speed = breakdance_speed;
		else
			image_speed = 0.35;
		movespeed = 0;
		if !machslideAnim && !landAnim && !shotgunAnim
		{
			if idle < 400 && breakdance_pressed < breakdance_max
				idle++;
			if idle >= 150 && breakdance_pressed < breakdance_max
			{
				if (sprite_index != idlespr && floor(image_index) == image_number - 1)
				{
					facehurt = false;
					idle = 0;
				}
				if ((!global.pistol || !ispeppino) && !shotgunAnim && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6)
				{
					idleanim = random_range(0, 100);
					if (irandom(100) <= 25)
						fmod_event_one_shot_3d("event:/sfx/voice/myea", x, y);
					image_index = 0;
					if idleanim <= 16
						sprite_index = spr_idle1;
					else if idleanim > 16 && idleanim <= 32
						sprite_index = spr_idle2;
					else if idleanim > 32 && idleanim <= 48
						sprite_index = spr_idle3;
					else if idleanim > 48 && idleanim <= 64
						sprite_index = spr_idle4;
					else if idleanim > 64 && idleanim <= 80
						sprite_index = spr_idle5;
					else
						sprite_index = spr_idle6;
				}
			}
			else if !facehurt
			{
				if (windingAnim < 1800 || angry || global.playerhealth == 1 || shoot)
				{
					start_running = true;
					movespeed = 0;
					if shoot
						sprite_index = spr_player_pistolidle;
					else if mort
						sprite_index = spr_player_mortidle;
					else if breakdance_pressed >= breakdance_max
						sprite_index = spr_breakdance;
					else if (global.fill <= 0 && !instance_exists(obj_ghostcollectibles))
						sprite_index = spr_hurtidle;
					else if (global.panic && !instance_exists(obj_ghostcollectibles))
						sprite_index = spr_panic;
					else if ((global.combo >= 25 && global.combo < 50) || instance_exists(obj_pizzafaceboss)
					|| (global.noisejetpack && (ispeppino || noisepizzapepper)))
						sprite_index = spr_3hpidle;
					else if (global.combo >= 50 || (ispeppino && instance_exists(obj_pizzaface_thunderdark)))
						sprite_index = spr_rageidle;
					else
						sprite_index = idlespr;
				}
				else
				{
					idle = 0;
					windingAnim--;
					sprite_index = spr_winding;
					if breakdance_pressed >= breakdance_max
						sprite_index = spr_breakdance;
				}
			}
			else
			{
				windingAnim = 0;
				sprite_index = spr_facehurt;
				if breakdance_pressed >= breakdance_max
					sprite_index = spr_breakdance;
			}
		}
	}
	if movespeed > maxmovespeed
		movespeed -= deccel;
	if landAnim
	{
		if sprite_index == spr_player_mortland
		{
			if floor(image_index) == image_number - 1
			{
				landAnim = false;
				sprite_index = spr_player_mortidle;
				image_index = 0;
			}
		}
		else if sprite_index == spr_player_pistolland
		{
			if floor(image_index) == image_number - 1
			{
				sprite_index = idlespr;
				landAnim = false;
			}
		}
		else if !shotgunAnim
		{
			if move == 0
			{
				movespeed = 0;
				sprite_index = spr_land;
				if floor(image_index) == image_number - 1
					landAnim = false;
			}
			else
			{
				sprite_index = spr_land2;
				if floor(image_index) == image_number - 1
				{
					landAnim = false;
					sprite_index = movespr;
					image_index = 0;
				}
			}
		}
		else
		{
			sprite_index = spr_shotgunland;
			if floor(image_index) == image_number - 1
			{
				landAnim = false;
				sprite_index = spr_shotgunidle;
				if move != 0
					sprite_index = spr_shotgunwalk;
				image_index = 0;
			}
		}
	}
	else if shotgunAnim && sprite_index != spr_shotgunshoot && !machslideAnim
		sprite_index = (move == 0) ? spr_shotgunidle : spr_shotgunwalk;
	if machslideAnim
		sprite_index = spr_machslideend;
	if floor(image_index) == image_number - 1
	{
		switch sprite_index
		{
			case spr_machslideend:
				machslideAnim = false;
				sprite_index = idlespr;
				if shotgunAnim
					sprite_index = spr_shotgunidle;
				break;
			case spr_playerV_revolverend:
				sprite_index = idlespr;
				break;
			case spr_shotgunshoot:
				sprite_index = spr_shotgunidle;
				break;
			case spr_pistolshot:
				sprite_index = idlespr;
				break;
		}
	}
	if grounded
	{
		if ((key_jump || (input_buffer_jump > 0 && !key_attack && vsp > 0)) && !key_down)
		{
			input_buffer_jump = 0;
			scr_fmod_soundeffect(jumpsnd, x, y);
			if sprite_index != spr_shotgunshoot
			{
				sprite_index = spr_jump;
				if shotgunAnim
					sprite_index = spr_shotgunjump;
				else if global.pistol && ispeppino
					sprite_index = spr_player_pistoljump1;
				image_index = 0;
			}
			particle_set_scale(particle.highjumpcloud2, xscale, 1);
			create_particle(x, y, particle.highjumpcloud2, 0);
			vsp = jumpspeed;
			state = states.jump;
			jumpAnim = true;
			jumpstop = false;
			if (place_meeting(x, y + 1, obj_railparent))
				railmomentum = true;
			freefallstart = 0;
		}
		if (key_down || (grounded && vsp > 0 && scr_solid(x, y - 3) && scr_solid(x, y)) || place_meeting(x, y, obj_solid))
		{
			state = states.crouch;
			landAnim = false;
			crouchAnim = true;
			image_index = 0;
			idle = 0;
		}
	}
	else if !key_jump
	{
		if sprite_index != spr_shotgunshoot
		{
			if !shotgunAnim
				sprite_index = spr_fall;
			else
				sprite_index = spr_shotgunfall;
			if global.pistol && ispeppino
				sprite_index = spr_player_pistoljump2;
			image_index = 0;
			jumpAnim = false;
		}
		else
			jumpAnim = true;
		state = states.jump;
	}
	if input_buffer_shoot > 0
	{
		if shotgunAnim
			scr_shotgunshoot();
		else if global.pistol
			scr_pistolshoot(states.normal);
	}
	if input_buffer_slap > 0 && !key_up && shotgunAnim == 0 && !global.pistol
	{
		input_buffer_slap = 0;
		sprite_index = spr_suplexdash;
		suplexmove = true;
		particle_set_scale(particle.jumpdust, xscale, 1);
		create_particle(x, y, particle.jumpdust, 0);
		fmod_event_instance_play(suplexdashsnd);
		state = states.handstandjump;
		movespeed = 8;
		image_index = 0;
	}
	else if (input_buffer_slap > 0 && key_up && shotgunAnim == 0 && (!global.pistol || !ispeppino))
	{
		state = states.punch;
		input_buffer_slap = 0;
		image_index = 0;
		sprite_index = spr_breakdanceuppercut;
		fmod_event_instance_play(snd_uppercut);
		
		if ispeppino
			vsp = -14;
		else
			vsp = -20;
		
		movespeed = hsp;
		if key_attack // high jump going left
			movespeed = abs(hsp);
		
		particle_set_scale(particle.highjumpcloud2, xscale, 1);
		create_particle(x, y, particle.highjumpcloud2, 0);
		
		if !ispeppino
		{
			repeat 4
			{
				with (instance_create(x + irandom_range(-40, 40), y + irandom_range(-40, 40), obj_explosioneffect))
				{
					sprite_index = spr_shineeffect;
					image_speed = 0.35;
				}
			}
		}
	}
	switch character
	{
		case "P":
			if key_attack && state != states.handstandjump && !place_meeting(x + xscale, y, obj_solid) && (!place_meeting(x, y + 1, obj_iceblockslope) || !place_meeting(x + (xscale * 5), y, obj_solid)) && !global.kungfu
			{
				if !global.pistol || pistolanim == -4
				{
					sprite_index = spr_mach1;
					image_index = 0;
					state = states.mach2;
					
					if movespeed < 6 && movespeed >= 0
						movespeed = 6;
					if movespeed > -6 && movespeed < 0
						movespeed = 6;
				}
			}
			if global.kungfu && key_attack && state != states.handstandjump
			{
				state = states.blockstance;
				sprite_index = spr_player_airattack;
				hsp = 0;
				movespeed = 0;
			}
			break;
		
		case "N":
			if (pogochargeactive || pizzapepper > 0)
			{
				if key_attack2
				{
					state = states.Sjumpprep;
					image_index = 0;
					sprite_index = !key_up ? spr_playerN_jetpackstart : spr_superjumpprep;
					hsp = 0;
					vsp = 0;
				}
			}
			else if key_attack && !key_slap2
			{
				sprite_index = spr_playerN_pogostart;
				image_index = 0;
				state = states.pogo;
			}
			break;
		
		case "V":
			if (key_attack && !place_meeting(x + xscale, y, obj_solid))
			{
				if pizzapepper == 0
				{
					movespeed = 6;
					sprite_index = spr_mach1;
					image_index = 0;
					jumpAnim = true;
					state = states.mach1;
				}
				else
				{
					movespeed = 21;
					sprite_index = spr_crazyrun;
					jumpAnim = true;
					state = states.mach3;
					movespeed = 20;
				}
			}
			if (key_shoot2 && !instance_exists(dynamite_inst))
			{
				if move == 0
					movespeed = 0;
				state = states.dynamite;
				sprite_index = spr_playerV_dynamitethrow;
				image_index = 0;
				with (instance_create(x, y, obj_dynamite))
				{
					image_xscale = other.xscale;
					movespeed = 6;
					vsp = -6;
					other.dynamite_inst = id;
					playerid = other.id;
				}
			}
			if key_slap2
			{
				if move == 0
					movespeed = 0;
				sprite_index = spr_playerV_revolverstart;
				image_index = 0;
				state = states.revolver;
			}
			break;
	}
	scr_dotaunt();
	if sprite_index == spr_shotgunshoot
	{
		landAnim = false;
		machslideAnim = false;
		image_speed = 0.45;
	}
}
function state_pepperman_normal()
{
	pepperman_grab_reset();
	move = key_left + key_right;
	if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
		movespeed += pepperman_accel;
	else if (move != 0 && move != sign(xscale) && movespeed > 0)
		movespeed -= pepperman_deccel;
	else if move == 0
		movespeed -= pepperman_deccel;
	if (floor(movespeed) == pepperman_maxhsp_normal)
		movespeed = pepperman_maxhsp_normal;
	if movespeed > pepperman_maxhsp_normal
		movespeed -= 0.3;
	else if movespeed < 0
		movespeed = 0;
	if move != 0 && movespeed == 0
		xscale = move;
	hsp = xscale * movespeed;
	if sprite_index != spr_pepperman_throw
	{
		if hsp != 0
			sprite_index = spr_move;
		else
			sprite_index = spr_idle;
	}
	if ((input_buffer_jump > 0 || key_jump) && can_jump)
	{
		input_buffer_jump = 0;
		scr_fmod_soundeffect(jumpsnd, x, y);
		sprite_index = spr_jump;
		image_index = 0;
		vsp = -pepperman_jumpspeed;
		state = states.jump;
		with (instance_create(x, y - 5, obj_highjumpcloud2))
			image_xscale = other.xscale;
	}
	if !grounded && !key_jump
	{
		state = states.jump;
		sprite_index = spr_fall;
	}
	if (key_attack && (!place_meeting(x + xscale, y, obj_solid) || place_meeting(x + xscale, y, obj_destructibles)) && pepperman_grabID == noone && sprite_index != spr_pepperman_throw)
	{
		if move != 0
			xscale = move;
		state = states.shoulderbash;
		sprite_index = spr_pepperman_shoulderstart;
		image_index = 0;
	}
	if (sprite_index == spr_pepperman_throw && floor(image_index) == image_number - 1)
		sprite_index = spr_pepperman_idle;
	if (move != 0 && (floor(image_index) == 4 || floor(image_index) == 11) && steppy == 0 && character != "V")
	{
		instance_create(x, y + 38, obj_cloudeffect);
		steppy = true;
	}
	if (move != 0 && floor(image_index) != 4 && floor(image_index) != 11)
		steppy = false;
}
function pepperman_grab_reset()
{
	if pepperman_grabID != -4
	{
		if (!instance_exists(pepperman_grabID))
			pepperman_grabID = -4;
	}
}
function scr_player_normal()
{
	if character != "M"
		state_player_normal();
	else
		state_pepperman_normal();
}
