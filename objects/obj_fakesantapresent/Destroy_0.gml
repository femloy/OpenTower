if (spawn)
{
	fmod_event_one_shot_3d("event:/sfx/misc/breakice", x, y);
	with (instance_create(x, y, content))
	{
		santaID = other.baddieID;
		important = true;
		state = states.stun;
		vsp = -8;
		stunned = 20;
		create_particle(x, y, particle.genericpoofeffect);
		switch (object_index)
		{
			case obj_spike:
				fake = true;
				y -= 32;
				break;
			default:
				if (scr_solid(x, y))
				{
					var old_y = y;
					while (scr_solid(x, y))
					{
						y--;
						if (abs(old_y - y) > room_height)
						{
							y = old_y;
							break;
						}
					}
				}
				break;
		}
	}
}
