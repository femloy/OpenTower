fade = Approach(fade, 1, 0.03);
if fade2start
	fade2 = Approach(fade2, 1, 0.06);
with obj_player1
{
	image_speed = 0.35;
	if ispeppino
	{
		switch other.state
		{
			case states.jump:
				if (sprite_index == spr_player_outofpizza1 && floor(image_index) == image_number - 1)
					sprite_index = spr_player_outofpizza2;
				hsp = deathspeed * -xscale;
				if (place_meeting(x + sign(hsp), y, obj_solid))
				{
					fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
					xscale *= -1;
					instance_create(x + (xscale * 20), y, obj_bangeffect);
				}
				if grounded && vsp > 0
				{
					image_index = 0;
					sprite_index = spr_player_outofpizza3;
					other.state = states.normal;
					other.alarm[0] = 200;
					other.alarm[2] = 150;
				}
				break;
		
			case states.normal:
				if (sprite_index == spr_player_outofpizza3 && floor(image_index) == image_number - 1)
					sprite_index = spr_player_outofpizza4;
				hsp = deathspeed * -xscale;
				deathspeed = Approach(deathspeed, 0, 0.1);
				break;
		}
	}
	else
	{
		switch other.state
		{
			case states.jump:
				if (sprite_index == spr_playerN_bossdeath1 && floor(image_index) == image_number - 1)
					sprite_index = spr_playerN_bossdeath1loop;
				hsp = deathspeed * -xscale;
				vsp = targetvsp;
				if (place_meeting(x + sign(hsp), y, obj_solid))
				{
					fmod_event_one_shot_3d("event:/sfx/pep/bump", x, y);
					xscale *= -1;
					instance_create(x + (xscale * 20), y, obj_bumpeffect);
				}
				targetvsp = lerp(targetvsp, -1, 0.15);
				deathspeed = Approach(deathspeed, 0.5, 0.25);
				if (abs(hsp) <= 5)
				{
					if deathbuffer > 0
						deathbuffer--;
					else
					{
						vsp = -3;
						fmod_event_instance_set_parameter(snd_bossdeathN, "state", 1, true);
						other.state = states.fall;
						sprite_index = spr_playerN_bossdeath2;
						image_index = 0;
					}
				}
				break;
			
			case states.fall:
				vsp += 0.5;
				if floor(image_index) == image_number - 1
					image_index = image_number - 1;
				if grounded && vsp > 0
				{
					hsp = 0;
					other.state = states.normal;
					other.alarm[0] = 100;
					other.alarm[2] = 50;
				}
				break;
			
			case states.normal:
				if floor(image_index) == image_number - 1
					image_index = image_number - 1;
				break;
		}
	}
}
