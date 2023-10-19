if (global.panic == false)
{
	destroy_sounds([snd]);
	instance_destroy();
}
else
{
	with (instance_create(x, y, obj_objecticontracker))
	{
		objectID = other.id;
		sprite_index = spr_icon_ghostjohn;
		image_speed = 0.18;
	}
}
