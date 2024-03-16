enum vigi_attacks
{
	revolver,
	dynamite,
	cow,
	estampede,
	flamethrower,
	machinegun,
	bazooka,
	crate,
	mach,
	wait,
	reload
}

// functions
function vigilante_start_attack(phase, wastedhits)
{
	attack_list[phase][wastedhits] = array_create(0);
}
function vigilante_add_attack(phase, wastedhits, attack, cooldown = 0)
{
	array_push(attack_list[phase][wastedhits], [attack, cooldown]);
}
function vigilante_end_attack(phase, wastedhits)
{
	var found = false;
	for (var i = 0; i < array_length(attack_list[phase][wastedhits]); i++)
	{
		var b = attack_list[phase][wastedhits][i];
		if (b[0] == vigi_attacks.reload || b[0] == vigi_attacks.crate)
		{
			found = true;
			break;
		}
	}
	if !found
	{
		
	}
}
function scr_vigilante_init_sounds()
{
	snd_flame = fmod_event_create_instance("event:/sfx/vigilante/flamethrower");
	snd_mach1 = fmod_event_create_instance("event:/sfx/vigilante/mach1");
	snd_slide = fmod_event_create_instance("event:/sfx/vigilante/slide");
	snd_uziprep = fmod_event_create_instance("event:/sfx/vigilante/uziprep");
	songstate = 0;
}
function scr_vigilante_destroy_sounds()
{
	destroy_sounds([snd_flame, snd_mach1, snd_slide, snd_uziprep]);
}
function scr_vigilante_update_sounds()
{
	if sprite_index == spr_vigilante_flamethrower
	{
		if (!fmod_event_instance_is_playing(snd_flame))
			fmod_event_instance_play(snd_flame);
		fmod_event_instance_set_3d_attributes(snd_flame, x, y);
	}
	else
		fmod_event_instance_stop(snd_flame, false);
	if state == states.mach2 && sprite_index != spr_playerV_crouchmove
	{
		if (!fmod_event_instance_is_playing(snd_mach1))
			fmod_event_instance_play(snd_mach1);
		fmod_event_instance_set_3d_attributes(snd_mach1, x, y);
	}
	else
		fmod_event_instance_stop(snd_mach1, false);
	fmod_event_instance_set_3d_attributes(snd_slide, x, y);
	if sprite_index == spr_vigilante_uziprepare
	{
		if (!fmod_event_instance_is_playing(snd_uziprep))
			fmod_event_instance_play(snd_uziprep);
		fmod_event_instance_set_3d_attributes(snd_uziprep, x, y);
	}
	else
		fmod_event_instance_stop(snd_uziprep, false);
	if state == states.duel
		songstate = Approach(songstate, 1, 0.05);
	else
		songstate = Approach(songstate, 0, 0.05);
	with obj_music
	{
		if music != -4
			fmod_event_instance_set_parameter(music.event, "state", other.songstate, true);
	}
}
function scr_vigilante_arenaintro()
{
	if skipintro && !introwait
	{
		with obj_player
		{
			state = states.actor;
			image_speed = 0.35;
			hsp = 0;
			movespeed = 0;
			flash = false;
			x = roomstartx;
			xscale = -other.image_xscale;
			sprite_index = spr_idle;
		}
		sprite_index = spr_playerV_dynamitethrow;
		image_index = 0;
		if !obj_player1.ispeppino
		{
			sprite_index = spr_playerV_idle;
			image_index = 0;
		}
		introwait = true;
		introbuffer = 250;
		if (instance_exists(spotlightID))
			spotlightID.expand = true;
		if obj_player1.ispeppino
		{
			with (instance_create(x, y, obj_pistolpickup))
			{
				hsp = other.image_xscale * 8;
				vsp = -11;
			}
		}
		with obj_player
		{
			hsp = 0;
			state = states.normal;
			sprite_index = spr_idle;
		}
	}
	if !introwait
	{
		image_speed = 0.35;
		with obj_player1
		{
			state = states.actor;
			image_speed = 0.35;
			xscale = -other.image_xscale;
			hsp = 0;
			movespeed = 0;
			flash = false;
			x = roomstartx;
			if (other.sprite_index == spr_vigilante_intro1 || other.sprite_index == spr_vigilante_intro1N)
			{
				if ispeppino
					sprite_index = spr_player_gnomecutscene1;
				else
					sprite_index = spr_playerN_bosscutscene1;
			}
			if floor(image_index) == image_number - 1
			{
				if (sprite_index == spr_player_gnomecutscene2 || sprite_index == spr_playerN_bosscutscene2 || sprite_index == spr_playerN_bosscutscene3)
					image_index = image_number - 1;
				else if sprite_index == spr_player_gnomecutscene3
					sprite_index = spr_player_gnomecutscene4;
				else if sprite_index == spr_noise_vulnerable1
					sprite_index = spr_noise_vulnerable1loop;
			}
		}
		if introbuffer > 0
		{
			introbuffer--;
			if (floor(image_index) == image_number - 1 && (sprite_index == spr_vigilante_intro2 || sprite_index == spr_vigilante_intro2N))
				image_index = image_number - 1;
			if ((sprite_index == spr_vigilante_intro2 || sprite_index == spr_vigilante_intro2N) && floor(image_index) == 13)
			{
				fmod_event_one_shot_3d("event:/sfx/voice/vigiintro", x, y);
				with obj_player1
				{
					if ispeppino
					{
						if sprite_index == spr_player_gnomecutscene2
						{
							sprite_index = spr_player_gnomecutscene3;
							image_index = 0;
							fmod_event_one_shot("event:/sfx/pep/screamboss");
						}
					}
					else
					{
						sprite_index = spr_playerN_bosscutscene3;
						image_index = 0;
					}
				}
			}
		}
		else if (sprite_index == spr_vigilante_intro1 || sprite_index == spr_vigilante_intro1N)
		{
			sprite_index = spr_vigilante_intro2;
			image_index = 0;
			introbuffer = 130;
			with obj_player1
			{
				if ispeppino
				{
					sprite_index = spr_player_gnomecutscene2;
					image_index = 0;
				}
				else
				{
					sprite_index = spr_playerN_bosscutscene2;
					image_index = 0;
					other.sprite_index = spr_vigilante_intro2N;
				}
			}
		}
		else if (sprite_index == spr_vigilante_intro2 || sprite_index == spr_vigilante_intro2N)
		{
			if obj_player1.ispeppino
			{
				with (instance_create(x, y, obj_pistolpickup))
				{
					hsp = other.image_xscale * 8;
					vsp = -11;
				}
			}
			sprite_index = spr_playerV_dynamitethrow;
			image_index = 0;
			introwait = true;
			introbuffer = 250;
			spotlightID.expand = true;
			with obj_player
			{
				if ispeppino
				{
					sprite_index = spr_player_screamtransition;
					image_index = 0;
					image_speed = 0.35;
				}
				landAnim = false;
				tauntstoredstate = states.normal;
				state = states.animation;
			}
		}
	}
	else
	{
		if (sprite_index == spr_playerV_dynamitethrow && floor(image_index) == image_number - 1)
			sprite_index = spr_playerV_idle;
		if introbuffer > 0
			introbuffer--;
		else if sprite_index != spr_vigilante_impatient
		{
			sprite_index = spr_vigilante_impatient;
			image_index = 0;
		}
		else if floor(image_index) == image_number - 1
			image_index = image_number - 1;
		if global.pistol
		{
			sprite_index = spr_playerV_idle;
			state = states.walk;
		}
	}
}
function scr_vigilante_do_hurt_phase2(object)
{
	scr_boss_do_hurt_phase2(object);
}
function scr_vigilante_phase1hurt()
{
	x = hitX + irandom_range(-1, 1);
	y = hitY + irandom_range(-1, 1);
	hsp = 0;
	vsp = 0;
	with obj_player
	{
		actorbuffer = 10000;
		hsp = 0;
		vsp = 0;
		state = states.actor;
		pistolanim = -4;
		sprite_index = spr_player_pistolshotend;
		if !ispeppino
			sprite_index = spr_playerN_bosstransition;
		invtime = 30;
	}
	instance_create_unique(0, 0, obj_bossdark)
	if buildup > 0
	{
		obj_camera.lock = true;
		camzoom = lerp(camzoom, 0.5, 0.2);
		camera_set_view_size(view_camera[0], SCREEN_WIDTH * camzoom, SCREEN_HEIGHT * camzoom);
		var _x = clamp(x - ((SCREEN_WIDTH * camzoom) / 2), 0, room_width - (SCREEN_WIDTH * camzoom));
		var _y = clamp(y - ((SCREEN_HEIGHT * camzoom) / 2), 0, room_height - (SCREEN_HEIGHT * camzoom));
		camera_set_view_pos(view_camera[0], _x, _y);
		buildup--;
	}
	else
	{
		instance_destroy(obj_blackoutline);
		instance_destroy(obj_superattackeffect);
		instance_destroy(obj_bossdark);
		instance_destroy(obj_lightsource);
		instance_create(0, 0, obj_pizzahead_whitefade);
		obj_camera.lock = false;
		camzoom = 1;
		camera_set_view_size(view_camera[0], SCREEN_WIDTH, SCREEN_HEIGHT);
		state = states.hit;
		linethrown = true;
		mach2 = false;
		with obj_player
			state = states.normal;
	}
	obj_screensizer.camzoom = camzoom;
}
function scr_vigilante_walk()
{
	image_speed = 0.35;
	if grounded && vsp > 0 && sprite_index == spr_playerV_hurt && flickertime > 2
	{
		hsp = Approach(hsp, 0, 1);
		create_particle(x, y, particle.landcloud);
		vsp = -5;
		touchedground = true;
	}
	if grounded
	{
		if (place_meeting(x, y, obj_vigilantespot) && vsp > 0)
			hsp = Approach(hsp, 0, 1);
		else
			hsp = Approach(hsp, 0, 1);
	}
	if (flickertime > 0 && place_meeting(x + hsp, y, obj_solid))
	{
		hsp = floor(hsp / 2.2);
		hsp *= -1;
		image_xscale *= -1;
	}
	if cooldown > 0 && flickertime <= 0
		cooldown--;
	if sprite_index != spr_playerV_revolverend
	{
		if flickertime > 0
			sprite_index = spr_playerV_hurt;
		else if grounded
		{
			sprite_index = spr_playerV_idle;
			if targetplayer.x != x
				image_xscale = sign(targetplayer.x - x);
		}
		if !reposition
		{
			if (flickertime <= 0 && (!place_meeting(x, y, obj_vigilantespot) || oldspotID == instance_place(x, y, obj_vigilantespot)))
			{
				var t = spotID;
				with obj_vigilantespot
				{
					if id != other.spotID
						t = id;
				}
				oldspotID = -4;
				if x != t.x
					image_xscale = sign(t.x - x);
				state = states.mach2;
				kick = false;
				attackspeed = 0;
				cooldown = 2;
				sprite_index = spr_playerV_crouchmove;
				image_index = 0;
			}
		}
		else if flickertime <= 0 && grounded
		{
			t = spotID;
			with obj_vigilantespot
			{
				if ((other.x > (room_width / 2) && x < (room_width / 2)) || (other.x < (room_width / 2) && x > (room_width / 2)))
					t = id;
			}
			spotID = t;
			oldspotID = -4;
			if x != t.x
				image_xscale = sign(t.x - x);
			state = states.mach2;
			kick = false;
			attackspeed = 0;
			cooldown = 2;
			sprite_index = spr_playerV_crouchmove;
			image_index = 0;
		}
	}
	else if floor(image_index) == image_number - 1
		sprite_index = spr_playerV_idle;
	woosh = false;
	if cooldown <= 0 && flickertime <= 0 && !reposition
	{
		var attacklist = attack_list[phase - 1][wastedhits];
		if (currentattack >= array_length(attacklist))
			currentattack = 0;
		var attack = attacklist[currentattack++];
		trace(attack);
		switch attack[0]
		{
			case vigi_attacks.revolver:
				scr_vigilante_do_revolver(1, attack[1], false);
				break;
			case vigi_attacks.reload:
				scr_vigilante_do_reload(attack[1]);
				break;
			case vigi_attacks.dynamite:
				scr_vigilante_do_dynamite(1);
				break;
			case vigi_attacks.cow:
				scr_vigilante_do_cow(1, attack[1]);
				break;
			case vigi_attacks.estampede:
				estampedemax = attack[1];
				state = states.estampede;
				estampedecooldown = 30;
				sprite_index = spr_vigilante_intro2;
				image_index = 16;
				with (instance_create(464, 195, obj_ladderhorizontal))
				{
					dir = other.image_xscale;
					if other.phase == 1
						spd = 3;
					else
						spd = 5;
				}
				break;
			case vigi_attacks.wait:
				waitbuffer = attack[1];
				state = states.wait;
				if sprite_index != spr_playerV_revolverend
					sprite_index = spr_playerV_idle;
				break;
			case vigi_attacks.flamethrower:
				state = states.flamethrower;
				if targetplayer.x != x
					image_xscale = sign(targetplayer.x - x);
				flamebuffer = attack[1];
				hsp = 0;
				shot = false;
				fmod_event_one_shot_3d("event:/sfx/vigilante/flamestart", x, y);
				sprite_index = spr_vigilante_flamethrowerintro;
				image_index = 0;
				image_speed = 0.35;
				break;
			case vigi_attacks.machinegun:
				create_particle(x, y, particle.highjumpcloud2);
				state = states.machinegun;
				sprite_index = spr_vigilante_uziprepare;
				image_index = 0;
				uzi_speed = 0.75;
				uziprepareshot = false;
				uziprepare = 2;
				if targetplayer.x != x
					image_xscale = sign(targetplayer.x - x);
				break;
			case vigi_attacks.bazooka:
				create_particle(x, y, particle.highjumpcloud2);
				state = states.bazooka;
				hsp = 0;
				vsp = -16;
				image_xscale = (x > (room_width / 2)) ? -1 : 1;
				sprite_index = spr_playerV_jump;
				image_index = 0;
				break;
			case vigi_attacks.crate:
				state = states.crate;
				hsp = 0;
				fmod_event_one_shot_3d("event:/sfx/vigilante/order", x, y);
				sprite_index = spr_vigilante_order;
				image_index = 0;
				image_speed = 0.35;
				cowcrate = attack[0];
				cowcrate = attack[1];
				shot = false;
				if targetplayer.x != x
					image_xscale = sign(targetplayer.x - x);
				break;
			case vigi_attacks.mach:
				state = states.mach2;
				kickbuffer = attack[1];
				kick = true;
				if kickbuffer == 0
					kickbuffer = 55;
				attackspeed = 2;
				if targetplayer.x != x
					image_xscale = sign(targetplayer.x - x);
				sprite_index = spr_playerV_mach1;
				image_index = 0;
				break;
		}
	}
}
function scr_vigilante_do_cow(_shot = 1, _throwbuffermax = 0)
{
	shot = _shot;
	throwbuffermax = _throwbuffermax;
	scr_vigilante_throw_cow();
}
function scr_vigilante_throw_cow()
{
	if shot > 0
	{
		shot--;
		state = states.throwing;
		throwbuffer = throwbuffermax;
		sprite_index = spr_playerV_dynamitethrow;
		image_index = 0;
		if obj_player.x != x
			image_xscale = sign(obj_player.x - x);
		with (instance_create(x + (image_xscale * 100), y - 10, obj_vigilantecow))
		{
			xscale = other.image_xscale;
			vsp = -16;
			spd = 6;
			bounce = 3;
		}
		return true;
	}
	else
		return false;
}
function scr_vigilante_do_revolver(_shot, _buffer, _jump = false)
{
	shot = _shot;
	jump = _jump;
	state = states.revolver;
	revolverbuffer = _buffer;
	if sprite_index != spr_playerV_revolvershoot && sprite_index != spr_playerV_revolverend
		sprite_index = spr_playerV_revolverstart;
	else
		sprite_index = spr_playerV_revolverhold;
	image_index = 0;
	if obj_player.x != x
		image_xscale = -sign(x - obj_player.x);
	if jump
	{
		revolverbuffer = 0;
		state = states.jump;
		vsp = -9;
		sprite_index = spr_playerV_jump;
		tauntstoredstate = states.revolver;
	}
}
function scr_vigilante_do_dynamite(count)
{
	shot = count;
	state = states.dynamite;
	scr_vigilante_throw_dynamite();
}
function scr_vigilante_throw_dynamite()
{
	if shot > 0
	{
		fmod_event_one_shot_3d("event:/sfx/vigilante/throw", x, y);
		shot--;
		sprite_index = spr_playerV_dynamitethrow;
		image_index = 0;
		if obj_player1.x != x
			image_xscale = -sign(x - obj_player1.x);
		with (instance_create(x + (image_xscale * 20), y - 16, obj_vigilantedynamite))
		{
			calculate_jump_velocity(obj_player1.x, other.y, 18, grav);
			if (abs(hsp) <= 1 && (abs(vsp) <= 1 || vsp > 0))
				calculate_jump_velocity(obj_player1.x, other.y, 25, grav);
		}
		return true;
	}
	else
		return false;
}
function scr_vigilante_jump()
{
	hsp = 0;
	if (floor(image_index) == image_number - 1 && sprite_index == spr_playerV_jump)
		sprite_index = spr_playerV_fall;
	if vsp > 0
	{
		jump = false;
		switch tauntstoredstate
		{
			case states.revolver:
				scr_vigilante_do_revolver(shot, 0);
				sprite_index = spr_playerV_revolverhold;
				break;
		}
	}
}
function scr_vigilante_wait()
{
	hsp = Approach(hsp, 0, 1);
	if sprite_index == spr_playerV_revolverend
		sprite_index = spr_playerV_revolverhold;
	if waitbuffer > 0
		waitbuffer--;
	else
	{
		state = states.walk;
		if sprite_index == spr_playerV_revolverhold
			sprite_index = spr_playerV_revolverend;
	}
}
function scr_vigilante_estampede()
{
	hsp = 0;
	image_speed = 0.35;
	if estampedecooldown > 0
		estampedecooldown--;
	if estampedecooldown == 0
	{
		estampedecooldown = -1;
		with (instance_nearest(x, y, obj_cowspawner))
		{
			spawn = true;
			estampedemax = other.estampedemax;
			alarm[0] = other.estampedemax;
		}
	}
	if sprite_index != spr_vigilante_intro2
	{
		if estampedecooldown <= 0
		{
			var b = false;
			with obj_cowspawner
			{
				if spawn
					b = true;
			}
			if !b
			{
				state = states.walk;
				with obj_ladderhorizontal
					destroy = true;
			}
		}
	}
	else if floor(image_index) == image_number - 1
		sprite_index = spr_vigilante_intro2loop;
}
function scr_vigilante_revolver()
{
	image_speed = 0.35;
	hsp = Approach(hsp, 0, 1);
	if floor(image_index) == image_number - 1
	{
		if sprite_index == spr_playerV_revolverstart
			sprite_index = spr_playerV_revolverhold;
		else if sprite_index == spr_playerV_revolvershoot
		{
			image_index = image_number - 1;
			state = states.walk;
			sprite_index = spr_playerV_revolverend;
			image_index = 0;
		}
	}
	if sprite_index == spr_playerV_revolverhold
	{
		if revolverbuffer > 0
			revolverbuffer--;
		else
		{
			fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
			ammo--;
			shot--;
			sprite_index = spr_playerV_revolvershoot;
			image_index = 0;
			hsp = image_xscale * 4;
			with (instance_create(x + (image_xscale * 80), y + 10, obj_vigilanteshot))
			{
				image_xscale = other.image_xscale;
				if other.phase == 2
				{
					woosh = false;
					spd = 10;
					image_index = 9;
				}
			}
		}
	}
}
function scr_vigilante_do_reload(buffer = 360)
{
	state = states.reloading;
	reloadbuffer = buffer;
	sprite_index = spr_vigilante_vulnerable;
	image_index = 0;
}
function scr_vigilante_dynamite()
{
	hsp = Approach(hsp, 0, 1);
	if floor(image_index) == image_number - 1
	{
		if (!scr_vigilante_throw_dynamite())
			state = states.walk;
	}
}
function scr_vigilante_throwing()
{
	hsp = Approach(hsp, 0, 1);
	if throwbuffer > 0
		throwbuffer--;
	else if sprite_index != spr_playerV_dynamitethrow
	{
		if (!scr_vigilante_throw_cow())
			state = states.walk;
	}
	if (floor(image_index) == image_number - 1 && sprite_index == spr_playerV_dynamitethrow)
		sprite_index = spr_playerV_idle;
}
function scr_vigilante_reloading()
{
	image_speed = 0.35;
	hsp = Approach(hsp, 0, 1);
	if reloadbuffer > 0
		reloadbuffer--;
	else
	{
		ammo = 6;
		sprite_index = spr_playerV_idle;
		state = states.walk;
		hsp = 0;
		cooldown = 0;
		image_xscale = (x < (room_width / 2)) ? 1 : -1;
	}
}
function scr_vigilante_mach2()
{
	image_speed = 0.35;
	hsp = image_xscale * attackspeed;
	if sprite_index == spr_playerV_bootsmove
	{
		if attackspeed < 8
			attackspeed += 0.1;
	}
	else if attackspeed < 8
		attackspeed += 0.5;
	if (floor(image_index) == image_number - 1 && sprite_index == spr_playerV_mach1)
		sprite_index = spr_playerV_bootsmove;
	if sprite_index == spr_playerV_crouchmove
	{
		if attackspeed < 12
			attackspeed += 0.5;
		if crouchalphabuffer > 0
			crouchalphabuffer--;
		else
		{
			crouchalphabuffer = 5;
			if image_alpha == 1
				image_alpha = 0.5;
			else
				image_alpha = 1;
		}
	}
	if kick
	{
		if kickbuffer > 0
			kickbuffer--;
		else
		{
			fmod_event_instance_play(snd_slide);
			image_alpha = 1;
			state = states.crouchslide;
			kick = false;
			attackspeed = 12;
			sprite_index = spr_playerV_divekickstart;
			image_index = 0;
		}
	}
	else
	{
		var check = false;
		if reposition
			check = instance_place(x, y, obj_vigilantespot) == spotID;
		else
			check = scr_vigilante_check_spot();
		if check
		{
			image_alpha = 1;
			reposition = false;
			sprite_index = spr_playerV_idle;
			state = states.walk;
			image_xscale = (x < (room_width / 2)) ? 1 : -1;
		}
	}
}
function scr_vigilante_check_spot()
{
	if (place_meeting(x, y, obj_vigilantespot))
	{
		var b = false;
		with (instance_place(x, y, obj_vigilantespot))
		{
			if id != other.spotID
			{
				other.spotID = id;
				b = true;
			}
		}
		return b;
	}
	return false;
}
function scr_vigilante_crouchslide()
{
	hsp = image_xscale * attackspeed;
	if attackspeed > 0
		attackspeed -= 0.15;
	if (floor(image_index) == image_number - 1 && sprite_index == spr_playerV_divekickstart)
		sprite_index = spr_playerV_divekick;
	if (place_meeting(x + sign(hsp), y, obj_solid))
		image_xscale *= -1;
	if attackspeed <= 0
	{
		sprite_index = spr_playerV_idle;
		state = states.walk;
	}
}
function scr_vigilante_duel()
{
	if (instance_exists(obj_vigilante_duelintro))
		exit;
	image_speed = 0.35;
	with obj_player
	{
		pistolcharge = 0;
		pistolchargeshooting = false;
		pistolanim = -4;
	}
	var _cheat = !obj_player1.ispeppino || global.swapmode;
	if duelphase == 2
	{
		with obj_player1
		{
			if key_slap2
			{
				other.duelbuffer = 0;
				other.duelplayer = true;
			}
		}
	}
	else if duelphase < 2
	{
		with obj_player1
		{
			if key_slap2 && ispeppino && !_cheat
			{
				other.duelbuffer = 0;
				other.duelphase = 2;
				other.duelplayer = false;
			}
		}
	}
	if duelbuffer > 0
	{
		var s = 4;
		switch duelphase
		{
			case 0:
				signy = Approach(signy, 0, s);
				if signy >= 0
					duelbuffer--;
				break;
			case 1:
				signy = Approach(signy, -sprite_get_height(signspr), s);
				if (obj_player1.ispeppino && signy <= -sprite_get_height(signspr))
				{
					duelbuffer = 80;
					fmod_event_one_shot_3d("event:/sfx/enemies/minijohnpunch", room_width / 2, room_height / 2);
					fmod_event_one_shot_3d("event:/sfx/voice/vigiduel", room_width / 2, room_height / 2);
					duelphase = 2;
					signspr = spr_draw;
					signy = -sprite_get_height(signspr);
				}
				if (_cheat && signy <= -(sprite_get_height(signspr) / 2))
				{
					signy = -sprite_get_height(signspr);
					duelphase = 2;
					duelplayer = true;
					duelbuffer = 0;
				}
				break;
			default:
				duelbuffer--;
				break;
		}
		if duelphase == 2 && obj_player1.ispeppino && !_cheat
			signy = Approach(signy, 0, 20);
	}
	else
	{
		switch duelphase
		{
			case 0:
				with obj_player1
				{
					sprite_index = spr_peppino_duel;
					if !ispeppino
						sprite_index = spr_noise_duel;
					image_index = 0;
				}
				sprite_index = spr_vigilante_duel;
				image_index = 0;
				duelphase++;
				duelbuffer = 80;
				break;
			case 2:
				if !duelplayer
				{
					fmod_event_one_shot("event:/sfx/vigilante/finalshot");
					obj_player1.state = states.normal;
					scr_hurtplayer(obj_player1);
					duelphase++;
					destroyable = false;
					sprite_index = spr_playerV_revolvershoot;
					image_index = 0;
				}
				else
				{
					fmod_event_one_shot("event:/sfx/vigilante/finalshot");
					var lag = 0;
					state = states.hit;
					hitX = x;
					hitY = y;
					hitLag = lag;
					hithsp = -image_xscale * 20;
					hitvsp = 0;
					linethrown = true;
					destroyable = true;
					elitehit = 0;
					var lay1 = layer_get_id("Backgrounds_Ring");
					var lay2 = layer_get_id("Backgrounds_2");
					var lay3 = layer_get_id("Backgrounds_1");
					var bg1 = layer_background_get_id(lay1);
					var bg2 = layer_background_get_id(lay2);
					layer_set_visible(lay3, true);
					layer_background_change(bg2, bg_vigiboss)
					layer_background_change(bg1, bg_vigilantearena)
					obj_bosscontroller.alarm[1] = 5;
					with obj_drawcontroller
						use_dark = false;
					scr_sleep(25);
					instance_create(x, y, obj_bangeffect);
					var len = abs(obj_player1.x - x);
					with (instance_create(x - (len * 0.8), y, obj_crazyrunothereffect))
						image_speed = 0.25;
					with (instance_create(x - (len * 0.2), y, obj_crazyrunothereffect))
						image_speed = 0.25;
					var xx = 0;
					var l = 5 + irandom(2);
					repeat l
					{
						with (create_debris((x - len) + xx, y, spr_genericpoofeffect, true))
						{
							destroyonanimation = true;
							hsp = 0;
							vsp = -irandom_range(5, 8);
							image_speed = random_range(0.2, 0.5);
							grav = 0;
						}
						xx += (len / l);
					}
					with obj_player1
					{
						if _cheat && ispeppino
						{
							swap_player(false);
							with (instance_create(x, y, obj_swapdeatheffect))
							{
								image_xscale = -1;
								ispeppino = other.ispeppino;
								isgustavo = other.isgustavo;
								hsp = -image_xscale * 8;
								vsp = -15;
								sprite_index = spr_player_outofpizza1;
							}
							x = obj_swapmodefollow.x;
							y = obj_swapmodefollow.y;
						}
						sprite_index = spr_player_pistolshotend;
						image_index = 2;
						if !ispeppino
						{
							sprite_index = spr_noise_duelend;
							image_index = 0;
						}
						state = states.actor;
						actorbuffer = 120;
					}
				}
				break;
			case 3:
				if floor(image_index) == image_number - 1
				{
					sprite_index = spr_playerV_idle;
					state = states.walk;
					cooldown = 10;
					elitehit = 1;
					wastedhits = 4;
					obj_drawcontroller.dark_alpha = 1;
				}
				break;
		}
	}
	if (sprite_index == spr_playerV_revolverstart && floor(image_index) == image_number - 1)
		sprite_index = spr_playerV_revolverhold;
}
function scr_vigilante_punch()
{
	image_speed = 0.35;
	if floor(image_index) == image_number - 1
	{
		state = tauntstoredstate;
		sprite_index = tauntstoredsprite;
		image_index = tauntstoredindex;
	}
}
function scr_vigilante_flamethrower()
{
	if sprite_index != spr_vigilante_flamethrowerturn
	{
		if sprite_index == spr_vigilante_flamethrowerintro
		{
			hsp = 0;
			if floor(image_index) == image_number - 1
			{
				sprite_index = spr_vigilante_flamethrower;
				image_index = 0;
				flameID = instance_create(x, y, obj_flamethrowerhurtbox);
				with flameID
				{
					sprite_index = spr_vigilante_flamethrower;
					mask_index = spr_vigilante_flamethrower;
					image_xscale = other.image_xscale;
					with (instance_create(x, y, obj_lightsource_attach))
					{
						objectID = other.id;
						distance = 500;
					}
				}
			}
		}
		else if sprite_index == spr_vigilante_flamethrower
		{
			if (abs(hsp) < 8)
				hsp += (image_xscale * 0.25);
			with flameID
			{
				x = other.x + other.hsp;
				y = other.y;
				image_xscale = other.image_xscale;
			}
			if (place_meeting(x + image_xscale, y, obj_solid))
			{
				sprite_index = spr_vigilante_flamethrowerturn;
				image_index = 0;
			}
			if floor(image_index) == image_number - 1
				image_index = 2;
			if flamebuffer > 0
				flamebuffer--;
			else
			{
				instance_destroy(flameID);
				hsp = 0;
				sprite_index = spr_vigilante_flamethrowerend;
				image_index = 0;
			}
		}
		else if (sprite_index == spr_vigilante_flamethrowerend && floor(image_index) == image_number - 1)
			state = states.walk;
	}
	else
	{
		image_speed = 0.35;
		if floor(image_index) == image_number - 1
		{
			sprite_index = spr_vigilante_flamethrowerintro;
			image_index = 13;
			image_xscale *= -1;
		}
	}
}
function scr_vigilante_machinegun()
{
	if sprite_index == spr_vigilante_uziprepare
	{
		hsp = 0;
		if targetplayer.x != x
			image_xscale = sign(targetplayer.x - x);
		if (floor(image_index) == image_number - 1 && !uziprepareshot)
		{
			uziprepareshot = true;
			if uziprepare > 0
			{
				uziprepare--;
				uzi_speed += 0.4;
			}
			else
			{
				fmod_event_one_shot_3d("event:/sfx/vigilante/uzijump", x, y);
				vsp = -19;
				attackspeed = 8;
				shootbuffer = 0;
				dir = 0;
				sprite_index = spr_playerV_jump;
				image_index = 0;
				image_speed = 0.35;
			}
		}
		else if floor(image_index) != image_number - 1
			uziprepareshot = false;
	}
	else
	{
		hsp = image_xscale * 4;
		if (sprite_index == spr_playerV_jump && (floor(image_index) == image_number - 1 || vsp > -10))
			sprite_index = spr_vigilante_uzi;
		if (place_meeting(x + hsp, y, obj_solid))
		{
			image_xscale *= -1;
			if sprite_index != spr_vigilante_uzi
			{
				sprite_index = spr_vigilante_uzi;
				image_index = 0;
			}
		}
		if sprite_index == spr_vigilante_uzi
		{
			if shootbuffer > 0
				shootbuffer--;
			else
			{
				var angle = 255;
				switch dir
				{
					case 1:
						angle = 270;
						break;
					case 2:
						angle = 285;
						break;
					case 3:
						angle = 270;
						dir = 0;
						break;
				}
				dir++;
				if dir > 3
					dir = 0;
				with (instance_create(x, y, obj_uziprojectile))
				{
					fmod_event_one_shot_3d("event:/sfx/vigilante/uzishoot", x, y);
					hsp = lengthdir_x(spd, angle);
					vsp = lengthdir_y(spd, angle);
				}
				shootbuffer = 4;
			}
		}
		if grounded && vsp > 0
			state = states.walk;
	}
}
function scr_vigilante_bazooka()
{
	if (sprite_index == spr_playerV_jump && floor(image_index) >= 7)
		image_index = 5;
	if vsp > -8 && sprite_index == spr_playerV_jump
	{
		sprite_index = spr_vigilante_bazooka;
		image_index = 0;
		shot = false;
	}
	if sprite_index == spr_vigilante_bazooka
	{
		if image_index > 4 && image_index < 14
			vsp = 0;
		if (floor(image_index) >= 11 && !shot)
		{
			shot = true;
			vsp = -6;
			with (instance_create(x + (image_xscale * 10), y, obj_vigilantebazooka))
				image_xscale = other.image_xscale;
			fmod_event_one_shot_3d("event:/sfx/vigilante/bazookashoot", x, y);
		}
		if floor(image_index) == image_number - 1
			sprite_index = spr_playerV_fall;
	}
	if grounded && vsp > 0
		state = states.walk;
}
function scr_vigilante_crate()
{
	if (floor(image_index) >= 10 && !shot)
	{
		shot = true;
		with (instance_create(obj_player1.x, -64, obj_vigilantecrate))
			cow = true;
	}
	if floor(image_index) == image_number - 1
		state = states.walk;
}
function scr_vigilante_hit()
{
	if !pizzahead
	{
		x = hitX + random_range(-6, 6);
		y = hitY + random_range(-6, 6);
		sprite_index = stunfallspr;
		if hitLag > 0
		{
			instance_destroy(obj_junk);
			instance_destroy(obj_ladderhorizontal);
			instance_destroy(obj_cowstampede);
			with obj_cowspawner
				spawn = false;
			hitLag--;
		}
		else
		{
			x = hitX;
			y = hitY;
			elitehit--;
			state = states.walk;
			hsp = hithsp;
			vsp = hitvsp;
			cooldown = 0;
		}
	}
	else
		scr_enemy_hit();
}
