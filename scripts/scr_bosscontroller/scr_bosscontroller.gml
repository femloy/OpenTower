function scr_bosscontroller_particle_hp(sprite, image, x, y, hsp, spr_palette, paletteselect, palettetexture = noone)
{
	with obj_bosscontroller
	{
		var q = 
		{
			type: 0,
			sprite_index: sprite,
			image_index: image,
			x: x,
			y: y,
			hsp: 8 * hsp,
			vsp: -6,
			spr_palette: spr_palette,
			paletteselect: paletteselect,
			palettetexture: palettetexture
		};
		ds_list_add(particlelist, q);
		return q;
	}
}
function scr_bosscontroller_particle_anim(sprite, image, x, y, imagespeed, spr_palette = spr_peppalette, paletteselect = 0)
{
	with obj_bosscontroller
	{
		var q = 
		{
			type: 1,
			sprite_index: sprite,
			image_index: image,
			image_speed: imagespeed,
			x: x,
			y: y,
			spr_palette: spr_palette,
			paletteselect: paletteselect
		};
		ds_list_add(particlelist, q);
		return q;
	}
}
function scr_bosscontroller_intro()
{
	with obj_player
	{
		state = states.actor;
		image_blend = make_colour_hsv(0, 0, 255);
		hsp = 0;
		movespeed = 0;
		flash = false;
		x = roomstartx;
	}
	with bossID
	{
		if state != states.actor
			other.bossintrostate = state;
		state = states.actor;
		x = xstart;
		y = ystart;
		hsp = 0;
		vsp = 0;
	}
	flamey -= 4;
	if introshake > 0
		introshake -= introshake_acc;
	var a = 0.1;
	if arenabuffer > 0
		arenabuffer--;
	else
	{
		switch arenastate
		{
			case 0:
				var ptx = 0;
				playerx = lerp(playerx, ptx, a);
				if (abs(playerx - ptx) <= 10)
					arenastate++;
				break;
			case 1:
				var btx = SCREEN_WIDTH;
				bossx = lerp(bossx, btx, a);
				if (abs(bossx - btx) <= 10)
				{
					arenastate++;
					fmod_event_one_shot("event:/sfx/misc/versusscreen");
				}
				break;
			case 2:
				whitefade += 0.02;
				if whitefade >= 2
				{
					whitefade = 0;
					arenastate++;
					arenabuffer = 300;
					introshake = 20;
					introshake_acc = 0.5;
				}
				break;
			case 3:
				state = states.normal;
				with obj_player
				{
					state = states.actor;
					hsp = 0;
					movespeed = 0;
					flash = false;
					x = roomstartx;
				}
				with bossID
				{
					skipintro = false;
					state = other.bossintrostate;
				}
				with obj_music
				{
					if (!instance_exists(obj_noiseboss) || obj_noiseboss.sprite_index != spr_playerN_animatronic)
						fmod_event_instance_play(music.event);
				}
				break;
		}
	}
}
function scr_bosscontroller_normal()
{
	if boss_func != -4
		boss_func();
	if boss_prevhp != boss_hp
	{
		if boss_prevhp > boss_hp
		{
			boss_prevhp = boss_hp;
			var pos = scr_bosscontroller_get_health_pos(boss_hp + 1, boss_rowmax, boss_columnmax, boss_maxhp, boss_hp_x, boss_hp_y, boss_xpad, boss_ypad, true);
			if (!is_undefined(pos) && is_array(pos))
			{
				var bpal = boss_palette;
				var bpalsel = pos[2];
				var btex = -4;
				if boss_hpsprite == spr_bossfight_fakepephp
				{
					bpal = spr_peppalette;
					bpalsel = obj_player1.paletteselect;
					if !obj_player1.ispeppino
						bpalsel = 1;
					btex = global.palettetexture;
				}
				else if bossspr == spr_vsdoise
				{
					bpal = spr_noiseboss_palette;
					bpalsel = 1;
				}
				scr_bosscontroller_particle_hp(boss_hpsprite, irandom(sprite_get_number(boss_hpsprite) - 1), pos[0], pos[1], -1, bpal, bpalsel, btex);
			}
		}
		else if boss_prevhpbuffer > 0
			boss_prevhpbuffer--;
		else
		{
			boss_prevhpbuffer = 10;
			boss_prevhp++;
			pos = scr_bosscontroller_get_health_pos(boss_prevhp, boss_rowmax, boss_columnmax, boss_maxhp, boss_hp_x, boss_hp_y, boss_xpad, boss_ypad, true);
			if (!is_undefined(pos) && is_array(pos))
				scr_bosscontroller_particle_anim(spr_genericpoofeffect, 0, pos[0] - 30, pos[1] - 30, 0.5);
		}
	}
	if (!instance_exists(bossID) && !bossdead && instance_exists(obj_player1) && obj_player1.state != states.tackle && obj_player1.state != states.comingoutdoor && room != boss_fakepephallway && room != boss_pizzaface && room != rank_room)
	{
		if (room != boss_vigilante || obj_player1.state != states.actor)
		{
			bossdead = true;
			notification_push(notifs.boss_dead, [room]);
			alarm[0] = 480;
			with obj_player1
			{
				fmod_event_instance_play(global.snd_bossbeaten);
				global.pistol = false;
				pistolanim = -4;
				sprite_index = spr_player_levelcomplete;
				if !ispeppino
					sprite_index = spr_playerN_levelcomplete;
				image_speed = 0.35;
				image_index = 0;
				state = states.arenaintro;
				hsp = 0;
				vsp = 0;
				movespeed = 0;
			}
			with obj_hppickup
			{
				scr_collect_hat()
				instance_destroy()
			}
			with obj_music
				fmod_event_instance_stop(music.event, false);
		}
	}
	if (!bossdead && player_hp <= 0 && alarm[3] == -1 && !instance_exists(obj_bossplayerdeath))
	{
		player_hp = 0;
		instance_create(0, 0, obj_bossplayerdeath);
	}
}
function scr_bosscontroller_victory()
{
	if victory_buffer > 0
		victory_buffer--;
	else if (!instance_exists(obj_bosskeynoise))
	{
		if player_hp > 0
		{
			victory_buffer = 25;
			var pos = scr_bosscontroller_get_health_pos(player_hp, player_rowmax, player_columnmax, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad);
			player_hp--;
			with (instance_create(pos[0], pos[1], obj_hpeffect))
			{
				x_to = obj_player1.x;
				y_to = obj_player1.y;
				spd = 16;
				finish = true;
			}
		}
		else if (!instance_exists(obj_hpeffect) && !instance_exists(obj_endlevelfade))
		{
			with obj_player1
				scr_do_rank(false, true);
		}
	}
}
function scr_bosscontroller_pizzaface_p3_health()
{
	var e = elitehit;
	while e > 2
		e -= 2;
	var eh = e + ((e - 1) * pizzahead_maxsubhp) + pizzahead_subhp;
	return eh;
}
function scr_bosscontroller_draw_health(sprite, rows, columns, hp, maxhp, x, y, xpad, ypad, index, alpha, spr_palette = noone, paletteselect = noone, palettetexture = noone)
{
	var hpp = 0;
	for (var _index = 0; hpp < maxhp; _index++)
	{
		var c = c_white;
		var zpad = _index * 3;
		if spr_palette != -4
		{
			if paletteselect == noone
				pal_swap_set(spr_palette, _index, false);
			else
				pal_swap_set(spr_palette, paletteselect, false);
		}
		var _x = 0;
		var _y = 0;
		repeat rows * columns
		{
			if (_index == 0 && hp < (rows * columns) && hpp >= hp)
				c = 0;
			if (_index == 0 || hpp < hp)
			{
				var xf = (x + (_x * xpad)) - zpad;
				var yf = (y + (_y * ypad)) - zpad;
				if palettetexture != -4
					pattern_set(global.Base_Pattern_Color, sprite, index, 1, 1, palettetexture);
				draw_sprite_ext(sprite, index, xf, yf, 1, 1, 0, c, alpha);
			}
			_x++;
			if _x >= columns
			{
				_x = 0;
				_y++;
			}
			hpp++;
		}
	}
	pattern_reset();
}
function scr_bosscontroller_get_health_pos(hp, rows, columns, maxhp, x, y, xpad, ypad, unused_arg = false)
{
	var hpp = 0;
	for (var _index = 0; hpp < maxhp; _index++)
	{
		var zpad = _index * 3;
		var _x = 0;
		var _y = 0;
		repeat rows * columns
		{
			hpp++;
			if hpp >= hp
				return [(x + (_x * xpad)) - zpad, (y + (_y * ypad)) - zpad, _index];
			_x++;
			if _x >= columns
			{
				_x = 0;
				_y++;
			}
		}
	}
	return undefined;
}
function scr_collect_hat(_persistent = false)
{
	with obj_bosscontroller
	{
		if ((player_hp + instance_number(obj_hpeffect)) < player_maxhp)
		{
			fmod_event_one_shot("event:/sfx/misc/cardcollect")
			var pos = scr_bosscontroller_get_health_pos((player_hp + 1), player_rowmax, player_columnmax, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad)
			with (instance_create(other.x, other.y, obj_hpeffect))
			{
				if _persistent
					persistent = true
				image_index = other.image_index
				x_to = pos[0]
				y_to = pos[1]
			}
		}
		else
		{
			with other
			{
				scr_sound_multiple("event:/sfx/misc/collect", x, y)
				with obj_camera
					healthshaketime = 30
				var val = 50
				fmod_event_one_shot("event:/sfx/misc/cardcollect")
				global.extrahats++
				with (instance_create(x, y, obj_smallnumber))
					number = "+1"
			}
		}
	}
}
