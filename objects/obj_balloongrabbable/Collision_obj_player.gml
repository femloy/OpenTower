if active
{
	if other.ispeppino
	{
		if other.isgustavo && other.brick
		{
			fmod_event_one_shot_3d("event:/sfx/rat/grabeat", x, y);
			other.state = states.ratmountballoon;
			active = false;
			cooldown = 100;
			other.balloonbuffer = 250;
		}
		else if other.isgustavo == 0
		{
			fmod_event_one_shot_3d("event:/sfx/rat/grab", x, y);
			other.state = states.balloon;
			other.movespeed = other.hsp;
			active = false;
			with other
			{
				if isgustavo
					vsp = -7;
			}
			cooldown = 100;
			other.balloonbuffer = 250;
		}
		create_transformation_tip(lang_get_value("balloontip"), "balloon");
	}
	else
	{
		create_transformation_tip(lang_get_value("balloontipN"), "balloonN");
		fmod_event_one_shot_3d("event:/sfx/rat/grab", x, y);
		other.state = states.balloon;
		other.movespeed = other.hsp;
		other.savedmove = other.xscale;
		active = false;
		cooldown = 100;
		other.balloonbuffer = 100;
		create_particle(x, y, particle.genericpoofeffect);
	}
}
