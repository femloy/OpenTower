enum pizzaface_p2_attacks
{
	pullinglevel,
	tv,
	gun,
	ratball,
	pinup
}

// functions
function scr_pizzaface_p2_init_sounds()
{
	snd_haywire = fmod_event_create_instance("event:/sfx/pizzahead/haywire");
	snd_tvthrow = fmod_event_create_instance("event:/sfx/pizzahead/tvthrow");
	snd_spin = fmod_event_create_instance("event:/sfx/pizzahead/spin");
	snd_grablevel = fmod_event_create_instance("event:/sfx/pizzahead/grablevel");
	snd_fishing = fmod_event_create_instance("event:/sfx/pizzahead/fishing");
	snd_ratball = fmod_event_create_instance("event:/sfx/pizzahead/ratball");
	steppysnd = false;
}
function scr_pizzaface_p2_destroy_sounds()
{
	destroy_sounds([snd_haywire, snd_tvthrow, snd_spin, snd_grablevel, snd_fishing, snd_ratball]);
}
function scr_pizzaface_p2_update_sounds()
{
	if (instance_exists(obj_pizzahead_haywire))
	{
		if (!fmod_event_instance_is_playing(snd_haywire))
			fmod_event_instance_play(snd_haywire);
		fmod_event_instance_set_3d_attributes(snd_haywire, obj_pizzahead_haywire.x, obj_pizzahead_haywire.y);
	}
	else
		fmod_event_instance_stop(snd_haywire, true);
	if state == states.pizzahead_portraitthrow
	{
		if (!fmod_event_instance_is_playing(snd_tvthrow))
			fmod_event_instance_play(snd_tvthrow);
		var s = 0;
		if (floor(image_index) < 24)
			s = 0;
		else if (floor(image_index) < 33)
			s = 1;
		else if (floor(image_index) < 44)
			s = 2;
		else if (floor(image_index) >= 44)
			s = 3;
		fmod_event_instance_set_parameter(snd_tvthrow, "state", s, true);
	}
	else if (fmod_event_instance_get_parameter(snd_tvthrow, "state") < 3)
		fmod_event_instance_stop(snd_tvthrow, true);
	if ((sprite_index == spr_pizzahead_ratballstart && floor(image_index) >= 17) || sprite_index == spr_pizzahead_ratballend)
	{
		if (!fmod_event_instance_is_playing(snd_spin))
			fmod_event_instance_play(snd_spin);
		fmod_event_instance_set_3d_attributes(snd_spin, x, y);
	}
	else
		fmod_event_instance_stop(snd_spin, true);
	if (sprite_index == spr_pizzahead_giddy && !steppysnd && (floor(image_index) == 2 || floor(image_index) == 6))
	{
		steppysnd = true;
		fmod_event_one_shot_3d("event:/sfx/pizzahead/step", x, y + 40);
	}
	else if (floor(image_index) != 2 && floor(image_index) != 6)
		steppysnd = false;
	if (sprite_index == spr_pizzahead_pullinglevel1 && floor(image_index) <= 21)
	{
		if (!fmod_event_instance_is_playing(snd_grablevel))
			fmod_event_instance_play(snd_grablevel);
		fmod_event_instance_set_3d_attributes(snd_grablevel, x, y);
	}
	else
		fmod_event_instance_stop(snd_grablevel, true);
	if (sprite_index == spr_pizzahead_grabitem && floor(image_index) >= 8)
	{
		if (!fmod_event_instance_is_playing(snd_fishing))
			fmod_event_instance_play(snd_fishing);
		fmod_event_instance_set_3d_attributes(snd_fishing, x, y);
	}
	else
		fmod_event_instance_stop(snd_fishing, false);
	if (instance_exists(obj_pizzaheadbrickball))
	{
		if (!fmod_event_instance_is_playing(snd_ratball))
			fmod_event_instance_play(snd_ratball);
		fmod_event_instance_set_3d_attributes(snd_ratball, obj_pizzaheadbrickball.x, obj_pizzaheadbrickball.y);
	}
	else
		fmod_event_instance_stop(snd_ratball, true);
}
function scr_pizzaface_p2_fall()
{
	image_speed = 0.35;
	hsp = 0;
	with obj_player1
	{
		if floor(image_index) == image_number - 1
		{
			if sprite_index == spr_player_gnomecutscene2
				image_index = image_number - 1;
			else if sprite_index == spr_player_gnomecutscene3
				sprite_index = spr_player_gnomecutscene4;
			else if sprite_index == spr_pepbossintro2
				image_index = image_number - 2;
			else if sprite_index == spr_noisebossintro1
				image_index = image_number - 3;
			else if sprite_index == spr_noisebossintro2
				image_index = image_number - 3;
			else if sprite_index == spr_playerN_doiseintro2
				sprite_index = spr_playerN_doiseintro3;
		}
	}
	switch substate
	{
		case states.jump:
			vsp = 0;
			y -= 18;
			if y < -600
				substate = states.fall;
			break;
		
		case states.fall:
			sprite_index = spr_pizzahead_piledriver;
			if y < 200
			{
				y += 20;
				vsp = 0;
			}
			else
				vsp = 20;
			if grounded && vsp > 0
			{
				laugh_snd = false;
				instance_create(0, 0, obj_pizzafaceboss_p2background);
				var lay = layer_get_id("Backgrounds_2");
				var bg = layer_background_get_id(lay);
				alarm[7] = 5;
				layer_set_visible("Backgrounds_1", true);
				layer_set_visible("Backgrounds_zigzag1", true);
				layer_background_change(bg, bg_pizzaface_p2_sky);
				fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
				substate = states.transition;
				sprite_index = spr_pizzahead_intro4;
				image_index = 0;
				with obj_bosscontroller
				{
					global.playerhit = 0;
					player_hp = player_maxhp;
					boss_hpsprite = spr_bossfight_pizzaheadHP;
					boss_palette = spr_bossfight_pizzaheadpalette;
				}
				with obj_player1
				{
					sprite_index = spr_player_gnomecutscene3;
					if !ispeppino
						sprite_index = spr_playerN_doiseintro2;
					else
						fmod_event_one_shot("event:/sfx/pep/screamboss");
					image_index = 0;
				}
				with obj_camera
				{
					shake_mag = 3;
					shake_mag_acc = 5 / room_speed;
				}
			}
			break;
		
		case states.transition:
			instance_create_unique(x, y, obj_pizzaheadTVspawner);
			if (x != targetplayer.x && floor(image_index) >= 31)
				image_xscale = sign(targetplayer.x - x);
			if (!laugh_snd && floor(image_index) >= 52)
			{
				laugh_snd = true;
				fmod_event_one_shot("event:/sfx/voice/pizzahead");
			}
			if floor(image_index) == image_number - 1
			{
				state = states.walk;
				image_xscale = 1;
				with obj_player1
				{
					state = states.animation;
					tauntstoredstate = states.normal;
					if ispeppino
					{
						sprite_index = spr_player_screamtransition;
						image_index = 0;
						image_speed = 0.35;
					}
					landAnim = false;
				}
				if !obj_player1.ispeppino
				{
					with obj_music
					{
						if music != -4
							fmod_event_instance_set_parameter(music.event, "state", 1.4, true);
					}
				}
			}
			break;
	}
}
function scr_pizzaface_p2_normal()
{
	if elitehit <= 0
	{
		destroyable = true;
		instance_destroy();
	}
	if (instance_exists(obj_pistolpickup))
	{
		sprite_index = spr_pizzahead_idle;
		hsp = 0;
		vsp = 0;
	}
	else
	{
		if !obj_player1.ispeppino
		{
			with obj_music
			{
				if (music != -4 && fmod_event_instance_get_parameter(music.event, "state") < 1)
					fmod_event_instance_set_parameter(music.event, "state", 1.4, true);
			}
		}
		if flickertime <= 0
		{
			if (instance_exists(obj_pizzaheadportrait) || instance_exists(obj_forknightspawner))
				idle_buffer = 10;
			if idle_buffer > 0
			{
				idle_buffer--;
				hsp = 0;
				sprite_index = spr_pizzahead_idle;
			}
			else
			{
				sprite_index = spr_pizzahead_giddy;
				hsp = image_xscale * (10 + (wastedhits * 2));
				if (grounded && vsp > 0 && place_meeting(x + (sign(hsp) * 64), y, obj_solid))
				{
					state = states.pizzahead_fishing;
					hsp = 0;
					sprite_index = spr_pizzahead_grabitem;
					image_index = 0;
				}
			}
		}
		else
		{
			sprite_index = spr_pizzahead_hurt;
			if grounded
				hsp = Approach(hsp, 0, 0.25);
			if grounded && vsp > 0 && flickertime > 0
			{
				hsp = Approach(hsp, 0, 0.5);
				create_particle(x, y, particle.landcloud);
				vsp = -5;
				touchedground = true;
			}
		}
	}
}
function scr_pizzaface_p2_look()
{
	hsp = 0;
	if fishingbuffer > 0
		fishingbuffer--;
	else if fishcount > 0
	{
		fishcount--;
		state = states.walk;
		image_xscale *= -1;
		sprite_index = spr_pizzahead_giddy;
	}
	else
	{
		state = states.pizzahead_fishing;
		fishingbuffer = 80;
		fishcount = irandom_range(1, 3);
	}
}
function scr_pizzaface_p2_fishing()
{
	hsp = 0;
	if (instance_exists(obj_pizzaheadswordstone) && abs(x - obj_pizzaheadswordstone.x) <= 120)
	{
		leveldown = false;
		state = states.pizzahead_pullinglevel;
		sprite_index = spr_pizzahead_pullinglevel2;
		image_index = 0;
	}
	else if !global.pistol
	{
		if floor(image_index) == image_number - 1
		{
			saveddir = -image_xscale;
			hsp = 0;
			vsp = 0;
			state = states.shotgun;
			substate = states.throwing;
			sprite_index = spr_pizzahead_grabbox;
			image_index = 0;
		}
	}
	else if floor(image_index) == image_number - 1
	{
		saveddir = -image_xscale;
		if throwsword && lastattack != pizzaface_p2_attacks.pullinglevel
			leveldown = true;
		if miniguncount > 0
		{
			brick = false;
			state = states.shotgun;
			hsp = 0;
			vsp = 0;
			substate = states.throwing;
			sprite_index = spr_pizzahead_grabdynamite;
			image_index = 0;
			miniguncount = 0;
		}
		else
		{
			availablemoves = [];
			for (var i = 0; i < array_length(movecount); i++)
			{
				if movecount[i] < 2
					array_push(availablemoves, i);
			}
			do var t = availablemoves[irandom(array_length(availablemoves) - 1)];
			until (lastattack != t || array_length(availablemoves) <= 1)
			
			lastattack = t;
			idle_buffer = 0;
			
			switch t
			{
				case pizzaface_p2_attacks.pullinglevel:
					state = states.pizzahead_pullinglevel;
					substate = 0;
					sprite_index = spr_pizzahead_pullinglevel1;
					image_index = 0;
					shot = false;
					instance_create(x + (42 * image_xscale), y + 200, obj_pizzaheadswordstone);
					with obj_camera
					{
						shake_mag = 3;
						shake_mag_acc = 1 / room_speed;
					}
					break;
				
				case pizzaface_p2_attacks.ratball:
					brick = true;
					state = states.throwing;
					brickcount = 1;
					sprite_index = spr_pizzahead_ratballstart;
					image_index = 0;
					break;
				
				case pizzaface_p2_attacks.tv:
					state = states.pizzahead_portraitthrow;
					shot = false;
					sprite_index = spr_pizzahead_grabTV;
					image_index = 0;
					break;
				
				case pizzaface_p2_attacks.gun:
					sprite_index = spr_pizzahead_grabgun;
					image_index = 0;
					state = states.shotgun;
					ammo = 20;
					if image_xscale > 0
					{
						minigun_angle = 225;
						minigun_dir = -1;
					}
					else
					{
						minigun_angle = 315;
						minigun_dir = 1;
					}
					substate = states.mini;
					attackbuffer = 1;
					break;
				
				case pizzaface_p2_attacks.pinup:
					sprite_index = spr_pizzahead_pinup;
					image_index = 0;
					state = states.animation;
					break;
			}
		}
	}
}
function boss_pizzahead_pinup()
{
	hsp = 0;
	if floor(image_index) == image_number - 1
	{
		state = states.pizzahead_fishing;
		hsp = 0;
		sprite_index = spr_pizzahead_grabitem;
		image_index = 12;
	}
}
function boss_pizzahead_portraitthrow()
{
	if (floor(image_index) >= 44 && !shot)
	{
		shot = true;
		with (instance_create(x, y - 32, obj_pizzaheadportrait))
		{
			dir = -other.image_xscale;
			vsp = -18;
			spd += (other.wastedhits * 0.25);
			while (place_meeting(x, y, obj_solid))
				x += (x > (room_width / 2)) ? -1 : 1;
		}
	}
	if floor(image_index) == image_number - 1
	{
		image_xscale *= -1;
		state = states.walk;
	}
}
function boss_pizzahead_pullinglevel()
{
	if sprite_index == spr_pizzahead_pullinglevel2
	{
		var ix = floor(image_index);
		with obj_pizzaheadswordstone
		{
			if ix < 8
				y = other.y + 33;
			else if ix == 8
				y = other.y + 64;
			else if ix == 9
				y = other.y + 99;
			else if ix == 10
				y = other.y + 118;
			else if ix == 11
				y = other.y + 141;
			else if ix == 12
				y = other.y + 159;
		}
	}
	else if sprite_index == spr_pizzahead_pullinglevel1
	{
		with obj_pizzaheadswordstone
		{
			if (floor(other.image_index) >= 21)
			{
				switch (floor(other.image_index))
				{
					case 21:
						y = other.y + 90;
						break;
					case 22:
						y = other.y + 56;
						break;
					case 23:
						y = other.y + 26;
						break;
					case 24:
						y = other.y + 30;
						break;
					case 25:
						y = other.y + 32;
						break;
					case 26:
						y = other.y + 33;
						ystart = y;
						break;
				}
			}
			if (floor(other.image_index) >= 26)
			{
				ystart = other.y + 33;
				y = other.y + 33;
			}
		}
	}
	if (floor(image_index) >= 22 && sprite_index == spr_pizzahead_pullinglevel1 && !shot)
	{
		shot = true;
		repeat (7 + irandom(5))
		{
			var _x = irandom_range(100, room_width - 100);
			_x = clamp(_x, 100, room_width - 100);
			with (instance_create(_x, room_height + 100, obj_forknight_pizzahead))
				vsp = -irandom_range(18, 26);
		}
	}
	if floor(image_index) == image_number - 1
	{
		if sprite_index == spr_pizzahead_pullinglevel1
		{
			image_index = image_number - 1;
			with obj_pizzaheadswordstone
				y = other.y + 33;
			if (!instance_exists(obj_forknight_pizzahead) && !instance_exists(obj_medievalprojectile))
			{
				state = states.pizzahead_pullinglevel;
				fmod_event_one_shot("event:/sfx/pizzahead/medievalbringup");
				sprite_index = spr_pizzahead_pullinglevel2;
				image_index = 0;
				with obj_pizzaheadswordstone
					y = other.y + 33;
			}
		}
		else if sprite_index == spr_pizzahead_pullinglevel2
		{
			sprite_index = spr_pizzahead_giddy;
			state = states.walk;
			image_xscale *= -1;
			idle_buffer = 0;
			leveldown = false;
			throwsword = false;
			instance_destroy(obj_pizzaheadswordstone);
		}
	}
}
function boss_pizzahead_throwing()
{
	hsp = 0;
	if !brick
	{
		if floor(image_index) == image_number - 1
			state = states.walk;
	}
	else
	{
		if sprite_index == spr_pizzahead_ratballstart
		{
			if floor(image_index) == image_number - 1
			{
				sprite_index = spr_pizzahead_ratballidle;
				image_xscale *= -1;
			}
		}
		else if sprite_index == spr_pizzahead_ratballthrow
		{
			if (floor(image_index) >= 18 && !shot)
			{
				shot = true;
				with (instance_create(x + (46 * image_xscale), y - 64, obj_pizzaheadbrickball))
				{
					image_xscale = other.image_xscale;
					var s1 = 14 + other.wastedhits;
					var s2 = 23 + other.wastedhits;
					grav += (other.wastedhits * 0.1);
					calculate_jump_velocity(obj_player1.x, obj_player1.y, s1, grav);
					if (abs(hsp) <= 1 && (abs(vsp) <= 1 || vsp > 0))
						calculate_jump_velocity(obj_player1.x, obj_player1.y, s2, grav);
					movespeed = abs(hsp);
					if movespeed <= 4
						movespeed = 10;
				}
			}
			if floor(image_index) == image_number - 1
				sprite_index = spr_pizzahead_ratballidle;
		}
		else if sprite_index == spr_pizzahead_ratballcatch
		{
			if floor(image_index) == image_number - 1
				sprite_index = spr_pizzahead_ratballidle;
		}
		else if sprite_index == spr_pizzahead_ratballend
		{
			if floor(image_index) == image_number - 1
				state = states.walk;
		}
		if sprite_index == spr_pizzahead_ratballidle
		{
			if (!instance_exists(obj_pizzaheadbrickball))
			{
				if brickcount > 0
				{
					brickcount--;
					shot = false;
					sprite_index = spr_pizzahead_ratballthrow;
					image_index = 0;
				}
				else
				{
					sprite_index = spr_pizzahead_ratballend;
					image_index = 0;
				}
			}
		}
	}
}
function boss_pizzahead_shotgun()
{
	switch substate
	{
		case states.mini:
			if sprite_index == spr_pizzahead_grabgun
			{
				if floor(image_index) == image_number - 1
					sprite_index = spr_pizzahead_machinegun;
			}
			else if attackbuffer > 0
				attackbuffer--;
			else
			{
				attackbuffer = 5;
				ammo--;
				if ammo > 0
				{
					fmod_event_one_shot_3d("event:/sfx/pizzahead/uzi", x, y);
					with (instance_create(x, y, obj_pizzaheadbullet))
					{
						image_angle = other.minigun_angle;
						if other.image_xscale == -1
							image_angle *= -1;
					}
					minigun_angle += (minigun_dir * 15);
					if image_xscale > 0
					{
						if minigun_dir == -1 && minigun_angle < 120
							minigun_dir *= -1;
						else if minigun_dir == 1 && minigun_angle > 225
							minigun_dir *= -1;
					}
					else if minigun_dir == -1 && minigun_angle < 315
						minigun_dir *= -1;
					else if minigun_dir == 1 && minigun_angle > 405
						minigun_dir *= -1;
				}
				else
				{
					fmod_event_one_shot_3d("event:/sfx/pizzahead/throw", x, y);
					with (instance_create(x - (image_xscale * 30), y, obj_pizzaheadminigun))
					{
						image_xscale = other.image_xscale;
						hsp = -image_xscale * irandom_range(10, 14);
						vsp = -irandom_range(7, 10);
					}
					idle_buffer = 0;
					substate = states.throwing;
					sprite_index = spr_pizzahead_throwaway;
					image_index = 0;
					miniguncount = 2;
					fishcount = 0;
				}
			}
			break;
		case states.throwing:
			if floor(image_index) == image_number - 1
			{
				if sprite_index == spr_pizzahead_grabbox
				{
					fmod_event_one_shot_3d("event:/sfx/pizzahead/throw", x, y);
					sprite_index = spr_pizzahead_throwaway;
					image_index = 0;
					idle_buffer = 0;
					with (instance_create(x, y - 15, obj_pistolpickup))
					{
						hsp = irandom_range(5, 10) * -other.image_xscale;
						vsp = -irandom_range(7, 14);
					}
				}
				else if sprite_index == spr_pizzahead_grabdynamite
				{
					fmod_event_one_shot_3d("event:/sfx/pizzahead/throw", x, y);
					idle_buffer = 0;
					sprite_index = spr_pizzahead_throwaway;
					image_index = 0;
					repeat 5
					{
						with (instance_create(x - (image_xscale * 5), y - 15, obj_vigilantedynamite))
						{
							hsp = irandom_range(5, 10) * -other.image_xscale;
							vsp = -irandom_range(7, 14);
						}
					}
				}
				else
				{
					state = states.walk;
					if !global.pistol
					{
						image_xscale = saveddir;
						sprite_index = spr_pizzahead_idle;
					}
					else
					{
						if miniguncount > 0
							fishcount = 0;
						else
							image_xscale = saveddir;
						if miniguncount == 2
							image_xscale = saveddir;
					}
				}
			}
			break;
	}
}
function boss_pizzahead_p2_phase1hurt()
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
		invtime = 30;
		state = states.actor;
		pistolanim = -4;
		sprite_index = spr_player_pistolshotend;
		if !ispeppino
			sprite_index = spr_playerN_bosstransition;
	}
	instance_create_unique(0, 0, obj_bossdark);
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
		instance_destroy(obj_bossdark);
		instance_create(0, 0, obj_pizzahead_whitefade);
		obj_camera.lock = false;
		camzoom = 1;
		camera_set_view_size(view_camera[0], SCREEN_WIDTH, SCREEN_HEIGHT);
		elitehit--;
		with obj_player
			state = states.normal;
	}
	obj_screensizer.camzoom = camzoom;
}
