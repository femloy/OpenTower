switch state
{
	case states.jump:
		y += vsp;
		if vsp < 20
			vsp += grav;
		if y >= y_to
		{
			if touchedground
			{
				fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
				y = y_to;
				state = states.normal
				with obj_camera
				{
					shake_mag = 3;
					shake_mag_acc = 5 / room_speed;
				}
				with (instance_create(x, y, obj_explosioneffect))
				{
					sprite_index = spr_groundpoundeffect;
					image_speed = 0.4;
				}
			}
			else
			{
				fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
				vsp = -8;
				touchedground = true;
				y = y_to;
				with (instance_create(x, y, obj_explosioneffect))
				{
					sprite_index = spr_highjumpcloud2;
					image_speed = 0.4;
				}
				with obj_camera
				{
					shake_mag = 3;
					shake_mag_acc = 5 / room_speed;
				}
			}
		}
		break;
	case states.gottreasure:
		if (instance_exists(obj_bosskeynoise) && obj_bosskeynoise.x <= noisex)
		{
			x = obj_bosskeynoise.x;
			y = obj_bosskeynoise.y;
			noise = true;
		}
		if (!instance_exists(obj_bosskeynoise) && noise)
		{
			x = -100;
			y = -100;
		}
		break;
}
