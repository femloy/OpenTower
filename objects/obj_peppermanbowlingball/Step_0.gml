if (fallbuffer > 0)
	fallbuffer--;
else
	fall = true;
if (fall == 0)
	y = Approach(y, 32, 2);
if (fall == 1)
	y += 9;
if (place_meeting(x, y + 1, obj_solid) && fall == 1)
{
	fmod_event_one_shot_3d("event:/sfx/pepperman/statuedestroy", x, y);
	destroy = true;
	instance_destroy();
}
