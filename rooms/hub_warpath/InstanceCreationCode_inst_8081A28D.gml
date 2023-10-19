if (global.levelcomplete && !global.warcutscene)
{
	global.levelcomplete = false;
	currentroom = room;
	explosion_func = function(x, y)
	{
		instance_create(x, y, obj_canonexplosion);
		cutscene_end_action();
	};
	bombactor = -4;
	planeactor = -4;
	scene_info = [[cutscene_entrance_start], [cutscene_waitfor_sprite, obj_player1], [cutscene_player_idleanim], [cutscene_change_room, hub_sky], [cutscene_set_player_visible, false], [cutscene_player_float, true], [cutscene_set_player_pos, 100, 100], [cutscene_wait, 20], [function()
	{
		planeactor = instance_create(1056, 128, obj_actor);
		planeactor.image_speed = 0.35;
		planeactor.sprite_index = spr_crashingplane;
		planeactor.hsp = -8;
		cutscene_end_action();
	}], [function()
	{
		with (planeactor)
		{
			x += hsp;
			if (x < (room_width / 2))
			{
				with (other)
					cutscene_end_action();
			}
		}
	}], [function()
	{
		bombactor = instance_create(planeactor.x, planeactor.y, obj_actor);
		bombactor.sprite_index = spr_bomb;
		bombactor.image_index = 0.35;
		planeactor.x += planeactor.hsp;
		cutscene_end_action();
	}], [function()
	{
		planeactor.x += planeactor.hsp;
		with (bombactor)
		{
			y += 10;
			if (y > (room_height + 50))
			{
				with (other)
				{
					planeactor = -4;
					bombactor = -4;
					cutscene_end_action();
				}
			}
		}
	}], [cutscene_change_room, hub_topentrance], [cutscene_set_player_pos, 1350, 200], [function()
	{
		bombactor = instance_create(1344, -60, obj_actor);
		bombactor.sprite_index = spr_bomb;
		bombactor.image_index = 0.35;
		cutscene_end_action();
	}], [function()
	{
		bombactor.y += 10;
		if (bombactor.y > 390)
		{
			instance_destroy(bombactor);
			cutscene_end_action();
		}
	}], [explosion_func, 1342, 385], [cutscene_wait, 3], [explosion_func, 1342, 477], [cutscene_wait, 3], [explosion_func, 1342, 531], [cutscene_wait, 40], [cutscene_change_room, hub_laundryroom], [cutscene_set_player_pos, 300, 300], [cutscene_wait, 50], [explosion_func, 267, 4], [cutscene_wait, 3], [explosion_func, 267, 63], [cutscene_wait, 3], [explosion_func, 267, 125], [cutscene_wait, 3], [cutscene_wait, 100], [cutscene_change_room, currentroom], [cutscene_set_player_visible, true], [function()
	{
		with (obj_player)
		{
			state = states.normal;
			x = backtohubstartx;
			y = backtohubstarty;
		}
		global.levelcomplete = false;
		global.warcutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "war", true);
		cutscene_end_action();
	}], [cutscene_save_game]];
}
else if (global.levelcomplete)
{
	global.levelcomplete = false;
	scene_info = [[cutscene_save_game]];
}
else
	scene_info = [[cutscene_wait, 20]];
