if (!pause && obj_player1.key_start)
{
	var _cutscenehandler = false;
	with (obj_cutscene_handler)
	{
		if (!loop)
			_cutscenehandler = true;
	}
	with (obj_secretportal)
	{
		if (touched)
			_cutscenehandler = true;
	}
	with (obj_secretportalstart)
		_cutscenehandler = true;
	if (obj_savesystem.state == 0 && !_cutscenehandler && (room != rank_room && room != Realtitlescreen && room != timesuproom) && !instance_exists(obj_jumpscare) && !instance_exists(obj_fadeout) && !instance_exists(obj_technicaldifficulty))
	{
		selected = 0;
		if (!instance_exists(obj_pausefadeout))
			instance_create(x, y, obj_pausefadeout);
	}
}
with (obj_player1)
{
	other.paletteselect = paletteselect;
	other.spr_palette = spr_palette;
}
if (pause && !instance_exists(obj_option))
{
	scr_getinput();
	var prevselected = selected;
	moveselect = -key_up2 + key_down2;
	selected += moveselect;
	if (moveselect != 0 && selected >= 0 && selected <= 2)
		selected = clamp(selected, 0, array_length(pause_menu) - 1);
	if (prevselected != selected)
	{
		switch (selected)
		{
			case 0:
				peppino_sprite = spr_player_idle;
				break;
			case 1:
				peppino_sprite = spr_file1;
				break;
			case 2:
				peppino_sprite = spr_player_panic;
				break;
			case 3:
				peppino_sprite = spr_player_winding;
				break;
		}
		peppino_sprite_number = sprite_get_number(peppino_sprite);
		peppino_index = 0;
	}
	if (key_jump)
	{
		switch (selected)
		{
			case 0:
				if (!instance_exists(obj_pausefadeout))
					instance_create(x, y, obj_pausefadeout);
				break;
			case 2:
				var roomname = room_get_name(room);
				if (!global.snickchallenge)
				{
					var rm = -4;
					rm = global.leveltorestart;
					ds_list_clear(global.saveroom);
					ds_list_clear(global.baddieroom);
					if (rm != -4 && rm != -1)
					{
						instance_destroy(obj_fadeout);
						instance_activate_all();
						global.levelreset = false;
						scr_playerreset();
						global.levelreset = true;
						scr_room_goto(rm);
						pause = false;
						obj_player1.targetDoor = "A";
						obj_player1.restartbuffer = 15;
						obj_player2.restartbuffer = 15;
						if (instance_exists(obj_player2))
							obj_player2.targetDoor = "A";
						break;
					}
					else
					{
					}
				}
				break;
			case 1:
				with (instance_create(x, y, obj_option))
					depth = other.depth - 1;
				break;
			case 3:
				if (room == hub_room1 || room == characterselect || room == cowboytask || room == Titlescreen || room == Mainmenu || room == Scootertransition || room == rm_levelselect || string_letters(room_get_name(room)) == "towertutorial" || (string_copy(room_get_name(room), 1, 5) == "tower" && !global.panic))
				{
					pause = false;
					instance_activate_all();
					room = Realtitlescreen;
					with (obj_player1)
					{
						character = "P";
						scr_characterspr();
					}
					global.leveltosave = -4;
					scr_playerreset();
					alarm[0] = 2;
					obj_player1.state = states.titlescreen;
					obj_player2.state = states.titlescreen;
					obj_player1.targetDoor = "A";
					if (instance_exists(obj_player2))
						obj_player2.targetDoor = "A";
					global.cowboyhat = false;
					global.coop = false;
				}
				else
				{
					pause = false;
					instance_activate_all();
					with (instance_create(0, 0, obj_backtohub_fadeout))
						fadealpha = 1;
					scr_playerreset();
					global.levelreset = true;
					obj_player1.targetDoor = "HUB";
					if (instance_exists(obj_player2))
						obj_player2.targetDoor = "HUB";
					global.leveltorestart = -4;
					global.leveltosave = -4;
				}
				break;
		}
	}
	cursor_index += 0.35;
	if (cursor_index > cursor_sprite_number)
	{
		var p = cursor_index - floor(cursor_index);
		cursor_index = p;
	}
	peppino_index += 0.35;
	if (peppino_index > peppino_sprite_number)
	{
		p = peppino_index - floor(peppino_index);
		peppino_index = p;
	}
	for (var i = 0; i < array_length(toppin_sprite); i++)
	{
		toppin_index[i] += 0.35;
		if (toppin_index[i] > toppin_number[i])
		{
			var t = toppin_index[i];
			p = t - floor(t);
			toppin_index[i] = p;
		}
	}
	toppin_has[0] = global.cheesefollow;
	toppin_has[1] = global.pineapplefollow;
	toppin_has[2] = global.sausagefollow;
	toppin_has[3] = global.shroomfollow;
	toppin_has[4] = global.tomatofollow;
}
