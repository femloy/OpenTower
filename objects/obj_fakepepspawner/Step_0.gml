if state == 0
{
	if spawnbuffer > 0
	{
		spawnbuffer--;
		if spawn == attack.emptyspot
			spawn++;
	}
	else if spawn <= attack.size
	{
		var xx = attack.x1 + (xplus * spawn);
		if attack.direction == -1
			xx = attack.x2 - (xplus * spawn);
		var yy = attack.y;
		with (instance_create(xx, yy, obj_fakepepclone))
		{
			attack = other.attack;
			spawnerID = other.id;
			other.spawn++;
			other.spawnbuffer = attack.timer;
		}
	}
	else
	{
		var b = true;
		with obj_fakepepclone
		{
			if spawnerID == other.id && state != states.Sjumpprep
				b = false;
		}
		if b
		{
			with obj_fakepepclone
			{
				if spawnerID == other.id
					image_speed = 0.35;
			}
			state++;
		}
	}
}
else
{
	b = false;
	with obj_fakepepclone
	{
		if spawnerID == other.id
			b = true;
	}
	if !b
		instance_destroy();
}
