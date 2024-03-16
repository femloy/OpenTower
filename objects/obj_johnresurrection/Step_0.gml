with obj_player
	state = states.titlescreen;
whitefade = Approach(whitefade, 0, 0.1);
var PLAYER_MOVESPEED = 5;
if !fadein
{
	switch state
	{
		case 0:
			var tx = obj_johnresurrection_gerome.x - 100;
			with obj_johnresurrection_peppino
			{
				sprite_index = obj_player1.spr_move;
				image_speed = 0.5;
				x = Approach(x, tx, PLAYER_MOVESPEED);
				if x == tx
				{
					other.state++;
					other.cutscenebuffer = 100;
					sprite_index = spr_player_idle;
					if !ispeppino
						sprite_index = spr_playerN_doiseintro1;
					image_speed = 0.35;
				}
			}
			break;
		
		case 1:
			if cutscenebuffer > 0
				cutscenebuffer--;
			else if !treasure
			{
				cutscenebuffer = 50;
				state = 2;
				with obj_johnresurrection_peppino
				{
					sprite_index = spr_player_idlefrown;
					if !ispeppino
					{
						sprite_index = spr_playerN_doiseintro2;
						other.cutscenebuffer = 100;
					}
					image_index = 0;
				}
			}
			else
			{
				state = 4;
				cutscenebuffer = 10;
				with obj_johnresurrection_peppino
				{
					hsp = -4;
					vsp = -5;
					sprite_index = obj_player1.spr_bump;
					image_speed = 0.35;
				}
				treasure_dir = 1;
				with (instance_create(obj_johnresurrection_peppino.x, obj_johnresurrection_peppino.y, obj_johnresurrection_treasure))
				{
					dir = -1;
					vsp_max -= 4;
					vsp = vsp_max * dir;
					image_index = other.treasure_index++;
				}
			}
			break;
		
		case 2:
			with obj_johnresurrection_peppino
			{
				if floor(image_index) == image_number - 1
				{
					if ispeppino
						image_index = image_number - 1;
					else if sprite_index == spr_playerN_doiseintro2
						sprite_index = spr_playerN_doiseintro3;
				}
			}
			if cutscenebuffer > 0
				cutscenebuffer--;
			else
				state++;
			break;
		
		case 3:
			with obj_johnresurrection_peppino
			{
				image_xscale = -1;
				x -= PLAYER_MOVESPEED;
				sprite_index = obj_player1.spr_move;
				image_speed = 0.5;
				if x < -200
					other.fadein = true;
			}
			break;
		
		case 4:
			with obj_johnresurrection_peppino
			{
				if (!fmod_event_instance_is_playing(other.snd))
					fmod_event_instance_play(other.snd);
				hsp = Approach(hsp, 0, 0.1);
				vsp += 0.5;
				x += hsp;
				y += vsp;
				if y > ystart
					y = ystart;
			}
			if cutscenebuffer > 0
				cutscenebuffer--;
			else if (treasure_index >= sprite_get_number(spr_treasure1))
			{
				state++;
				cutscenebuffer = 60;
			}
			else
			{
				with (instance_create(obj_johnresurrection_peppino.x, obj_johnresurrection_peppino.y, obj_johnresurrection_treasure))
				{
					dir = other.treasure_dir;
					vsp = dir * vsp_max;
					image_index = other.treasure_index++;
				}
				cutscenebuffer = 8;
				treasure_dir *= -1;
			}
			break;
		
		case 5:
			if cutscenebuffer > 0
				cutscenebuffer--;
			else
			{
				whitefade = 2;
				if obj_player1.ispeppino
				{
					state++;
					cutscenebuffer = 370;
					pizzaheadbuffer = 180;
					with obj_johnresurrection_gerome
						sprite_index = spr_johnresurrected_gerome1;
					with obj_johnresurrection_pillar
					{
						blackfade = 0;
						sprite_index = spr_johnresurrected_pillar2;
					}
					with obj_johnresurrection_peppino
						sprite_index = spr_player_idle;
				}
				else
				{
					state = 13;
					cutscenebuffer = 200;
					with obj_johnresurrection_pillar
					{
						blackfade = 0;
						sprite_index = spr_johnresurrected_pillarnoise;
					}
					with obj_johnresurrection_gerome
					{
						sprite_index = spr_johnresurrected_gerome1;
						image_index = 0;
						image_xscale = -1;
					}
					with obj_johnresurrection_peppino
						sprite_index = spr_noise_vulnerable2;
				}
			}
			break;
		
		case 6:
			if pizzaheadbuffer > 0
				pizzaheadbuffer--;
			else
			{
				with obj_johnresurrection_pizzahead
				{
					if sprite_index != spr_pizzahead_phase3_intro2
					{
						image_xscale *= -1;
						sprite_index = spr_pizzahead_phase3_intro2;
						image_index = 15;
					}
				}
			}
			if cutscenebuffer > 0
				cutscenebuffer--;
			else
			{
				state++;
				with obj_johnresurrection_pillar
				{
					sprite_index = spr_johnresurrected_pillar3;
					image_index = 0;
					hsp = 6;
				}
				shot = false;
			}
			break;
		
		case 7:
			with obj_johnresurrection_pillar
			{
				x += hsp;
				hsp = Approach(hsp, 0, 0.2);
				if (floor(image_index) == image_number - 1 && !other.shot)
				{
					other.shot = true;
					image_speed += 0.1;
					if image_speed > 2
					{
						other.state++;
						other.shot = false;
						image_speed = 0.35;
						sprite_index = spr_johnresurrected_pillar4;
						image_index = 0;
					}
				}
				else if floor(image_index) != image_number - 1
					other.shot = false;
			}
			break;
		
		case 8:
			with obj_johnresurrection_pillar
			{
				if (floor(image_index) >= 3 && !other.shot)
				{
					other.shot = true;
					other.state++;
					with obj_johnresurrection_pizzahead
					{
						repeat 3
						{
							with (create_debris(x, y, spr_slapstar))
								vsp = -irandom_range(5, 11);
						}
						repeat 5
						{
							with (create_debris(x, y, spr_baddiegibs))
								vsp = -irandom_range(5, 11);
						}
						with (instance_create(x, y, obj_explosioneffect))
							sprite_index = spr_bombexplosion;
						sprite_index = spr_pizzahead_phase3stunned;
						x = other.x + 64;
						y = other.y - 128;
						depth = 0;
						fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y);
					}
					with obj_camera
					{
						shake_mag = 5;
						shake_mag_acc = 5 / room_speed;
					}
				}
			}
			break;
		
		case 9:
			with obj_johnresurrection_pizzahead
			{
				y -= 20;
				if y < -400
				{
					y = -40;
					vsp = 0;
					hsp = 8;
					sprite_index = spr_johnresurrected_pizzaheaddark;
					other.state++;
				}
			}
			break;
		
		case 10:
			with obj_johnresurrection_pizzahead
			{
				x -= hsp;
				y += vsp;
				hsp = Approach(hsp, 0, 0.1);
				if vsp < 10
					vsp += 0.1;
				image_angle += 10;
				if y > 100
				{
					image_xscale = Approach(image_xscale, 0, 0.04);
					image_yscale = image_xscale;
					if (image_xscale <= 0 || y >= ((room_height / 2) + 120))
					{
						fmod_event_one_shot("event:/sfx/ending/star");
						image_xscale = 1;
						image_yscale = 1;
						sprite_index = spr_glint;
						image_index = 0;
						image_angle = 0;
						other.state++;
					}
				}
			}
			break;
		
		case 11:
			with obj_johnresurrection_pizzahead
			{
				if floor(image_index) == image_number - 1
				{
					other.state++;
					other.cutscenebuffer = 50;
					instance_destroy();
				}
			}
			break;
		
		case 12:
			if cutscenebuffer > 0
				cutscenebuffer--;
			else
			{
				state++;
				cutscenebuffer = 100;
				with obj_johnresurrection_pillar
					sprite_index = spr_johnresurrected_pillar2;
				with obj_johnresurrection_gerome
				{
					sprite_index = spr_johnresurrected_gerome2;
					image_index = 0;
					fmod_event_one_shot("event:/sfx/misc/cheers");
				}
				with obj_johnresurrection_peppino
					sprite_index = spr_player_smirk;
			}
			break;
		
		case 13:
			if cutscenebuffer > 0
				cutscenebuffer--;
			else
				fadein = true;
			break;
	}
}
else
{
	fade = Approach(fade, 1, 0.01);
	if (fade >= 1 && !instance_exists(obj_fadeout))
	{
		with obj_player
		{
			targetRoom = Creditsroom;
			targetDoor = "A";
		}
		instance_create(0, 0, obj_fadeout);
	}
}
