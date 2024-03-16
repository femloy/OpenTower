if flashcount > 0
{
	flash = true;
	flashcount--;
	repeat 3
	{
		with (instance_create(x, y, obj_hurtstars))
		{
			image_speed = 0.1;
			sprite_index = spr_plugeffect;
		}
	}
	alarm[0] = 6;
	alarm[1] = 3;
	if flashcount <= 0
		sprite_index = spr_plugdead;
}
