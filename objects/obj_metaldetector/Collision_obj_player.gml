with (other)
{
	if (shotgunAnim)
	{
		shotgunAnim = false;
		fmod_event_one_shot_3d("event:/sfx/misc/detransfo", x, y);
		with (instance_create(x, y, obj_sausageman_dead))
			sprite_index = spr_shotgunback;
	}
}
