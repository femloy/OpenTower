ds_list_add(global.baddieroom, id);
with (instance_create(x, y, content))
{
	if object_index == obj_pizzagoblinbomb
		defused = true;
	image_speed = 0.35;
	image_xscale = other.image_xscale;
	instance_create(x, y, obj_pizzaportalfade);
}
instance_destroy();
