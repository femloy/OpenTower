if state == states.normal
{
	if ((hsp > 0 && x > obj_bucketdestination.x) || (hsp <= 0 && x <= obj_bucketdestination.x))
	{
		state++
		fmod_event_one_shot_3d("event:/sfx/playerN/bucket", x, y)
		instance_create(x, y, obj_bucketsplash)
		repeat 3
		{
			with (instance_create(x, y, obj_bucketsplash))
			{
				vsp = -random_range(6, 9)
				hsp = random_range(-2, 2)
			}
		}
	}
}
else
{
	if vsp < 20
		vsp += 0.4
	hsp = Approach(hsp, 0, 0.2)
}
x += hsp
y += vsp
