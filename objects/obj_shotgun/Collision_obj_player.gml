if (!instance_exists(obj_backtohub_fadeout) && (!instance_exists(obj_pause) || obj_pause.alarm[5] == -1 || obj_pause.alarm[3] == -1))
{
	with other
	{
		if (state == states.handstandjump || state == states.lungeattack || state == states.punch)
		{
			image_index = 0;
			sprite_index = spr_shotgunpullout;
			fmod_event_one_shot_3d("event:/sfx/pep/shotgunload", x, y);
			fmod_event_one_shot_3d("event:/sfx/misc/breakblock", x, y);
			instance_destroy(other);
			shotgunAnim = true;
			state = states.shotgun;
			create_transformation_tip(lang_get_value("shotguntip"), "shotgun");
			if room == war_1
			{
				with (instance_create_unique(0, 0, obj_wartimer))
				{
					minutes = 0;
					seconds = 40;
				}
				with obj_escapecollect
					image_alpha = 1;
				with obj_music
				{
					if music != -4
						fmod_event_instance_play(music.event);
				}
			}
			global.heattime = 60;
		}
	}
}
