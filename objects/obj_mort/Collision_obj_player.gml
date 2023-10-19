if (sprite_index != spr_mortspawn)
{
	with (other)
	{
		if (state != states.mort && state != states.mortjump && state != states.mortattack && state != states.morthook && state != states.ridecow)
		{
			repeat (6)
				create_debris(x, y, spr_feather);
			mort = true;
			instance_create_unique(x, y, obj_mortfollow);
			movespeed = hsp;
			state = states.mort;
			fmod_event_one_shot_3d("event:/sfx/mort/mortpickup", x, y);
			create_transformation_tip(lang_get_value("morttip"), "morttip");
			instance_destroy(other);
		}
	}
}
