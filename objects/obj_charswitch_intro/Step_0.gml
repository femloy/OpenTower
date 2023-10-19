switch (state)
{
	case states.transition:
		if (floor(image_index) == (image_number - 1))
		{
			state = states.normal;
			introbuffer = 50;
		}
		break;
	case states.normal:
		if (introbuffer > 0)
			introbuffer--;
		else
		{
			image_speed = 0;
			image_index = image_number - 1;
			state = states.fall;
			obj_camera.lock = false;
			with (obj_player1)
			{
				if (other.spr == spr_backtopeppino)
				{
					x = obj_peppinoswitch.x;
					y = obj_peppinoswitch.y;
				}
				else
				{
					x = obj_gustavoswitch.x;
					y = obj_gustavoswitch.y;
				}
			}
			with (obj_followcharacter)
			{
				ds_queue_clear(followqueue);
				x = obj_player1.x;
				y = obj_player1.y;
			}
		}
		break;
	case states.fall:
		image_index -= 0.35;
		if (image_index <= 0)
		{
			fmod_event_one_shot("event:/sfx/ui/tvswitchback");
			instance_destroy();
		}
		break;
}
shakey = random_range(-1, 1);
