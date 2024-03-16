with other
{
	if state != states.boots && state != states.dead && state != states.rideweenie && state != states.gotoplayer && state != states.backbreaker
	{
		var _pindex = (object_index == obj_player1) ? 0 : 1;
		GamepadSetVibration(_pindex, 1, 1, 0.85);
		if state != states.fireass
		{
			
		}
		hurted = false;
		state = states.fireass;
		vsp = -25;
		fireasslock = true;
		sprite_index = spr_fireass;
		image_index = 0;
		hsp = 0;
		movespeed = 0;
		fmod_event_one_shot_3d("event:/sfx/pep/burn", x, y);
		if (!fmod_event_instance_is_playing(global.snd_fireass))
			fmod_event_instance_play(global.snd_fireass);
		instance_destroy(other);
	}
}
