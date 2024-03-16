image_speed = 0.35;
if trashbuffer > 0
	trashbuffer--;
switch state
{
	case states.normal:
		with obj_player
		{
			if (other.state == states.normal && state != states.trashjumpprep && other.trashbuffer <= 0 && place_meeting(x, y, other))
			{
				scr_fmod_soundeffect(global.snd_trashjump1, other.x, other.y);
				state = states.trashjumpprep;
				sprite_index = spr_player_trashstart;
				gravesurfingjumpbuffer = 0;
				image_index = 0;
				xscale = other.image_xscale;
				other.shot = false;
				other.playerid = id;
				other.state = states.trashjumpprep;
				other.sprite_index = spr_trash_flingstart;
				other.image_index = 0;
			}
		}
		break;
	
	case states.trashjumpprep:
		with playerid
		{
			if (state == states.trashjumpprep && floor(image_index) == image_number - 1)
				image_index = image_number - 3;
		}
		if !shot
		{
			playerid.x = x;
			playerid.hsp = 0;
			playerid.vsp = 0;
			switch image_index
			{
				case 0:
					playerid.y = y - 56;
					break;
				case 1:
					playerid.y = y - 53;
					break;
				case 2:
					playerid.y = y - 48;
					break;
				case 3:
					playerid.y = y - 44;
					break;
				case 4:
					playerid.y = y - 44;
					break;
				case 5:
					playerid.y = y - 40;
					break;
				default:
					playerid.y = y - 40;
					break;
			}
			if (floor(image_index) >= 10)
			{
				shot = true;
				with playerid
				{
					fmod_event_instance_stop(global.snd_trashjump1, true);
					x = other.x;
					y = other.y;
					sprite_index = spr_player_trashjump;
					image_index = 0;
					movespeed = 0;
					state = states.trashjump;
					vsp = -25;
					if !ispeppino
						create_transformation_tip(lang_get_value("trashrolltipN"), "trashrollN");
					fmod_event_one_shot_3d("event:/sfx/misc/trashjump2", x, y + vsp);
					instance_create(x, y, obj_speedlinesup);
					if !ispeppino
					{
						sprite_index = spr_playerN_trash;
						repeat 3
						{
							with (create_debris(x + irandom_range(-16, 16), y, spr_trashdebris))
							{
								hsp = random_range(-1, 1);
								vsp = -random_range(23, 26);
							}
						}
					}
				}
			}
		}
		if floor(image_index) == image_number - 1
		{
			sprite_index = spr_trash;
			state = states.normal;
			trashbuffer = 30;
		}
		break;
}
scr_collide();
