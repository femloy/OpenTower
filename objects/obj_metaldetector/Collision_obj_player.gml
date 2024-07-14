with other
{
	if shotgunAnim
	{
		shotgunAnim = false;
		fmod_event_one_shot_3d("event:/sfx/misc/detransfo", x, y);
		with instance_create(x, y, obj_sausageman_dead)
		{
			sprite_index = spr_shotgunback;
			if !obj_player1.ispeppino
				sprite_index = spr_minigunfall;
		}
		if state == states.shotgunshoot
			state = states.normal;
	}
}
