if room == rm_editor
	exit;
if (point_in_camera(x, y, view_camera[0]) && activated == 0)
{
	activated = true;
	scr_fmod_soundeffect(global.snd_fakesanta, x, y);
}
if activated == 1
{
	switch state
	{
		case states.stun:
			scr_enemy_stun();
			break;
		case states.hit:
			scr_enemy_hit();
			break;
		case states.grabbed:
			scr_enemy_grabbed();
			break;
		case states.pummel:
			scr_enemy_pummel();
			break;
		case states.staggered:
			scr_enemy_staggered();
			break;
	}
	if state == states.walk
	{
		highest_y = -250;
		var _instY = collision_line(obj_player1.x, obj_player1.y, obj_player1.x, obj_player1.y - 270, obj_solid, false, true);
		if _instY != -4
			highest_y = -abs(obj_player1.y - (_instY.y + _instY.sprite_height)) - 32;
		if random_buffer > 0
			random_buffer--;
		else
		{
			var c = 0;
			with obj_baddie
			{
				if santaID == other.id
					c++;
			}
			if c < 3
			{
				var _col = collision_line(x, y, obj_player1.x, obj_player1.y, obj_solid, false, true);
				if sprite_index != spr_fakesanta_dropenemy
				{
					sprite_index = spr_fakesanta_dropenemy;
					image_index = 0;
					shot = false;
				}
				else
				{
					if (floor(image_index) == 8)
					{
						if !shot
						{
							image_index = 8;
							if (!place_meeting(x, y, obj_solid) && !place_meeting(x, y, obj_slope) && _col == noone)
							{
								shot = true;
								var n = irandom(array_length(content) - 1);
								fmod_event_one_shot_3d("event:/sfx/enemies/presentfall", x, y);
								with (instance_create(x, y + 50, obj_fakesantapresent))
								{
									baddieID = other.id;
									content = other.content[n];
								}
							}
						}
					}
					if floor(image_index) == image_number - 1
					{
						sprite_index = spr_fakesanta_idle;
						random_buffer = random_max;
					}
				}
			}
			else
			{
				if sprite_index == spr_fakesanta_dropenemy
					sprite_index = spr_fakesanta_idle;
				random_buffer = random_max;
			}
		}
		hsp = Wave(-288, 288, 7, 0);
		vsp = Wave(highest_y + 78, highest_y + 170, 1, 0);
		x = lerp(x, obj_player1.x + hsp, 0.08);
		y = lerp(y, obj_player1.y + obj_player1.vsp + vsp, 0.04);
	}
	else if state == states.punch
	{
		var ii = floor(image_index);
		hsp = 0;
		vsp = 0;
		if !shot
		{
		}
		if (ii == image_number - 1)
			state = states.walk;
	}
	if flash == 1 && alarm[2] <= 0
		alarm[2] = 0.15 * room_speed;
	if state != states.grabbed
		depth = 0;
	if state != states.stun
		thrown = false;
	if (fmod_event_instance_is_playing(global.snd_fakesanta))
		fmod_event_instance_set_3d_attributes(global.snd_fakesanta, x, y);
	depth = 150;
}
