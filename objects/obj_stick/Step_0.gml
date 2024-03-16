if (sprite_index != spr_stick_helicopter && (sprite_index != spr_stick_leave || image_index < 3) && sprite_index != spr_noisettestick_helicopter)
{
	fmod_event_instance_stop(global.snd_mrstickhat, true);
	scr_collide();
}
else
{
	if (!fmod_event_instance_is_playing(global.snd_mrstickhat))
		fmod_event_instance_play(global.snd_mrstickhat);
	fmod_event_instance_set_3d_attributes(global.snd_mrstickhat, x, y);
}
switch state
{
	case states.fall:
		if !noisette
		{
			if sprite_index == spr_stick_helicopter
			{
				hsp = 0;
				vsp = 0;
				y += 5;
				if (abs(y - obj_stick_target.y) <= 100)
				{
					sprite_index = spr_stick_fall;
					image_index = 0;
				}
			}
			else if sprite_index == spr_stick_fall
			{
				if grounded && vsp > 0
				{
					sprite_index = spr_stick_land;
					image_index = 0;
				}
			}
			else if floor(image_index) == image_number - 1
				state = states.normal;
		}
		else if sprite_index == spr_noisettestick_helicopter
		{
			hsp = 0;
			vsp = 0;
			y += 5;
			if (y > obj_stick_target.y - 100 && place_meeting(x, y, obj_solid))
			{
				while (place_meeting(x, y, obj_solid))
					y--;
				sprite_index = spr_noisettestick_land;
				image_index = 0;
				state = states.normal;
			}
		}
		break;
	
	case states.normal:
		if arrowID == noone
			arrowID = scr_create_uparrowhitbox();
		if !noisette
		{
			if sprite_index != spr_stick_idleanim1 && sprite_index != spr_stick_idleanim2 && sprite_index != spr_stick_idleanim3
				sprite_index = spr_stick_idle;
			else if floor(image_index) == image_number - 1
				sprite_index = spr_stick_idle;
			if sprite_index == spr_stick_idle
			{
				idle++;
				if obj_player1.x != x
					image_xscale = sign(obj_player1.x - x);
			}
			if idle >= 200
			{
				if (!instance_exists(obj_titlecard))
					fmod_event_one_shot_3d("event:/sfx/voice/mrstick", x, y);
				sprite_index = choose(spr_stick_idleanim1, spr_stick_idleanim2, spr_stick_idleanim3);
				image_index = 0;
				idle = 0;
			}
		}
		else
		{
			if (sprite_index == spr_noisettestick_land && floor(image_index) == image_number - 1)
				sprite_index = spr_noisettestick_idle;
			image_xscale = -1;
		}
		if (!drawing && place_meeting(x, y, obj_player))
			drawing = true;
		else if (drawing && !place_meeting(x, y, obj_player))
			drawing = false;
		if (drawing && obj_player1.key_up && (global.pigtotal - global.pigreduction) >= maxscore)
		{
			fmod_event_one_shot_3d("event:/sfx/misc/kashing", x, y);
			instance_destroy(arrowID);
			obj_stick_forsale.visible = false;
			ini_open_from_string(obj_savesystem.ini_str);
			ini_write_real(save, "unlocked", true);
			ini_write_real(save, "reduction", maxscore);
			global.pigreduction += maxscore;
			obj_savesystem.ini_str = ini_close();
			state = states.jump;
			sprite_index = spr_stick_takemoney1;
			image_index = 0;
			shot = false;
			drawing = false;
			if noisette
			{
				sprite_index = spr_noisettestick_takemoney1;
				buffer = 80;
				wet_buffer = 0;
				fmod_event_one_shot_3d("event:/sfx/noisette/voice1", x, y);
			}
			gamesave_async_save();
			with obj_player
			{
				hsp = 0;
				vsp = 0;
				sprite_index = spr_idle;
				image_speed = 0.35;
				state = states.actor;
				xscale = -other.image_xscale;
				if other.noisette
				{
					hsp = -4;
					xscale = 1;
					sprite_index = spr_bump;
				}
			}
		}
		break;
	case states.jump:
		if (shot || noisette)
		{
			with obj_player1
				hsp = Approach(hsp, 0, 0.1);
		}
		if sprite_index == spr_noisettestick_takemoney1
		{
			if obj_player1.hsp == 0
			{
				with obj_player1
					sprite_index = spr_idle;
				if buffer > 0
					buffer--;
				else
				{
					sprite_index = spr_noisettestick_takemoney2;
					if obj_player1.ispeppino
					{
						fmod_event_one_shot_3d("event:/sfx/noisette/voice2", x, y);
						sprite_index = spr_noisettestick_helicopterstart;
						image_index = 0;
						fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
					}
				}
			}
		}
		else if sprite_index == spr_noisettestick_takemoney2
		{
			var tx = obj_player1.x + (obj_player1.xscale * 16);
			x = lerp(x, tx, 0.07);
			if (abs(x - tx) <= 15)
			{
				if wet_buffer > 0
					wet_buffer--;
				else
				{
					wet_buffer = 2;
					repeat (random(2) + 1)
						create_debris(obj_player1.x + ((tx - obj_player1.x) / 2), y + 10, spr_waterdrop);
				}
				if !shot
				{
					fmod_event_instance_play(kiss_snd);
					fmod_event_instance_set_3d_attributes(kiss_snd, x, y);
					with obj_player1
						sprite_index = spr_bump;
					shot = true;
					buffer = 150;
					instance_create(obj_player1.x + ((tx - obj_player1.x) / 2), y, obj_noisetteheart);
				}
			}
			if buffer == 10
				fmod_event_instance_set_parameter(kiss_snd, "state", 1, true);
			if shot && buffer > 0
				buffer--;
			else if shot
			{
				fmod_event_one_shot_3d("event:/sfx/noisette/voice2", x, y);
				sprite_index = spr_noisettestick_helicopterstart;
				image_index = 0;
				fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
				with obj_player1
				{
					hsp = -xscale * 4;
					sprite_index = spr_bump;
				}
			}
		}
		else if sprite_index == spr_noisettestick_helicopterstart
		{
			if (floor(image_index) == image_number - 1)
				sprite_index = spr_noisettestick_helicopter;
		}
		else if sprite_index == spr_stick_takemoney1
		{
			if (floor(image_index) >= 16 && !shot)
			{
				shot = true;
				fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
				with obj_player1
				{
					hsp = -xscale * 4;
					sprite_index = spr_bump;
				}
			}
			if (floor(image_index) == image_number - 1)
			{
				image_xscale *= -1;
				sprite_index = spr_stick_takemoney2;
				image_index = 0;
				fmod_event_one_shot_3d("event:/sfx/voice/mrsticklaugh", x, y);
			}
		}
		else if sprite_index == spr_stick_takemoney2
		{
			hsp = image_xscale * 4;
			if (abs(x - xstart) >= 200 || (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_slope)))
			{
				hsp = 0;
				sprite_index = spr_stick_leave;
				image_index = 0;
			}
		}
		else if sprite_index == spr_stick_leave
		{
			vsp = 0;
			if (floor(image_index) >= 10)
				y -= 4;
			if (floor(image_index) == image_number - 1)
				sprite_index = spr_stick_helicopter;
		}
		else
		{
			vsp = 0;
			y -= 8;
			if (y <= (camera_get_view_y(view_camera[0]) - 150) && instance_exists(obj_stick_forsale))
			{
				with obj_stick_forsale
				{
					first = true;
					unlocked = true;
					with (instance_create(x, y, obj_stick_gateprop))
					{
						targetRoom = other.targetRoom;
						if room != tower_5
						{
							group_arr = other.group_arr;
							sprite_index = other.gate_sprite;
							bgsprite = other.bgsprite;
						}
						else
							sprite_index = spr_pizzafacedoor;
						depth = 250;
						y_to = other.y;
						y += sprite_get_height(sprite_index);
					}
					instance_destroy();
				}
				with obj_player1
				{
					state = states.normal;
					landAnim = false;
				}
			}
			if (y <= -200 && !instance_exists(obj_stick_forsale))
				instance_destroy();
		}
		break;
}
if noisette
	image_xscale = -1;
money_y = Wave(-5, 5, 2, 2);
