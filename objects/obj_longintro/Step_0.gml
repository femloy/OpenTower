with obj_player
	state = states.titlescreen;
if scene >= 0
{
	scr_menu_getinput();
	if (!showtext && (key_jump || key_start))
	{
		showtext = true;
		alarm[0] = 120;
	}
	else if (showtext && (key_jump || key_start))
	{
		room_goto(Mainmenu);
		exit;
	}
}
var _switch = false;
if scenebuffer > 0
	scenebuffer--;
else
	_switch = true;
switch scene
{
	case -2:
		if (_switch && !instance_exists(obj_logoprop))
		{
			scene++;
			with (instance_create(room_width / 2, room_height / 2, obj_logoprop))
			{
				sprite_index = spr_intro_fmod;
				image_xscale = 0.5;
				image_yscale = image_xscale;
			}
		}
		break;
	case -1:
		if (_switch && !instance_exists(obj_logoprop))
		{
			scenebuffer = 340;
			scenebuffer += 20;
			scene++;
			with (instance_create(0, 0, obj_genericfade))
			{
				fade = 1.2;
				deccel = 0.03;
			}
			peppinopizza = instance_create(-100, 0, obj_introprop);
			peppinopizza.sprite_index = spr_introasset1;
			peppinopizza.depth = 0;
			tower = instance_create(80, 0, obj_introprop);
			tower.sprite_index = spr_introasset2;
			tower.depth = 1;
			clouds = instance_create(0, 0, obj_introprop);
			clouds.sprite_index = spr_introasset3;
			clouds.depth = 2;
			moon = instance_create(0, 0, obj_introprop);
			moon.sprite_index = spr_introasset4;
			moon.depth = 3;
			bg = instance_create(0, 0, obj_introprop);
			bg.sprite_index = spr_introasset5;
			bg.depth = 4;
			with obj_music
			{
				if music != -4
					fmod_event_instance_set_parameter(music.event, "state", 1, true);
			}
		}
		break;
	case 0:
		peppinopizza.x += 0.25;
		tower.x -= 0.15;
		moon.x += 0.08;
		clouds.x += 0.1;
		if _switch
		{
			instance_destroy(obj_introprop);
			peppino = instance_create(-70, 0, obj_introprop);
			peppino.sprite_index = spr_introasset9;
			peppino.depth = 0;
			scenebuffer = 130;
			scenebuffer += 30;
			scene++;
		}
		break;
	case 1:
		peppino.x += 0.2;
		if _switch
		{
			instance_destroy(obj_introprop);
			peppino = instance_create(0, 0, obj_introprop);
			peppino.sprite_index = spr_intro_table;
			peppino.depth = 0;
			tower = instance_create(0, 0, obj_introprop);
			tower.sprite_index = spr_introasset10;
			tower.depth = 2;
			clouds = instance_create(0, 0, obj_introprop);
			clouds.sprite_index = spr_introasset3;
			clouds.depth = 3;
			bg = instance_create(0, 0, obj_introprop);
			bg.sprite_index = spr_introasset5;
			bg.depth = 4;
			scenebuffer = 185;
			scene++;
		}
		break;
	case 2:
		if _switch
		{
			scenebuffer = 115;
			instance_destroy(obj_introprop);
			dramalines = instance_create(0, 0, obj_introprop);
			dramalines.sprite_index = spr_dramalines;
			dramalines.depth = 0;
			peppino = instance_create(0, 0, obj_introprop);
			peppino.sprite_index = spr_introasset11;
			peppino.depth = 1;
			bg = instance_create(0, 0, obj_introprop);
			bg.sprite_index = spr_intro_surprisedsplit3;
			bg.depth = 7;
			bg1 = instance_create(0, 0, obj_introprop);
			bg1.sprite_index = spr_intro_surprisedsplit1;
			bg1.depth = 6;
			bg2 = instance_create(0, 0, obj_introprop);
			bg2.sprite_index = spr_intro_surprisedsplit2;
			bg2.depth = 5;
			scene++;
		}
		break;
	case 3:
		bg1.x = lerp(bg1.x, -200, 0.04);
		bg2.x = lerp(bg2.x, 200, 0.04);
		if _switch
		{
			instance_destroy(obj_introprop);
			pizzaface = instance_create(0, 400, obj_introprop);
			pizzaface.sprite_index = spr_intro_pizzaface1;
			pizzaface.depth = 1;
			bg = instance_create(0, 0, obj_introprop);
			bg.sprite_index = spr_introasset12;
			bg.depth = 4;
			scene++;
		}
		break;
	case 4:
		pizzaface.y = lerp(pizzaface.y, 0, 0.04);
		if (_switch && floor(pizzaface.y) <= 1)
		{
			scenebuffer = 130;
			instance_destroy(obj_introprop);
			pizzaface = instance_create(0, 0, obj_introprop);
			pizzaface.sprite_index = spr_intro_pizzaface2;
			pizzaface.depth = 1;
			bg = instance_create(0, 0, obj_introprop);
			bg.sprite_index = spr_introasset15;
			bg.depth = 4;
			scene++;
		}
		break;
	case 5:
		if _switch
		{
			scenebuffer = 120;
			instance_destroy(obj_introprop);
			peppino = instance_create(0, 0, obj_introprop);
			peppino.sprite_index = spr_intro_pepscared;
			peppino.depth = 1;
			bg = instance_create(0, 0, obj_introprop);
			bg.sprite_index = spr_intro_spiralBG;
			bg.depth = 4;
			scene++;
		}
		break;
	case 6:
		if _switch
		{
			scenebuffer = 190;
			scene++;
			peppino.sprite_index = spr_intro_plot1;
			peppino.image_index = 0;
			instance_destroy(bg);
			bg = instance_create(480, 270, obj_tiledintroprop);
			bg.depth = 4;
			bg.sprite_index = spr_intro_plot1BG;
			bg.hspeed = -1;
			bg.vspeed = 1;
			bg1 = instance_create(480, 270, obj_tiledintroprop);
			bg1.depth = 3;
			bg1.sprite_index = spr_intro_plotpizzafaceBG;
			bg1.hspeed = 1;
			bg1.vspeed = -1;
		}
		break;
	case 7:
		if _switch
		{
			instance_destroy(bg);
			instance_destroy(bg1);
			scenebuffer = 100;
			scene++;
			peppino.sprite_index = spr_intro_plot2;
			peppino.image_index = 0;
			peppinopizza = instance_create(0, 0, obj_introprop);
			peppinopizza.sprite_index = spr_introasset13;
			peppinopizza.depth = 1;
			bg = instance_create(0, 0, obj_tiledintroprop);
			bg.depth = 4;
			bg.sprite_index = spr_intro_plot2BG;
			bg.vspeed = -0.2;
		}
		break;
	case 8:
		if _switch
		{
			scenebuffer = 120;
			scene++;
			peppino.sprite_index = spr_intro_plot3;
			peppino.image_index = 0;
			peppinopizza.sprite_index = spr_introasset14;
			bg.sprite_index = spr_intro_plot3BG;
			bg.vspeed = -6;
		}
		break;
	case 9:
		peppinopizza.x = irandom_range(-1, 1);
		peppinopizza.y = irandom_range(-1, 1);
		if _switch
		{
			scene++;
			with (instance_create(0, 0, obj_genericfade))
			{
				fade = 0;
				accel = 0.1;
				maxfade = 1.5;
				deccel = 0.05;
				color = c_white;
			}
		}
		break;
	case 10:
		if _switch && !obj_genericfade.fadein
		{
			instance_destroy(obj_introprop);
			peppino = instance_create(-130, 386, obj_playerprop);
			peppino.alarm[0] = 1;
			peppino.fake_hsp = 12;
			peppino.sprite_index = spr_player_mach;
			peppino.image_speed = 0.5;
			pizzaface = instance_create(-130, 200, obj_introprop);
			pizzaface.sprite_index = spr_pizzaface;
			pizzaface.image_speed = 0.35;
			scene++;
			scenebuffer = 170;
			layer_hspeed("Backgrounds_1", -3);
			layer_vspeed("Backgrounds_1", -3);
			layer_hspeed("Backgrounds_2", -0.1);
			layer_hspeed("Backgrounds_3", -0.15);
			layer_hspeed("Backgrounds_4", -0.25);
			layer_set_visible("Backgrounds_1", true);
			layer_set_visible("Backgrounds_2", true);
			layer_set_visible("Backgrounds_3", true);
			layer_set_visible("Backgrounds_4", true);
			layer_set_visible("Backgrounds_5", true);
			layer_set_visible("Backgrounds_6", true);
		}
		break;
	case 11:
		peppino.x += 1.5;
		pizzaface.x += 2.5;
		pizzaface.y = Wave(pizzaface.ystart - 30, pizzaface.ystart + 30, 3, 10);
		if _switch
		{
			scene++;
			scenebuffer = 180;
			instance_destroy(obj_introprop);
			peppino = instance_create(-50, 100, obj_introprop);
			peppino.sprite_index = spr_intro_running;
			peppino.depth = -15;
			bg = instance_create(0, -100, obj_introprop);
			bg.sprite_index = spr_introasset8;
			bg.depth = -14;
			bg2 = instance_create(0, 100, obj_tiledintroprop);
			bg2.sprite_index = spr_intro_skyfrombottom1;
			bg2.hspeed = -1;
			bg2.vspeed = 1;
			bg2.depth = -13;
		}
		break;
	case 12:
		peppino.x = Approach(peppino.x, 0, 3);
		peppino.y = Approach(peppino.y, 0, 5);
		bg.x -= 0.2;
		bg.y += 0.1;
		if _switch
		{
			scene++;
			scenebuffer = 60;
			instance_destroy(obj_introprop);
			peppino = instance_create(200, 386, obj_playerprop);
			peppino.fake_hsp = 12;
			peppino.alarm[0] = 1;
			peppino.sprite_index = spr_player_mach;
			peppino.image_speed = 0.5;
			pizzaface = instance_create(400, 200, obj_introprop);
			pizzaface.sprite_index = spr_pizzaface;
			pizzaface.image_speed = 0.35;
		}
		break;
	case 13:
		peppino.x += 1;
		pizzaface.x += 2;
		pizzaface.y = Wave(pizzaface.ystart - 30, pizzaface.ystart + 30, 3, 10);
		if _switch
		{
			peppino.sprite_index = spr_player_mach4;
			peppino.fake_hsp = 12;
			scene++;
			scenebuffer = 150;
			slime1 = instance_create(1300, 386, obj_introprop);
			slime1.sprite_index = spr_slime_intro;
			slime1.image_speed = 0.35;
			slime2 = instance_create(1400, 386, obj_introprop);
			slime2.sprite_index = spr_slime_intro;
			slime2.image_speed = 0.35;
		}
		break;
	case 14:
		peppino.x += 3;
		pizzaface.x += 5;
		pizzaface.y = Wave(pizzaface.ystart - 30, pizzaface.ystart + 30, 3, 10);
		slime1.x -= abs(layer_get_hspeed("Backgrounds_6"));
		slime2.x -= abs(layer_get_hspeed("Backgrounds_6"));
		if (peppino.x >= (slime1.x - 40))
		{
			scene++;
			scenebuffer = 140;
			layer_hspeed("Backgrounds_1", 0);
			layer_hspeed("Backgrounds_2", 0);
			layer_hspeed("Backgrounds_3", 0);
			layer_hspeed("Backgrounds_4", 0);
			layer_hspeed("Backgrounds_5", 0);
			layer_hspeed("Backgrounds_6", 0);
			instance_destroy(obj_introprop);
			peppino = instance_create(0, 0, obj_introprop);
			peppino.sprite_index = spr_intro_machrun;
			peppino.depth = -15;
			bg = instance_create(0, -100, obj_introprop);
			bg.sprite_index = spr_introasset8;
			bg.depth = -14;
			bg2 = instance_create(0, -100, obj_tiledintroprop);
			bg2.sprite_index = spr_intro_skyfrombottom2;
			bg2.hspeed = -1;
			bg2.vspeed = 1;
			bg2.depth = -13;
			with (instance_create(0, 0, obj_genericfade))
			{
				fade = 1.5;
				accel = 0.1;
				maxfade = 1.5;
				deccel = 0.1;
				color = c_white;
			}
		}
		break;
	case 15:
		bg.x -= 0.2;
		bg.y += 0.1;
		if _switch
		{
			instance_destroy(obj_introprop);
			layer_x("Backgrounds_4", 0);
			peppino = instance_create(0, 0, obj_introprop);
			peppino.sprite_index = spr_intro_styleshot1;
			peppino.depth = 0;
			scenebuffer = 100;
			scene++;
		}
		break;
	case 16:
		if (floor(peppino.image_index) == (peppino.image_number - 1))
			peppino.image_index = peppino.image_number - 1;
		if _switch
		{
			gustavo = instance_create(0, 300, obj_introprop);
			gustavo.sprite_index = spr_intro_styleshot2;
			gustavo.depth = -1;
			scenebuffer = 100;
			scene++;
		}
		break;
	case 17:
		if (floor(peppino.image_index) == (peppino.image_number - 1))
			peppino.image_index = peppino.image_number - 1;
		gustavo.y = lerp(gustavo.y, 0, 0.3);
		if _switch
		{
			instance_destroy(obj_introprop);
			layer_x("Backgrounds_4", 0);
			peppino = instance_create(-700, 386, obj_playerprop);
			peppino.alarm[0] = 1;
			peppino.sprite_index = spr_player_mach4;
			peppino.image_speed = 0.5;
			pizzaface = instance_create(-700, 200, obj_introprop);
			pizzaface.sprite_index = spr_pizzaface;
			pizzaface.image_speed = 0.35;
			gustavo = instance_create(room_width / 2, 386, obj_playerprop);
			gustavo.spr_palette = spr_ratmountpalette;
			gustavo.sprite_index = spr_intro_gustavomap;
			stick = instance_create(room_width * 0.55, 200, obj_introprop);
			stick.sprite_index = spr_intro_stick1;
			stick.image_speed = 0.35;
			scene++;
		}
		break;
	case 18:
		peppino.x += 14;
		pizzaface.x += 20;
		pizzaface.y = Wave(pizzaface.ystart - 30, pizzaface.ystart + 30, 3, 10);
		if gustavo.sprite_index == spr_intro_gustavomap
		{
			if (peppino.x >= (gustavo.x - 25))
			{
				instance_create(peppino.x + 16, peppino.y, obj_bangeffect);
				gustavo.sprite_index = spr_lonegustavo_hurt;
				gustavo.hsp = 8;
				gustavo.vsp = -11;
			}
		}
		else
		{
			with gustavo
			{
				x += hsp;
				y += vsp;
				if vsp < 20
					vsp += 0.5;
			}
		}
		if stick.sprite_index == spr_intro_stick1
		{
			stick.x += 2;
			stick.y = Wave(stick.ystart - 10, stick.ystart + 10, 1, 5);
			if (pizzaface.x >= (stick.x - 25))
			{
				instance_create(pizzaface.x + 16, pizzaface.y, obj_bangeffect);
				stick.sprite_index = spr_intro_stick2;
				stick.hsp = 8;
				stick.vsp = -11;
			}
		}
		else
		{
			with stick
			{
				x += hsp;
				y += vsp;
				if vsp < 20
					vsp += 0.5;
			}
		}
		if (peppino.x > (room_width + 200) && gustavo.y > (room_height + 300))
		{
			scene++;
			with (instance_create(0, 0, obj_genericfade))
			{
				fade = 0;
				accel = 0.1;
				maxfade = 2;
				deccel = 0.1;
				color = c_white;
			}
		}
		break;
	case 19:
		if _switch && !obj_genericfade.fadein
		{
			instance_destroy(obj_introprop);
			scene++;
			scenebuffer = 115;
			peppinobg = instance_create(0, 0, obj_introprop);
			peppinobg.sprite_index = spr_animeshot2;
			peppinobg.depth = 2;
			peppinobg.hspeed = -0.2;
			pizzaface = instance_create(0, 0, obj_introprop);
			pizzaface.hspeed = -0.2;
			pizzaface.sprite_index = spr_animeshot1;
			pizzaface.depth = 1;
			bg2 = instance_create(0, 0, obj_tiledintroprop);
			bg2.sprite_index = spr_animeshot3;
			bg2.depth = 5;
			bg2.hspeed = 0.6;
			layer_set_visible("Backgrounds_1", false);
			layer_set_visible("Backgrounds_2", false);
			layer_set_visible("Backgrounds_3", false);
			layer_set_visible("Backgrounds_4", false);
			layer_set_visible("Backgrounds_5", false);
			layer_set_visible("Backgrounds_6", false);
		}
		break;
	case 20:
		if _switch
		{
			instance_destroy(obj_introprop);
			scene++;
			scenebuffer = 140;
			peppino = instance_create(0, 0, obj_introprop);
			peppino.sprite_index = spr_animeshot4;
			peppino.hspeed = -0.6;
			peppino.depth = 0;
			bg = instance_create(0, 0, obj_tiledintroprop);
			bg.sprite_index = spr_animeshot5;
			bg.depth = 4;
			bg.hspeed = 0.6;
		}
		break;
	case 21:
		if _switch
		{
			instance_destroy(obj_introprop);
			scene++;
			scenebuffer = 40;
			bossdir = 1;
			bossarr = [spr_intro_unkown, spr_intro_noise, spr_intro_vigi];
			boss = instance_create(0, -540, obj_introprop);
			boss.sprite_index = spr_intro_pepperman;
		}
		break;
	case 22:
		boss.y = Approach(boss.y, 0, 25);
		if _switch && boss.y == 0
		{
			if (array_length(bossarr) > 0)
			{
				scenebuffer = 40;
				boss = instance_create(0, 540 * bossdir, obj_introprop);
				bossdir *= -1;
				boss.sprite_index = array_pop(bossarr);
			}
			else
			{
				scene++;
				scenebuffer = 150;
			}
		}
		break;
	case 23:
		if _switch
		{
			instance_destroy(obj_introprop);
			peppino = instance_create(0, 0, obj_introprop);
			peppino.sprite_index = spr_intro_punch;
			bg = instance_create(0, 0, obj_tiledintroprop);
			bg.sprite_index = spr_intro_peppinoversus;
			bg.vspeed = 3;
			scene++;
		}
		break;
	case 24:
		if (floor(peppino.image_index) == (peppino.image_number - 1))
		{
			instance_destroy(obj_introprop);
			title = instance_create(480, 270, obj_introprop);
			title.sprite_index = spr_intro_title;
			title.shake_mag = 8;
			bg = instance_create(0, 0, obj_introprop);
			bg.sprite_index = spr_intro_white;
			bg.image_xscale = 960 / 64;
			bg.image_yscale = 540 / 64;
			scene++;
			scenebuffer = 100;
		}
		break;
	case 25:
		title.x = title.xstart + irandom_range(-title.shake_mag, title.shake_mag);
		title.y = title.ystart + irandom_range(-title.shake_mag, title.shake_mag);
		if title.shake_mag > 0
			title.shake_mag -= 0.1;
		if _switch
			scene++;
		break;
	case 26:
		title.x = title.xstart;
		title.y = title.ystart;
		title.image_alpha = Approach(title.image_alpha, 0, 0.05);
		if title.image_alpha <= 0
		{
			scene++;
			scenebuffer = 80;
		}
		break;
	case 27:
		if _switch
		{
			with (instance_create(0, 0, obj_genericfade))
			{
				persistent = true;
				fade = 2;
				deccel = 0.1;
				color = c_white;
			}
			room_goto(Mainmenu);
		}
		break;
}
