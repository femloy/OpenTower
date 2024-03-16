instance_create(x, y, obj_canonexplosion);
repeat 5
	create_debris(x, y, spr_wooddebris);
if cow
{
	with (instance_create(x, y - 21, obj_vigilantecow))
	{
		vsp = -16;
		bounce = 4;
		if (place_meeting(x, y, obj_solid))
		{
			while (place_meeting(x, y, obj_solid))
			{
				if (x < (room_width / 2))
					x++;
				else
					x--;
			}
		}
	}
}
else
{
	with (instance_create(x, y, obj_junk))
		vsp = -6;
}
fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
