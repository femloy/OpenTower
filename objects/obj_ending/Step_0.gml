scr_menu_getinput();
if state == 3
	showtext = true;
else
	showtext = false;
var bg_arr = ["Backgrounds_sky2"];
for (var i = 0; i < array_length(bg_arr); i++)
{
	var b = bg_arr[i];
	var bg = layer_background_get_id(layer_get_id(b));
	layer_background_alpha(bg, bgalpha);
}
bgalpha = Approach(bgalpha, 0, 0.0003);
switch state
{
	case 0:
		if (!fmod_event_instance_is_playing(snd))
			fmod_event_instance_play(snd);
		var ty = room_height + 200;
		with towerID
		{
			hitY = Approach(hitY, ty, 1);
			if hitY > ystart
				y = hitY + irandom_range(-1, 1);
			else
				y = ystart + irandom_range(-1, 1);
			x = xstart + irandom_range(-1, 1);
			if other.puffbuffer > 0
				other.puffbuffer--;
			else if hitY <= room_height
			{
				other.puffbuffer = 10 + irandom(15);
				with (instance_create(x + irandom_range(-48, 48), 259 + irandom_range(-16, 16), obj_endingeffect))
				{
					sprite_index = spr_towerending_puff;
					depth = choose(-4, -6);
				}
			}
		}
		if towerID.y == ty
		{
			state++;
			whitefadein = true;
		}
		break;
	
	case 1:
		if whitefadein
		{
			whitefade = Approach(whitefade, 2, 0.05);
			if whitefade >= 2
				room = Johnresurrectionroom;
		}
		break;
	
	case 2:
		if (!instance_exists(obj_endingcard) && !instance_exists(obj_noisecreditmanager))
		{
			if (credits_pos < array_length(credits))
			{
				b = credits[credits_pos++];
				if (b[1] == noone || !instance_exists(obj_credits))
				{
					with (instance_create(0, 0, obj_endingcard))
					{
						if b[0] == noone
						{
							showsprite = false;
							image_alpha = 1;
						}
						image_index = b[0];
						text = b[1];
						if text == noone
						{
							depth = -50;
							alarm[0] = 1200;
							instance_create_unique(0, 0, obj_credits);
						}
					}
				}
				else
					credits_pos--;
			}
			else
				state++;
		}
		if spawn_buffer > 0
			spawn_buffer--;
		else
		{
			spawn_buffer = 180 + irandom_range(-30, 40);
			repeat (irandom(3) + 1)
			{
				with (instance_create(room_width + 300 + irandom(100), 386, obj_endingprop))
				{
					sprite_index = other.spawn_arr[irandom(array_length(other.spawn_arr) - 1)];
					spd = irandom_range(3, 6);
					image_speed = 0.35;
					if (sprite_index == spr_pepbat_move || sprite_index == spr_ufolive || sprite_index == spr_kentukybomber_move || sprite_index == spr_ghoul_attack || sprite_index == spr_ancho)
						y = irandom_range(160, 288);
					if sprite_index == spr_tank_walk
						y++;
					if sprite_index == spr_ghostknight_move
						image_alpha = 0.5;
				}
			}
		}
		break;
	
	case 3:
		var _continue = false;
		with obj_music
		{
			if (music != -4 && !fmod_event_instance_is_playing(music.event))
				_continue = true;
		}
		if key_jump
			_continue = true;
		if _continue
			state++;
		if spawn_buffer > 0
			spawn_buffer--;
		else
		{
			spawn_buffer = 180 + irandom_range(-30, 40);
			repeat (irandom(3) + 1)
			{
				with (instance_create(room_width + 300 + irandom(100), 386, obj_endingprop))
				{
					sprite_index = other.spawn_arr[irandom(array_length(other.spawn_arr) - 1)];
					spd = irandom_range(3, 6);
					image_speed = 0.35;
					if (sprite_index == spr_pepbat_move || sprite_index == spr_ufolive || sprite_index == spr_kentukybomber_move || sprite_index == spr_ghoul_attack || sprite_index == spr_ancho)
						y = irandom_range(160, 288);
					if sprite_index == spr_tank_walk
						y++;
					if sprite_index == spr_ghostknight_move
						image_alpha = 0.5;
				}
			}
		}
		break;
	
	case 4:
		fade = Approach(fade, 2, 0.05);
		if fade >= 2
		{
			state++;
			with (instance_create(0, 0, obj_introprop))
			{
				sprite_index = spr_theendshot;
				if !obj_player1.ispeppino
					sprite_index = spr_theendshotN;
				if global.swapmode
					sprite_index = spr_theendshotSN;
				depth = other.depth + 1;
			}
			buffer = 100;
		}
		break;
	
	case 5:
		fade = Approach(fade, 0, 0.05);
		if buffer > 0
			buffer--;
		else if (fade <= 0 && (keyboard_check_pressed(vk_anykey) || scr_checkanygamepad(obj_inputAssigner.player_input_device[0]) != -4))
			state++;
		break;
	
	case 6:
		fade = Approach(fade, 2, 0.05);
		if fade >= 2
		{
			state++;
			instance_create(0, 0, obj_endingrank);
			instance_destroy(obj_endingprop);
			instance_destroy(obj_introprop);
		}
		break;
	
	case 7:
		break;
	
	case 8:
		if obj_player1.key_jump
		{
			with obj_player
				state = states.titlescreen;
			room_goto(Realtitlescreen);
		}
		break;
}
