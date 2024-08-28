function state_player_jump()
{
	var maxmovespeed = 8;
	var maxmovespeed2 = 6;
	var turnmovespeed = 2;
	var accel = 0.5;
	var deccel = 0.1;
	var jumpspeed = -11;
	var machspeed = 6;
	
	landAnim = true;
	if !momemtum
		hsp = move * movespeed;
	else
		hsp = xscale * movespeed;
	hsp += (railmovespeed * raildir);
	if key_taunt2
	{
		input_finisher_buffer = 60;
		input_attack_buffer = 0;
		input_up_buffer = 0;
		input_down_buffefr = 0;
	}
	if dir != xscale
	{
		dir = xscale;
		movespeed = turnmovespeed;
		facehurt = false;
	}
	if move != xscale
		movespeed = turnmovespeed;
	move = key_left + key_right;
	if movespeed == 0
		momemtum = false;
	if (scr_solid(x + hsp, y))
	{
		movespeed = 0;
		mach2 = 0;
	}
	if move != 0
	{
		xscale = move;
		if movespeed < maxmovespeed
			movespeed += accel;
		else if (floor(movespeed) == maxmovespeed)
			movespeed = maxmovespeed2;
		if (scr_solid(x + xscale, y) && move == xscale)
			movespeed = 0;
	}
	else
		movespeed = 0;
	if movespeed > maxmovespeed
		movespeed -= deccel;
	if ladderbuffer > 0
		ladderbuffer--;
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
	if character == "N"
	{
		if key_jump && wallclingcooldown == 10
		{
			if (place_meeting(x + xscale, y, obj_solid))
			{
				fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
				sprite_index = spr_playerN_wallclingstart;
				image_index = 0;
				state = states.hang;
				xscale *= -1;
				vsp = 0;
				doublejump = false;
			}
			else if !doublejump && sprite_index != spr_freefall && sprite_index != spr_facestomp
			{
				sprite_index = spr_playerN_doublejump;
				image_index = 0;
				jumpstop = false;
				vsp = -9;
				doublejump = true;
				particle_set_scale(particle.highjumpcloud2, xscale, 1);
				create_particle(x, y, particle.highjumpcloud2, 0);
			}
		}
	}
	if (global.mort && (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart))
	{
		if vsp > 6
			vsp = 6;
		if !key_jump2
		{
			grav = 0.5;
			sprite_index = spr_fall;
		}
	}
	if key_jump
	{
		if global.mort && sprite_index != spr_mortdoublejump
		{
			repeat 6
				create_debris(x, y, spr_feather);
			sprite_index = spr_mortdoublejump;
			image_index = 0;
			jumpstop = false;
			grav = 0.25;
			mort = true;
		}
	}
	if (can_jump && input_buffer_jump > 0 && !key_down && !key_attack && vsp > 0 && !(sprite_index == spr_facestomp || sprite_index == spr_freefall))
	{
		input_buffer_jump = 0;
		scr_fmod_soundeffect(jumpsnd, x, y);
		stompAnim = false;
		vsp = jumpspeed;
		state = states.jump;
		jumpAnim = true;
		jumpstop = false;
		freefallstart = 0;
		railmomentum = false;
		if (place_meeting(x, y + 1, obj_railparent))
			railmomentum = true;
		if sprite_index != spr_shotgunshoot
		{
			sprite_index = spr_jump;
			if shotgunAnim
				sprite_index = spr_shotgunjump;
			if global.pistol && ispeppino
				sprite_index = spr_player_pistoljump1;
			image_index = 0;
		}
		particle_set_scale(particle.highjumpcloud2, xscale, 1);
		create_particle(x, y, particle.highjumpcloud2, 0);
	}
	if !can_jump && character == "P" && !ispeppino && key_up && noisedoublejump && input_buffer_jump > 0 && !key_down && !key_attack
	{
		freefallstart = 0;
		railmomentum = false;
		if (place_meeting(x, y + 1, obj_railparent))
			railmomentum = true;
		scr_player_do_noisecrusher();
	}
	if grounded && vsp > 0
	{
		if (vsp > 0 && (!key_attack || sprite_index == spr_suplexbump))
		{
			fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
			if (key_attack || sprite_index == spr_shotgunshoot)
				landAnim = false;
			if (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
				sprite_index = spr_player_mortland;
			if sprite_index != spr_shotgunshoot
				image_index = 0;
			if global.pistol && ispeppino
				sprite_index = spr_player_pistolland;
			input_buffer_secondjump = 0;
			state = states.normal;
			jumpAnim = true;
			jumpstop = false;
			freefallstart = 0;
			create_particle(x, y, particle.landcloud, 0);
		}
	}
	if vsp > 5 && sprite_index != spr_mortdoublejump
		fallinganimation++;
	if fallinganimation >= 40 && fallinganimation < 80
		sprite_index = spr_facestomp;
	else if fallinganimation >= 80
		sprite_index = spr_freefall;
	if !stompAnim
	{
		if !jumpAnim
		{
			switch sprite_index
			{
				case spr_mortdoublejumpstart:
					sprite_index = spr_mortdoublejump;
					break;
				case spr_suplexland:
					sprite_index = spr_fall;
					break;
				case spr_playerN_doublejump:
					sprite_index = spr_playerN_doublejumpfall;
					break;
				case spr_airdash1:
					sprite_index = spr_airdash2;
					break;
				case spr_player_pistolshot:
					sprite_index = spr_player_pistoljump2;
					break;
				case spr_shotgunjump:
					sprite_index = spr_shotgunfall;
					break;
				case spr_playerV_superjump:
					sprite_index = spr_playerV_fall;
					break;
				case spr_jump:
					sprite_index = spr_fall;
					break;
				case spr_player_pistoljump1:
					sprite_index = spr_player_pistoljump2;
					break;
				case spr_suplexcancel:
					sprite_index = spr_fall;
					break;
				case spr_player_backflip:
					sprite_index = spr_fall;
					break;
				case spr_player_Sjumpstart:
					sprite_index = spr_player_Sjump;
					break;
				case spr_player_shotgunjump1:
					sprite_index = spr_player_shotgunjump2;
					break;
				case spr_shotgun_shootair:
					sprite_index = spr_shotgunfall;
					break;
				case spr_shotgunshoot:
					sprite_index = spr_shotgunfall;
					break;
				case spr_stompprep:
					sprite_index = spr_stomp;
					break;
				case spr_player_groundpoundjump:
					sprite_index = spr_fall;
					break;
			}
		}
	}
	else if (sprite_index == spr_stompprep && floor(image_index) == image_number - 1)
		sprite_index = spr_stomp;
	if (scr_check_groundpound() && !global.kungfu)
	{
		input_buffer_slap = 0;
		if !shotgunAnim
		{
			sprite_index = spr_bodyslamstart;
			image_index = 0;
			state = states.freefall;
			pistolanim = -4;
			vsp = -6;
		}
		else if ispeppino
		{
			fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
			sprite_index = spr_shotgunjump1;
			image_index = 0;
			state = states.freefall;
			vsp = -11;
			with (instance_create(x, y, obj_shotgunblast))
			{
				sprite_index = spr_shotgunblastdown;
				with bulletID
				{
					sprite_index = other.sprite_index;
					mask_index = other.mask_index;
				}
			}
		}
		else
		{
			notification_push(notifs.shotgunblast_start, [room]);
			state = states.shotgunshoot;
			minigunshot = 3;
			minigunbuffer = 0;
			sprite_index = spr_playerN_minigundown;
			image_index = 0;
		}
	}
	if sprite_index == spr_player_suplexcancel
		image_speed = 0.4;
	else
		image_speed = 0.35;
	if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall))
	{
		fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
		image_index = 0;
		sprite_index = spr_bodyslamland;
		state = states.freefallland;
		with obj_baddie
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				vsp = -7;
				hsp = 0;
			}
		}
		with obj_camera
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
	}
	if input_buffer_slap > 0 && !key_up && sprite_index != spr_suplexbump && shotgunAnim == 0 && !global.pistol
	{
		input_buffer_slap = 0;
		particle_set_scale(particle.jumpdust, xscale, 1);
		create_particle(x, y, particle.jumpdust, 0);
		image_index = 0;
		sprite_index = spr_suplexdashjumpstart;
		suplexmove = true;
		fmod_event_instance_play(suplexdashsnd);
		state = states.handstandjump;
		movespeed = 5;
	}
	else if (input_buffer_slap > 0 && key_up && shotgunAnim == 0 && (!global.pistol || !ispeppino))
	{
		input_buffer_slap = 0;
		state = states.punch;
		image_index = 0;
		sprite_index = spr_breakdanceuppercut;
		fmod_event_instance_play(snd_uppercut);
		
		if ispeppino
			vsp = -10;
		else
			vsp = -21;
		
		movespeed = hsp;
		if key_attack && grounded // high jump going left
			movespeed = abs(hsp);
		
		particle_set_scale(particle.highjumpcloud2, xscale, 1);
		create_particle(x, y, particle.highjumpcloud2, 0);
		
		if !ispeppino
		{
			repeat 4
			{
				with instance_create(x + irandom_range(-40, 40), y + irandom_range(-40, 40), obj_explosioneffect)
				{
					sprite_index = spr_shineeffect;
					image_speed = 0.35;
				}
			}
		}
	}
	if input_buffer_shoot > 0
	{
		if shotgunAnim
			scr_shotgunshoot();
		else if global.pistol
			scr_pistolshoot(states.jump);
	}
	if key_slap2 && shoot
	{
		if !shotgunAnim
		{
			flash = true;
			if (!instance_exists(parry_inst) && flash == 1)
			{
				parry_inst = instance_create(x, y, obj_parryhitbox);
				var _playerid = 1;
				if object_index == obj_player2
					_playerid = 2;
				with parry_inst
				{
					player_id = _playerid;
					image_xscale = other.xscale;
				}
			}
			if global.mort
			{
				with (instance_create(x + (xscale * 20), y, obj_shotgunbullet))
				{
					image_xscale = other.xscale;
					sprite_index = spr_mortprojectile;
				}
				sprite_index = spr_mortthrow;
				image_index = 0;
				state = states.pistol;
				mort = true;
				with obj_camera
				{
					shake_mag = 3;
					shake_mag_acc = 3 / room_speed;
				}
			}
			else if character != "V" && shoot
			{
				sprite_index = spr_pistolshot;
				image_index = 0;
				movespeed = 5;
				state = states.handstandjump;
				shoot = true;
				with obj_camera
				{
					shake_mag = 3;
					shake_mag = 3 / room_speed;
				}
				if ispeppino
				{
					with (instance_create(x + (xscale * 20), y, obj_shotgunbullet))
					{
						pistol = true;
						sprite_index = spr_peppinobullet;
						image_xscale = other.xscale;
					}
				}
				else
				{
					with (instance_create(x, y, obj_playerbomb))
					{
						kick = true;
						movespeed = 15;
						image_xscale = other.xscale;
					}
				}
			}
			else if character != "V"
			{
			}
		}
	}
	switch character
	{
		case "P":
			if key_attack && grounded && fallinganimation < 40
			{
				sprite_index = spr_mach1;
				image_index = 0;
				state = states.mach2;
				if movespeed < machspeed
					movespeed = machspeed;
			}
			break;
		case "V":
			if key_attack && grounded && fallinganimation < 40
			{
				jumpAnim = true;
				if pizzapepper == 0
				{
					sprite_index = spr_mach1;
					image_index = 0;
					movespeed = 6;
					state = states.mach1;
				}
				else
				{
					sprite_index = spr_crazyrun;
					movespeed = 20;
					state = states.mach3;
				}
			}
			if (key_shoot2 && !instance_exists(dynamite_inst))
			{
				sprite_index = spr_playerV_dynamitethrow;
				image_index = 0;
				if move == 0
					movespeed = 0;
				state = states.dynamite;
				with (instance_create(x, y, obj_dynamite))
				{
					image_xscale = other.xscale;
					other.dynamite_inst = id;
					playerid = other.id;
					movespeed = 6;
					vsp = -6;
				}
			}
			if (sprite_index == spr_playerV_superjump && floor(image_index) == image_number - 1)
				create_particle(x, y + 25, particle.shotgunimpact, 0);
			if key_slap2
			{
				sprite_index = spr_playerV_airrevolver;
				image_index = 0;
				vsp = -5;
				state = states.revolver;
				with (instance_create(x + (xscale * 20), y + 20, obj_shotgunbullet))
				{
					is_solid = false;
					image_xscale = other.xscale;
				}
				fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
			}
			break;
		case "N":
			if (key_attack2 && (pogochargeactive || pizzapepper > 0))
			{
				if !key_up
					sprite_index = spr_playerN_jetpackstart;
				else
					sprite_index = spr_superjumpprep;
				image_index = 0;
				hsp = 0;
				vsp = 0;
				state = states.Sjumpprep;
			}
			if key_attack && !pogochargeactive && !key_slap2 && pizzapepper == 0
			{
				sprite_index = spr_playerN_pogostart;
				image_index = 0;
				state = states.pogo;
			}
			break;
	}
	if (!key_attack || move != xscale)
		mach2 = 0;
	if floor(image_index) == image_number - 1
		jumpAnim = false;
	if (sprite_index == spr_playerN_ratballoonbounce && floor(image_index) == image_number - 1)
		image_index = image_number - 1;
	scr_dotaunt();
	if sprite_index == spr_shotgunshoot
	{
		landAnim = false;
		machslideAnim = false;
		image_speed = 0.45;
		if (image_index > image_number - 1)
			sprite_index = spr_shotgunfall;
	}
	if (place_meeting(x, y, obj_solid))
	{
		state = states.crouch;
		landAnim = false;
		crouchAnim = true;
		image_index = 0;
		idle = 0;
	}
}
function state_pepperman_jump()
{
	pepperman_grab_reset();
	move = key_left + key_right;
	if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
		movespeed += pepperman_accel_air;
	else if (move != 0 && move != sign(xscale) && movespeed > 0)
		movespeed -= pepperman_deccel_air;
	else if move == 0
		movespeed -= pepperman_deccel_air;
	if (floor(movespeed) == pepperman_maxhsp_normal)
		movespeed = pepperman_maxhsp_normal;
	if movespeed > pepperman_maxhsp_normal
		movespeed -= 0.3;
	else if movespeed < 0
		movespeed = 0;
	if move != 0 && movespeed == 0
		xscale = move;
	hsp = xscale * movespeed;
	if (sprite_index == spr_jump && floor(image_index) == image_number - 1)
		sprite_index = spr_fall;
	if (sprite_index == spr_player_pistoljump1 && floor(image_index) == image_number - 1)
		sprite_index = spr_player_pistoljump2;
	if !key_jump2 && jumpstop == 0 && vsp < 0.5
	{
		vsp /= 20;
		jumpstop = true;
	}
	if grounded && vsp > 0
	{
		state = states.normal;
		instance_create(x, y - 5, obj_landcloud);
	}
	if (scr_check_groundpound() && !grounded)
	{
		state = states.freefall;
		freefallsmash = 12;
		vsp = 14;
		sprite_index = spr_bodyslamfall;
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
		sprite_index = spr_pepperman_fall;
	if ladderbuffer > 0
		ladderbuffer--;
	if key_taunt2
	{
		fmod_event_one_shot_3d("event:/sfx/pep/taunt", x, y);
		taunttimer = 20;
		tauntstoredmovespeed = movespeed;
		tauntstoredvsp = vsp;
		tauntstoredsprite = sprite_index;
		tauntstoredstate = state;
		state = states.backbreaker;
		if supercharged == 1
		{
			image_index = 0;
			sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4);
		}
		else
		{
			taunttimer = 20;
			image_index = random_range(0, 11);
			sprite_index = spr_taunt;
		}
		with (instance_create(x, y, obj_taunteffect))
			player = other.id;
	}
}
function scr_player_jump()
{
	if character != "M"
		state_player_jump();
	else
		state_pepperman_jump();
}
