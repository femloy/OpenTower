if buffer <= 0 && other.state != states.ghost
{
	buffer = 50;
	image_alpha = 0;
	with other
	{
		if (ds_list_find_index(global.saveroom, other.id) == -1)
		{
			notification_push(notifs.corpsesurf, [room]);
			ds_list_add(global.saveroom, other.id);
		}
		fmod_event_one_shot_3d("event:/sfx/pep/gravecorpsestart", x, y);
		vsp = -11;
		movespeed = abs(movespeed);
		dir = xscale;
		movespeed = 13;
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale;
		sprite_index = spr_playercorpsestart;
		image_index = 0;
		gravesurfingjumpbuffer = 50;
		with obj_gravecorpse
		{
			if playerid == other.id
				instance_destroy();
		}
		with (instance_create(x, y, obj_gravecorpse))
			playerid = other.id;
		state = states.trashroll;
		repeat 5
		{
			with (create_debris(x, y, spr_graveyarddebris2, false))
				vsp = random_range(-8, -11);
		}
		create_transformation_tip(lang_get_value("gravesurftip"), "gravesurf");
	}
}
