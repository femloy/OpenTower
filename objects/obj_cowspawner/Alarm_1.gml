if (spawn)
{
	alarm[1] = 120;
	with (instance_create(0, 0, obj_peppermanbowlingballspawner))
	{
		balls = 3;
		object = obj_cowfall;
		with (obj_vigilanteboss)
		{
			if (phase == 2)
				other.balls = 5;
		}
	}
}
