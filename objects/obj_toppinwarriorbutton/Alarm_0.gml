with (instance_create(x, y, obj_toppinwarrior))
	toppinwarrior = other.toppinwarrior;
repeat (6)
{
	with (instance_create(x + random_range(-50, 50), y + random_range(-50, 50), obj_cloudeffect))
		sprite_index = spr_baddiespawn;
}
instance_destroy();
