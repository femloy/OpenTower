function scr_is_p_rank()
{
	if global.leveltosave != "exit" && global.leveltosave != "secretworld"
		return global.lap && global.secretfound >= 3 && global.treasure && !global.combodropped && global.prank_enemykilled;
	else if global.leveltosave == "exit"
		return !global.combodropped;
	else
		return !global.combodropped && global.prank_enemykilled;
}
function scr_do_rank(showtoppins = true, boss = false)
{
	fmod_event_instance_stop(global.snd_escaperumble, true);
	var ex = x;
	var ey = y;
	var cx = camera_get_view_x(view_camera[0]) + SCREEN_X;
	var cy = camera_get_view_y(view_camera[0]) + SCREEN_Y;
	rankpos_x = ex - cx;
	rankpos_y = ey - cy;
	if global.timeattack == 1
		obj_timeattack.stop = true;
	with obj_wartimer
		notification_push(notifs.wartimer_endlevel, [minutes, seconds + addseconds]);
	targetDoor = "none";
	obj_camera.alarm[2] = -1;
	var roomname = room_get_name(room);
	var namestring = string_letters(roomname);
	if !global.tutorial_room
	{
		if !boss
			scr_savescore(global.leveltosave);
		else
		{
			ini_open_from_string(obj_savesystem.ini_str);
			var _hats = global.hats;
			if (ini_read_real("Hats", global.leveltosave, 0) < _hats)
				ini_write_real("Hats", global.leveltosave, _hats);
			var _extrahats = global.extrahats;
			if (ini_read_real("Extrahats", global.leveltosave, 0) < _extrahats)
				ini_write_real("Extrahats", global.leveltosave, _extrahats);
			var _rank = "d";
			var maxhats = 6 + global.srank;
			var currhats = _extrahats + _hats;
			if currhats >= maxhats && !global.bossplayerhurt
				_rank = "p";
			else if (currhats >= (maxhats - 2))
				_rank = "s";
			else if (currhats >= (maxhats - 4))
				_rank = "a";
			else if (currhats >= (maxhats - 6))
				_rank = "b";
			else if (currhats >= (maxhats - 8))
				_rank = "c";
			global.rank = _rank;
			scr_write_rank(global.leveltosave);
			scr_play_rank_music();
			obj_savesystem.ini_str = ini_close();
			gamesave_async_save();
		}
		notification_push(notifs.end_level, [global.leveltosave, global.secretfound, global.level_minutes, global.level_seconds]);
		with obj_achievementtracker
			event_perform(ev_step, ev_step_normal);
	}
	else
	{
		var _lap = false;
		ini_open_from_string(obj_savesystem.ini_str);
		ini_write_real("Tutorial", "finished", true);
		if ((global.level_minutes < 2 || (global.level_minutes < 1 || (global.level_minutes == 1 && global.level_seconds <= 40))) && ini_read_real("Tutorial", "lapunlocked", false) == 0)
		{
			ini_write_real("Tutorial", "lapunlocked", true);
			_lap = true;
		}
		obj_savesystem.ini_str = ini_close();
		if _lap
			create_transformation_tip(lang_get_value("tutorial_lapunlock"));
	}
	if global.combo > 0
	{
		global.combotime = 0;
		global.combo = 0;
		obj_camera.alarm[4] = -1;
		for (var i = 0; i < global.comboscore; i += 10)
			create_collect(obj_player1.x + irandom_range(-60, 60), (obj_player1.y - 100) + irandom_range(-60, 60), choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect), 10);
		global.comboscore = 0;
	}
	if (!instance_exists(obj_endlevelfade))
	{
		with (instance_create(x, y, obj_endlevelfade))
		{
			do_rank = true;
			toppinvisible = showtoppins;
			with obj_pizzaface
			{
				if (bbox_in_camera(view_camera[0]))
					notification_push(notifs.close_call, []);
			}
			if (room == tower_tutorial1 || room == tower_tutorial1N)
			{
				do_rank = false;
				targetRoom = tower_entrancehall;
				targetDoor = "HUB";
			}
			else if global.leveltosave == "secretworld"
				toppinvisible = false;
			else if room == tower_entrancehall
			{
				with obj_followcharacter
					persistent = false;
				if !global.exitrank
				{
					do_rank = false;
					targetRoom = Endingroom;
					targetDoor = "A";
					instance_destroy(obj_pigtotal);
					audio_stop_all();
					stop_music();
					fmod_event_instance_stop(global.snd_rank);
					fmod_event_one_shot("event:/sfx/ending/towercollapsetrack");
				}
				else
					toppinvisible = false;
			}
		}
	}
	obj_player1.state = states.door;
	obj_player1.sprite_index = obj_player1.spr_lookdoor;
	if (instance_exists(obj_player2))
	{
		obj_player2.state = states.door;
		obj_player2.sprite_index = obj_player2.spr_lookdoor;
		if global.coop
			obj_player2.visible = true;
	}
	obj_endlevelfade.alarm[0] = 235;
	image_index = 0;
	global.panic = false;
	global.snickchallenge = false;
	global.leveltorestart = -4;
	gamesave_async_save();
}
