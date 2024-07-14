function scr_boss_grabbed()
{
	if pizzahead
	{
		instance_destroy(obj_peppermanGIANTbowlingball);
		instance_destroy(obj_peppermanartdude);
		instance_destroy(obj_peppermanbowlingball);
		instance_destroy(obj_peppermanbowlingballspawner);
		instance_destroy(obj_vigilantecow);
		instance_destroy(obj_cowstampede);
		instance_destroy(obj_vigilanteshot);
		instance_destroy(obj_playerbomb, false);
	}
	var playerid = (grabbedby == 1) ? obj_player1.id : obj_player2.id;
	with playerid
	{
		if (state != states.supergrab || baddiegrabbedID != other)
		{
			if other.elitehit <= 1 && other.object_index != obj_pizzafaceboss
				other.destroyable = true;
			if (other.object_index != obj_pepperman || other.elitehit < 5)
				punchcount = 20 - (other.elitehit * 2);
			else
				punchcount = 20;
			pizzahead = other.pizzahead;
			subhpshot_max = floor(punchcount / (other.pizzahead_maxsubhp + 1));
			subhpshot = subhpshot_max;
			bombbuffer = 0;
			hiteffect = true;
			reposition = false;
			if !other.pizzahead
			{
				punchcount = 0;
				hiteffect = false;
			}
			else if ((xscale > 0 && x > (room_width - 100)) || (xscale < 0 && x < 100))
				reposition = true;
			supergrabx = other.x - x;
			supergraby = other.y - y;
			camzoom = other.camzoom;
			baddiegrabbedID = other.id;
			state = states.supergrab;
			supergrabstate = states.punch;
			sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7);
			image_index = sprite_get_number(sprite_index) - 1;
			other.camzoom = 1;
			if !ispeppino
			{
				if x != other.x
					xscale = sign(other.x - x);
				else
					xscale = (x < (room_width / 2)) ? 1 : -1;
			}
		}
	}
	image_xscale = -playerid.xscale;
	sprite_index = grabbedspr;
	state = states.supergrab;
}
function scr_boss_pizzaheadjump()
{
	if object_index != obj_noisey
		hsp = 0;
	if vsp < 0
	{
		use_collision = false;
		x += hsp;
		y += vsp;
		if vsp < 20
			vsp += grav;
	}
	else
		use_collision = true;
	if floor(image_index) == image_number - 1
	{
		switch sprite_index
		{
			case spr_playerV_jump:
				sprite_index = spr_playerV_fall;
				break;
			case spr_lonegustavo_jumpstart:
				sprite_index = spr_lonegustavo_jump;
				break;
			case spr_player_ratmountgroundpound:
				sprite_index = spr_player_ratmountgroundpoundfall;
				break;
			case spr_playerN_jump:
				sprite_index = spr_playerN_fall;
				break;
			case spr_fakepeppino_jump:
				sprite_index = spr_fakepeppino_fall;
				break;
		}
	}
	if object_index == obj_noiseboss && doise
		sprite_index = spr_doise_deadair;
	if grounded && vsp > 0
	{
		state = states.walk;
		switch object_index
		{
			case obj_pepperman:
				sprite_index = spr_pepperman_idle;
				break;
			case obj_vigilanteboss:
				sprite_index = spr_playerV_idle;
				break;
			case obj_noiseboss:
				if obj_player1.ispeppino
					sprite_index = spr_playerN_idle;
				else
					sprite_index = spr_playerN_animatronic;
				break;
			case obj_fakepepboss:
				sprite_index = spr_fakepeppino_idle;
				break;
		}
		if object_index == obj_noisey
		{
			state = states.stun;
			stunned = 0;
		}
	}
}
function boss_update_pizzaheadKO(hpsprite, palette)
{
	if (pizzahead && pizzaheadKO && !instance_exists(pizzaheadKO_ID))
	{
		pizzaheadKO = false;
		elitehit = 4;
		prevhp = elitehit;
		with obj_bosscontroller
		{
			boss_hpsprite = hpsprite;
			boss_palette = palette;
		}
		image_alpha = 1;
		if state == states.KO
			state = states.walk;
	}
}
function boss_hurt_gustavo()
{
	if pizzahead
	{
		with obj_gustavograbbable
		{
			var _slam = enemy_is_superslam(id) || enemy_is_swingding(id);
			if ((thrown || _slam) && other.state != states.KO && (place_meeting(x + hsp, y, other) || place_meeting(x - image_xscale, y, other) || place_meeting(x - (32 * image_xscale), y, other) || place_meeting(x + (32 * image_xscale), y, other)))
			{
				with other
				{
					state = states.stun;
					stunned = 1000;
					thrown = false;
					savedthrown = false;
					if other.hsp != 0
						image_xscale = -sign(other.hsp);
					hsp = -image_xscale * 8;
					vsp = -4;
					instance_destroy(other);
				}
				if _slam
				{
					with obj_player
						baddiegrabbedID = -4;
					instance_destroy();
				}
			}
		}
	}
}
function boss_do_pizzaheadKO()
{
	if pizzahead && pizzaheadKO && state != states.pizzaheadjump && elitehit <= 3
	{
		pizzaheadKO_buffer = 5;
		state = states.KO;
		image_alpha = 1;
	}
}
function scr_boss_pizzaheadKO()
{
	if grounded
		hsp = Approach(hsp, 0, 0.2);
	switch object_index
	{
		case obj_vigilanteboss:
			sprite_index = spr_playerV_hurt;
			break;
		case obj_noiseboss:
			sprite_index = spr_playerN_hurt;
			break;
		case obj_fakepepboss:
			sprite_index = spr_fakepeppino_vulnerable;
			break;
	}
	if pizzaheadKO_buffer > 0
		pizzaheadKO_buffer = 0;
	else
	{
		pizzaheadKO_buffer = 5;
		if image_alpha == 1
			image_alpha = 0;
		else
			image_alpha = 1;
	}
}
function scr_boss_genericintro(sprite, buffer = 30)
{
	if sprite_index != sprite
	{
		sprite_index = sprite;
		introbuffer = buffer;
	}
	if introbuffer > buffer
		introbuffer = buffer;
	with obj_player1
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
	with obj_player2
		visible = false;
	if introbuffer > 0
		introbuffer--;
	else
	{
		state = states.walk;
		if (instance_exists(spotlightID))
			spotlightID.expand = true;
		with obj_player
		{
			state = states.normal;
			sprite_index = spr_idle;
		}
	}
}
function scr_boss_do_hurt_phase2(player, time = 100)
{
	with player
	{
		state = states.phase1hurt;
		invtime = time + 40;
		hurted = false;
		image_alpha = 1;
		alarm[5] = -1;
		alarm[6] = -1;
		alarm[8] = -1;
		event_perform(ev_alarm, 7);
		sprite_index = spr_finishingblow1;
		image_index = 0;
		hitX = x;
		hitY = y;
	}
	pulse = 0;
	state = states.phase1hurt;
	buildup = time;
	buildup_playerID = player;
	camzoom = 1;
	flashbuffer = time - 40;
	fmod_event_one_shot("event:/sfx/misc/blackoutpunch");
	instance_create_unique(0, 0, obj_blackoutline)
	instance_create_unique(0, 0, obj_superattackeffect)
	image_xscale = -player.xscale;
	if !player.ispeppino
	{
		hitX = x;
		hitY = y;
	}
	instance_create(0, 0, obj_bossdark);
}
function scr_boss_playerN_phase1hurt(func = noone)
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
		sprite_index = spr_playerN_bosstransition;
		invtime = 30;
	}
	instance_create_unique(0, 0, obj_bossdark);
	if buildup > 0
	{
		obj_camera.lock = true;
		camzoom = lerp(camzoom, 0.5, 0.2);
		camera_set_view_size(view_camera[0], SCREEN_WIDTH * camzoom, SCREEN_HEIGHT * camzoom);
		var _x = clamp(x - (SCREEN_WIDTH * camzoom) / 2, 0, room_width - (SCREEN_WIDTH * camzoom));
		var _y = clamp(y - (SCREEN_HEIGHT * camzoom) / 2, 0, room_height - (SCREEN_HEIGHT * camzoom));
		camera_set_view_pos(view_camera[0], _x, _y);
		buildup--;
	}
	else
	{
		var lag = 15;
		hitLag = lag;
		hitX = x;
		hitY = y;
		instance_create(x, y, obj_parryeffect);
		GamepadSetVibration(0, 0.8, 0.8, 0.65);
		fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
		fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
		state = states.stun;
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_slapstar);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_baddiegibs);
		instance_create(x, y, obj_bangeffect);
		instance_destroy(obj_bossdark);
		repeat 4
		{
			with (create_debris(x + random_range(-64, 64), y + random_range(-64, 64), spr_flashdots, true))
			{
				hsp = random_range(-5, 5);
				vsp = random_range(-10, 10);
				image_speed = 0.4;
			}
		}
		camera_set_view_size(view_camera[0], SCREEN_WIDTH, SCREEN_HEIGHT);
		obj_screensizer.camzoom = 1;
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
		with obj_camera
		{
			shake_mag = 3;
			shake_mag_acc = 5 / room_speed;
		}
		instance_destroy(obj_blackoutline);
		instance_destroy(obj_superattackeffect);
		instance_destroy(obj_bossdark);
		instance_destroy(obj_lightsource);
		instance_create(0, 0, obj_pizzahead_whitefade);
		obj_camera.lock = false;
		camzoom = 1;
		camera_set_view_size(view_camera[0], SCREEN_WIDTH, SCREEN_HEIGHT);
		with obj_player
			state = states.normal;
		hithsp = -image_xscale * 25;
		hitvsp = -5;
		hsp = hithsp;
		vsp = hitvsp;
		thrown = true;
		linethrown = true;
		override_throw = true;
		image_speed = 0.35;
		if func != noone
			func();
	}
	obj_screensizer.camzoom = camzoom;
	image_speed = 0.35;
}
function scr_boss_phase1hurt(func = noone)
{
	if !obj_player1.ispeppino
	{
		scr_boss_playerN_phase1hurt(func);
		exit;
	}
	var player = buildup_playerID;
	var px = player.x + (player.xscale * 60);
	var py = player.y;
	if sprite_index == stunfallspr
		py += 25;
	image_speed = 0;
	if flashbuffer > 0
		flashbuffer--;
	else if flashbuffer == 0
	{
		flashbuffer = -1;
		with player
		{
			with (instance_create(x - (xscale * 61), y - 21, obj_explosioneffect))
			{
				depth = -12;
				fmod_event_one_shot("event:/sfx/ending/star");
				sprite_index = choose(spr_bossfight_blackoutpunch1, spr_bossfight_blackoutpunch2);
				image_speed = 0.3;
			}
		}
	}
	if buildup > 0
	{
		camzoom = lerp(camzoom, 0.5, 0.1);
		obj_screensizer.camzoom = camzoom;
		camera_set_view_size(view_camera[0], SCREEN_WIDTH * camzoom, SCREEN_HEIGHT * camzoom);
		x = px;
		y = py;
		buildup--;
		with player
		{
			invtime = 30;
			vsp = 0;
			x = hitX;
			y = hitY;
			image_index = 0;
			image_speed = 0;
		}
	}
	else
	{
		instance_destroy(obj_superattackeffect);
		instance_destroy(obj_blackoutline);
		camzoom = lerp(camzoom, 1, 0.5);
		obj_screensizer.camzoom = camzoom;
		camera_set_view_size(view_camera[0], SCREEN_WIDTH * camzoom, SCREEN_HEIGHT * camzoom);
		with player
		{
			if state != states.finishingblow
			{
				state = states.finishingblow;
				image_speed = 0.35;
				image_index = 0;
				hsp = 0;
				movespeed = 0;
			}
		}
		x = px;
		y = py;
		if floor(player.image_index >= 4)
		{
			var lag = 15;
			hitLag = lag;
			hitX = x;
			hitY = y;
			player.movespeed = 0;
			player.hitLag = lag;
			player.hitX = player.x;
			player.hitY = player.y;
			instance_create(x, y, obj_parryeffect);
			GamepadSetVibration((player.object_index == obj_player1) ? 0 : 1, 0.8, 0.8, 0.65);
			fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
			fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
			state = states.stun;
			image_xscale = -player.xscale;
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_bangeffect);
			instance_destroy(obj_bossdark);
			repeat 4
			{
				with (create_debris(x + random_range(-64, 64), y + random_range(-64, 64), spr_flashdots, true))
				{
					hsp = random_range(-5, 5);
					vsp = random_range(-10, 10);
					image_speed = 0.4;
				}
			}
			camera_set_view_size(view_camera[0], SCREEN_WIDTH, SCREEN_HEIGHT);
			obj_screensizer.camzoom = 1;
			create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
			with obj_camera
			{
				shake_mag = 3;
				shake_mag_acc = 5 / room_speed;
			}
			with player
			{
				other.hithsp = -other.image_xscale * 25;
				other.hitvsp = -8;
				vsp = -6;
				hsp = -xscale * 4;
				movespeed = 4;
				state = states.tackle;
			}
			check_grabbed_solid(player);
			check_grabbed_solid(player);
			hsp = hithsp;
			vsp = hitvsp;
			thrown = true;
			linethrown = true;
			image_speed = 0.35;
			if func != noone
				func();
		}
	}
}
