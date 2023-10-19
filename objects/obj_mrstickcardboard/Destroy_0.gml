with (instance_create(x, y, obj_sausageman_dead))
{
	image_xscale = other.image_xscale;
	sprite_index = other.sprite_index;
	image_speed = 0;
	image_index = other.image_index;
}
with (instance_create(x, y, obj_spike))
	depth = other.depth + 10;
