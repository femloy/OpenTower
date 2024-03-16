if (state == 0 || state == 1)
	instance_deactivate_object(baddieID);

switch state
{
	case 0:
		if !global.panic
			visible = false;
		else
			state = 1;
		break;
	
	case 1:
		visible = false;
		image_index = 0;
		var p = obj_player1.id;
		if (distance_to_pos(x, y, p.x, p.y, 500, 100))
		{
			state = 2;
			visible = true;
		}
		break;
	
	case 2:
		if (floor(image_index) > 5)
		{
			instance_activate_object(baddieID);
			fmod_event_one_shot_3d("event:/sfx/enemies/escapespawn", x, y);
			with baddieID
			{
				x = other.x;
				y = other.y;
				if escapestun
				{
					state = states.stun;
					sprite_index = stunfallspr;
					stunned = 20;
					if elite
						stunned *= 6;
				}
				boundbox = false;
				create_particle(x, y, particle.genericpoofeffect);
			}
			state = 3;
		}
		break;
	
	case 3:
		if floor(image_index) == image_number - 1
			visible = false;
		break;
}
