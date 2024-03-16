event_inherited()
sprite_index = spr_pumpkingate

if (!is_holiday(holiday.halloween) || quick_ini_read_real("", "halloween", "pumpkincount", 0) < 20)
|| global.panic
{
	instance_destroy()
	if is_holiday(holiday.halloween)
	{
		with (instance_create(x, y, obj_doorblocked))
		{
			sprite_index = spr_pumpkingate2
			depth = other.depth
		}
	}
}
