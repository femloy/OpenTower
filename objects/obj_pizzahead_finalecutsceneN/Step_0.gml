switch state
{
	case states.normal:
		if buffer > 0
			buffer--;
		else
		{
			state++;
			noise.sprite_index = spr_playerN_finalattack2;
			noise.image_index = 0;
			pizzahead.image_xscale = -1;
			pizzahead.sprite_index = spr_pizzahead_phase3_intro3;
			pizzahead.image_index = 1;
			fmod_event_one_shot("event:/sfx/playerN/finale_outbomb");
			bomb = instance_create(noise.x, noise.y, obj_finaleN_prop);
			bomb.sprite_index = spr_playerN_giantbomb;
			bomb.depth = 10;
			bomb.visible = false;
			buffer = 100;
		}
		break;
	
	case states.revolver:
		if (floor(noise.image_index) == noise.image_number - 1)
			noise.image_index = noise.image_number - 4;
		
		if (floor(noise.image_index) <= 1)
			bomb.y = noise.y - 11;
		else if (floor(noise.image_index) == 2)
			bomb.y = noise.y - 53;
		else
			bomb.y = noise.y - 46;
		
		if (floor(noise.image_index) == 0)
			bomb.visible = false;
		else
			bomb.visible = true;
		
		if buffer > 0
			buffer--;
		else
		{
			state++;
			fmod_event_one_shot("event:/sfx/playerN/giantbombthrow");
			noise.sprite_index = spr_playerN_finalattack3;
			noise.image_index = 0;
			if global.swapmode
			{
				peppinoID.sprite_index = spr_player_move;
				peppinoID.image_xscale = -1;
				peppinoID.image_index = 0;
				peppinoID.hsp = -6;
			}
			bomb.vsp = -11;
			bomb.hsp = 2.5;
			bomb.count = 0;
			bomb.grav = 0.2;
			whitefade = -0.5;
		}
		break;
	
	case states.dynamite:
		if (floor(noise.image_index) == noise.image_number - 1)
			noise.image_index = noise.image_number - 1;
		whitefade = Approach(whitefade, 1, 0.009);
		with bomb
		{
			x += hsp;
			y += vsp;
			if vsp > 0 && alarm[0] == -1
			{
				alarm[0] = 12 - min(floor(count), 8);
				count++;
			}
			if vsp > 0
				grav = Approach(grav, 0.1, 0.005);
			if vsp < 10
				vsp += grav;
			if (vsp > 0 && y > 400 && place_meeting(x, y + 1, obj_solid))
			{
				with other
				{
					state++;
					pizzaheadshot = instance_create(0, 0, obj_finaleN_prop);
					pizzaheadshot.sprite_index = bg_pizzaheadshotN;
					pizzaheadshot.depth = -100;
					pizzaheadshot.image_speed = 1;
					fmod_event_instance_play(pizzaheadshot_snd);
					with obj_music
					{
						if music != noone
							fmod_event_instance_stop(music.event, false);
					}
				}
				layer_set_visible("Backgrounds_rain", false);
			}
		}
		break
	case states.boots:
		shake = Approach(shake, shake_max, 0.1);
		if (floor(pizzaheadshot.image_index) < 24)
			whitefade = Approach(whitefade, 0, 0.05);
		if (floor(pizzaheadshot.image_index) >= 24)
		{
			whitefadeaccel = (sprite_get_speed(4127) / 60) / (sprite_get_number(bg_pizzaheadshotN) - pizzaheadshot.image_index);
			if whitefade <= 1
				whitefade += whitefadeaccel;
		}
		if (floor(pizzaheadshot.image_index) == pizzaheadshot.image_number - 1)
		{
			instance_destroy(pizzaheadshot);
			with obj_music
			{
				if music != noone
					fmod_event_instance_stop(music.event, true);
			}
			bg1.visible = true;
			bg2.visible = true;
			bg3.visible = true;
			bg4.visible = true;
			towershot.visible = true;
			buffer = 90;
			state++;
			shake = 0;
			whitefade = 1;
		}
		break;
	
	case states.grabbed:
		whitefade = Approach(whitefade, 0, 0.05);
		if buffer > 0
			buffer--;
		else
		{
			fmod_event_one_shot("event:/sfx/playerN/finale_explosion");
			buffer = 120;
			state++;
			towershot.sprite_index = bg_towershotN;
			shake = shake_max;
		}
		break;
	
	case states.tumble:
		if buffer > 0
			buffer--;
		else if whitefade <= 1
			whitefade += 0.07;
		else
		{
			with (instance_create(0, 0, obj_pizzahead_whitefade))
			{
				persistent = true;
				whitefade = 1.3;
				deccel = 0.005;
			}
			room = boss_pizzafacehub;
		}
		break;
}

bg1.x += bg1.hsp;
bg2.x += bg2.hsp;
bg3.x += bg3.hsp;
if global.swapmode
{
	with peppinoID
	{
		x += hsp;
		y += vsp;
	}
}
with obj_camera
{
	shake_mag = other.shake;
	shake_mag_acc = 10 / room_speed;
}
if pizzahead.sprite_index == spr_pizzahead_phase3_intro3 && pizzahead.image_index >= 21
	pizzahead.image_index = 2;
