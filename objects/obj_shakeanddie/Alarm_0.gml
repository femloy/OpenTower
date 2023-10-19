with (instance_create(x, y, obj_sausageman_dead))
{
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	sprite_index = other.sprite_index;
	image_xscale = other.image_xscale;
}
instance_destroy();
