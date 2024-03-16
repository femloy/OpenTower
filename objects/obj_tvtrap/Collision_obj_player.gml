if (other.instakillmove || other.state == states.handstandjump)
{
	fmod_event_one_shot_3d("event:/sfx/misc/beerbreak", x, y);
	with other
	{
		scr_pummel();
		instance_destroy(other);
	}
}
