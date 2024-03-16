if !horseyfinish && start
{
	with obj_horsey
	{
		spd = 0;
		hsp = 0;
		vsp = 0;
		if state != states.dead
		{
			fmod_event_one_shot_3d("event:/sfx/misc/winrace", other.x, other.y);
			ds_list_add(global.saveroom, id);
		}
		state = states.dead;
		with obj_objecticontracker
		{
			if objectID == other.id
				instance_destroy();
		}
	}
	with obj_horseyright
		used = true;
	with obj_racestart
		ds_list_add(global.saveroom, id);
	global.horse = false;
	instance_destroy(obj_horseyblock);
}
