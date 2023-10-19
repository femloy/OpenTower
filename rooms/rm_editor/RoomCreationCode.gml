if (global.loadeditor)
{
	if (!instance_exists(obj_score_set))
		instance_create_layer(0, 0, "Instances", obj_score_set);
}
else
{
	instance_create_layer(64, 0, "Instances", obj_bg_set);
	instance_create_layer(96, 0, "Instances", obj_music_set);
	instance_create_layer(0, 0, "Instances", obj_score_set);
}
with (obj_solid)
	visible = true;
with (par_triggers)
	visible = true;
