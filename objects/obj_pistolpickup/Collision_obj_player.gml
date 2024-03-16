if other.state == states.handstandjump && other.grounded
{
	with other
	{
		state = states.animation;
		sprite_index = spr_player_pistolintro;
		image_index = 0;
		image_speed = 0.35;
		tauntstoredstate = states.normal;
		fmod_event_one_shot("event:/sfx/pep/pistolstart");
		fmod_event_one_shot_3d("event:/sfx/misc/breakblock", x, y);
	}
	if room == boss_pizzaface
	{
		with obj_music
		{
			if music != -4
				fmod_event_instance_set_parameter(music.event, "state", 1.4, true);
		}
	}
	global.pistol = true;
	instance_destroy();
}
