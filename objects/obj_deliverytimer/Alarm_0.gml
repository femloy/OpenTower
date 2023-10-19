seconds--;
if (seconds < 0)
{
	if (minutes > 0)
	{
		minutes--;
		seconds = 59;
	}
	else
	{
		instance_destroy();
		with (obj_deliveryfollower)
		{
			instance_create(x, y, obj_deliveryfolloweranim);
			instance_destroy();
		}
	}
}
alarm[0] = 60;
