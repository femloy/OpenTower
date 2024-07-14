scr_menu_getinput();
index += 0.1;
switch state
{
	case states.titlescreen:
		currentselect = -1;
		if (!instance_exists(obj_noiseunlocked))
		{
			jumpscarecount++;
			if ((keyboard_check_pressed(vk_anykey) || scr_checkanygamepad(obj_inputAssigner.player_input_device[0]) != -4 || scr_checkanystick(obj_inputAssigner.player_input_device[0])) && (!instance_exists(obj_mainmenu_jumpscare)))
			{
				state = states.transition;
				currentselect = -1;
				visualselect = -1;
				darkcount = 7;
				dark = false;
				darkbuffer = 5;
				jumpscarecount = 0;
				fmod_event_one_shot("event:/sfx/ui/lightswitch");
				with obj_music
					fmod_event_instance_set_parameter(music.event, "state", 1, true);
			}
			if (jumpscarecount > 2400 && !instance_exists(obj_mainmenu_jumpscare))
			{
				instance_create(480, 270, obj_mainmenu_jumpscare);
				fmod_event_one_shot("event:/sfx/enemies/jumpscare");
			}
		}
		break;
	
	case states.transition:
		if darkbuffer > 0
			darkbuffer--;
		else
		{
			dark = !dark;
			if darkcount > 0
			{
				darkcount--;
				if dark
					darkbuffer = 2 + irandom(3);
				else
					darkbuffer = 6 + irandom(5);
				if darkcount <= 0
				{
					dark = false;
					darkbuffer = 40;
				}
			}
			else
			{
				alarm[2] = showbuffer_max;
				currentselect = 0;
				visualselect = 0;
				dark = false;
				state = states.normal;
				sprite_index = spr_titlepep_forwardtoleft;
				image_index = 0;
			}
		}
		break;
	
	case states.normal:
		if (key_start && optionbuffer <= 0 && !instance_exists(obj_option))
		{
			with (instance_create(0, 0, obj_option))
				backbuffer = 2;
			break;
		}
		else if instance_exists(obj_option)
		{
			quitbuffer = 3;
			break;
		}
		else
		{
			move = key_left2 + key_right2;
			if noise_unlocked
			{
				var p = 5;
				var _move_v = key_down2 - key_up2;
				if _move_v != 0
				{
					var c = charselect;
					charselect += _move_v;
					charselect = clamp(charselect, 0, 2);
					if charselect == 2 && !swap_unlocked
						charselect = 1;
					if charselect != c
					{
						game_icon_y = p * _move_v;
						game_icon_buffer = 8;
						game_icon_index = 0;
						if _move_v > 0
							fmod_event_one_shot("event:/sfx/ui/switchcharup");
						else
							fmod_event_one_shot("event:/sfx/ui/switchchardown");
					}
					var _noise = shownoise
					if charselect == 0
					{
						shownoise = false;
						showswap = false;
					}
					else
					{
						shownoise = true;
						if charselect == 2
							showswap = true;
						else
							showswap = false;
					}
					if _noise != shownoise
					{
						with obj_menutv
						{
							if selected
							{
								state = states.transition;
								sprite_index = transspr;
								image_index = 0;
							}
						}
					}
				}
			}
			if ((sprite_index != spr_titlepep_punch && sprite_index != spr_titlepep_angry) || move != 0)
			{
				if move != 0
					angrybuffer = 0;
				currentselect += move;
				currentselect = clamp(currentselect, 0, 2);
				if (currentselect != visualselect && (sprite_index == spr_titlepep_left || sprite_index == spr_titlepep_middle || sprite_index == spr_titlepep_right))
				{
					visualselect = Approach(visualselect, currentselect, 1);
					alarm[2] = showbuffer_max;
					image_index = 0;
					if visualselect == 0 && sprite_index == spr_titlepep_middle
						sprite_index = spr_titlepep_middletoleft;
					if visualselect == 1 && sprite_index == spr_titlepep_left
						sprite_index = spr_titlepep_lefttomiddle;
					if visualselect == 2 && sprite_index == spr_titlepep_middle
						sprite_index = spr_titlepep_middletoright;
					if visualselect == 1 && sprite_index == spr_titlepep_right
						sprite_index = spr_titlepep_righttomiddle;
				}
				if (floor(image_index) == image_number - 1)
				{
					switch sprite_index
					{
						case spr_titlepep_forwardtoleft:
						case spr_titlepep_middletoleft:
							sprite_index = spr_titlepep_left;
							break;
						case spr_titlepep_lefttomiddle:
						case spr_titlepep_righttomiddle:
							sprite_index = spr_titlepep_middle;
							break;
						case spr_titlepep_middletoright:
							sprite_index = spr_titlepep_right;
							break;
					}
				}
			}
			else if sprite_index == spr_titlepep_angry
			{
				y = ystart;
				if angrybuffer > 0
					angrybuffer--;
				else
				{
					sprite_index = savedsprite;
					switch sprite_index
					{
						case spr_titlepep_forwardtoleft:
						case spr_titlepep_middletoleft:
							sprite_index = spr_titlepep_left;
							break;
						case spr_titlepep_lefttomiddle:
						case spr_titlepep_righttomiddle:
							sprite_index = spr_titlepep_middle;
							break;
						case spr_titlepep_middletoright:
							sprite_index = spr_titlepep_right;
							break;
					}

					image_index = savedindex;
					image_speed = 0.35;
				}
			}
			else
			{
				if vsp < 20
					vsp += 0.5;
				y += vsp;
				if y >= ystart && vsp > 0
				{
					y = ystart;
					vsp = 0;
				}
			}
			if key_jump
			{
				state = states.victory;
				with obj_menutv
				{
					if trigger == other.currentselect
					{
						fmod_event_instance_stop(obj_music.music.event, true);
						if !other.shownoise
							fmod_event_one_shot("event:/sfx/ui/fileselect");
						else
							fmod_event_one_shot("event:/sfx/ui/fileselectN");
						state = states.victory;
						sprite_index = confirmspr;
					}
				}
				alarm[0] = 250;
				if shownoise
				{
					alarm[3] = 100;
					alarm[4] = 5;
					timermax = 15;
					explosionsnum = 1;
					fmod_event_one_shot("event:/sfx/ui/menuexplosions");
				}
				fmod_event_one_shot("event:/sfx/misc/collectpizza");
				switch currentselect
				{
					case 0:
						sprite_index = spr_titlepep_left;
						break;
					case 1:
						sprite_index = spr_titlepep_middle;
						break;
					case 2:
						sprite_index = spr_titlepep_right;
						break;
				}
			}
			else if key_quit2
			{
				if quitbuffer <= 0
				{
					state = states.ending;
					exitselect = 1;
					switch currentselect
					{
						case 0:
							sprite_index = spr_titlepep_left;
							break;
						case 1:
							sprite_index = spr_titlepep_middle;
							break;
						case 2:
							sprite_index = spr_titlepep_right;
							break;
					}
				}
			}
			else if (key_delete2 && (global.game[currentselect].started || global.gameN[currentselect].started))
			{
				deletebuffer = 0;
				state = states.bombdelete;
				deleteselect = 1;
				fmod_event_one_shot_3d("event:/sfx/voice/pig", 480, 270);
				switch currentselect
				{
					case 0:
						sprite_index = spr_titlepep_left;
						break;
					case 1:
						sprite_index = spr_titlepep_middle;
						break;
					case 2:
						sprite_index = spr_titlepep_right;
						break;
				}
			}
			break;
		}
	
	case states.bombdelete:
		deleteselect += key_left2 + key_right2;
		deleteselect = clamp(deleteselect, 0, 1);
		if key_jump2
			deletebuffer++;
		else
			deletebuffer = 0;
		if ((deleteselect == 1 && key_jump) || (deleteselect == 0 && deletebuffer >= 120))
		{
			if deleteselect == 0
			{
				var file = concat(get_save_folder(), "/saveData", currentselect + 1, !shownoise ? ".ini" : "N.ini");
				if file_exists(file)
					file_delete(file);
				if !shownoise
					global.game[currentselect] = game_empty();
				else
					global.gameN[currentselect] = game_empty();
				fmod_event_one_shot_3d("event:/sfx/misc/explosion", 480, 270);
				fmod_event_one_shot_3d("event:/sfx/mort/mortdead", 480, 270);
				with obj_menutv
				{
					if trigger == other.currentselect && sprite_index == selectedspr
						sprite_index = transspr;
				}
				with obj_camera
				{
					shake_mag = 4;
					shake_mag_acc = 5 / room_speed;
				}
			}
			state = states.normal;
		}
		break;
	
	case states.ending:
		exitselect += key_left2 + key_right2;
		exitselect = clamp(exitselect, 0, 1);
		if key_jump
		{
			if exitselect == 0
				game_end();
			else
				state = states.normal;
		}
		break;
}

if vsp < 20
	vsp += 0.5;
y += vsp;
if y >= ystart && vsp > 0
{
	y = ystart;
	vsp = 0;
}
if quitbuffer > 0
	quitbuffer--;
if state == states.bombdelete && deletebuffer > 0
{
	if (!fmod_event_instance_is_playing(bombsnd))
		fmod_event_instance_play(bombsnd);
}
else
	fmod_event_instance_stop(bombsnd, false);
if optionbuffer > 0
	optionbuffer--;
if state != states.titlescreen && state != states.transition
	extrauialpha = Approach(extrauialpha, 1, 0.1);
if currentselect != -1
{
	pep_game = menu_get_game(currentselect, 1);
	noise_game = menu_get_game(currentselect, 0);
	if state != states.titlescreen && state != states.transition
	{
		var a = floor(abs(pep_percvisual - pep_game.percentage) / 10) + 1;
		pep_percvisual = Approach(pep_percvisual, pep_game.percentage, a);
		pep_game.percvisual = pep_percvisual;
		
		var a = floor(abs(noise_percvisual - noise_game.percentage) / 10) + 1;
		noise_percvisual = Approach(noise_percvisual, noise_game.percentage, a);
		noise_game.percvisual = noise_percvisual;
	}
}
var acc = 2;
game_icon_index += 0.1;
if game_icon_y != 0
	game_icon_index = 0;
if game_icon_buffer > 0
	game_icon_buffer--;
else
	game_icon_y = 0;
if shownoise
{
	noise_alpha = Approach(noise_alpha, 1, acc);
	pep_alpha = Approach(pep_alpha, 0, acc);
}
else
{
	noise_alpha = Approach(noise_alpha, 0, acc);
	pep_alpha = Approach(pep_alpha, 1, acc);
}
if currentselect != -1
{
	pep_game.alpha = pep_alpha;
	noise_game.alpha = noise_alpha;
}
with obj_menutv
{
	if trigger == other.currentselect
		selected = true;
	else
		selected = false;
}
if gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], gp_shoulderrb)
{
	punch_x = x + irandom_range(-40, 40);
	punch_y = y + irandom_range(-30, 30);
	event_user(0);
}
