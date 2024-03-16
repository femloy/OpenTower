hp = 0;
image_speed = 0.35;
depth = 2;
if room == rm_editor
{
	if (place_meeting(x, y + 32, obj_solid))
	{
		while (!place_meeting(x, y + 1, obj_solid))
			y += 1;
	}
}
