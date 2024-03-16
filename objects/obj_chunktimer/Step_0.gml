if (global.panic == true && global.fill > 0 && !instance_exists(obj_ghostcollectibles) && !global.tutorial_room)
	global.fill -= 0.2;
if (global.fill <= 0 && global.panic == true && !global.tutorial_room && !instance_exists(obj_pizzaface))
{
	var s = string_letters(room_get_name(room));
	if (string_copy(s, 1, 5) != "tower")
	{
		instance_create(obj_player1.x, obj_player1.y, obj_pizzaface);
		fmod_event_one_shot("event:/sfx/pizzaface/laugh");
	}
	else
	{
		with obj_player
		{
			instance_destroy(obj_fadeout);
			targetDoor = "A";
			room = timesuproom;
			state = states.timesup;
			sprite_index = spr_Timesup;
			image_index = 0;
			backtohubroom = tower_finalhallway;
			backtohubstartx = 206;
			backtohubstarty = 690;
			if isgustavo
				sprite_index = spr_player_ratmounttimesup;
			visible = true;
			image_blend = c_white;
			audio_stop_all();
			if object_index == obj_player1 && ispeppino && !global.swapmode
				stop_music();
			fmod_event_one_shot("event:/music/timesup");
		}
	}
}
if global.fill <= 0
	global.fill = 0;
