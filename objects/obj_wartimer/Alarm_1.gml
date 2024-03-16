if room != rank_room && minutes <= 0 && seconds <= 0 && addseconds <= 0
{
	instance_destroy(obj_fadeout);
	with obj_player
	{
		targetDoor = "A";
		room = timesuproom;
		state = states.timesup;
		sprite_index = spr_Timesup;
		image_index = 0;
		stop_music();
		audio_stop_all();
		fmod_event_one_shot("event:/music/timesup");
	}
	instance_create(0, 0, obj_timesupwar);
	instance_destroy();
}
