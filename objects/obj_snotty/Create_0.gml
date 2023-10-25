depth = 0;
if (is_holiday(holiday.halloween))
{
	instance_destroy();
	with (instance_create(x, y, obj_halloweennpc))
	{
		sprite_index = spr_snottyghost;
		image_alpha = 0.6;
	}
}
