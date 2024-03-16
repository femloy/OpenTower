with other
{
	if character == "V"
		scr_hurtplayer(id);
	else if (state != states.mach3 && (state != states.chainsaw || tauntstoredstate != states.mach3) && state != states.boots && state != states.dead && state != states.rideweenie && state != states.gotoplayer)
	{
		var _pindex = (object_index == obj_player1) ? 0 : 1;
		GamepadSetVibration(_pindex, 1, 1, 0.85);
		state = states.fireass;
		vsp = -25;
		sprite_index = spr_fireass;
		image_index = 0;
		if (!fmod_event_instance_is_playing(global.snd_fireass))
			fmod_event_instance_play(global.snd_fireass);
	}
}
