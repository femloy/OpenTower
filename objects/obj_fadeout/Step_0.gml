var f = 1;
if group_arr != -4
	f = 1.2;
if fadealpha > f
{
	var q = false;
	if !fadein
	{
		q = true;
		with obj_camera
			lock = false;
		if gamestart
		{
			ini_open_from_string(obj_savesystem.ini_str);
			global.file_minutes = ini_read_real("Game", "minutes", 0);
			global.file_seconds = ini_read_real("Game", "seconds", 0);
			ini_close();
		}
		if restarttimer
		{
			global.level_minutes = 0;
			global.level_seconds = 0;
		}
	}
	if finalhallway
	{
		with obj_player
		{
			state = states.normal;
			movespeed = 0;
			landAnim = false;
			hallway = true;
			hallwaydirection = 1;
			targetDoor = "C";
		}
	}
	fadein = true;
	if q && group_arr != -4
	{
		instance_destroy(obj_pigtotal);
		var ga = group_arr;
		var oa = offload_arr;
		alarm[0] = 1;
		with (instance_create(0, 0, obj_loadingscreen))
		{
			dark = true;
			group_arr = ga;
			offload_arr = oa;
			persistent = true;
		}
	}
	else
	{
		if q && offload_arr != -4
		{
			for (var i = 0; i < array_length(offload_arr); i++)
				texture_flush(offload_arr[i]);
		}
		event_perform(ev_alarm, 0);
	}
}
if fadein == 0
	fadealpha += 0.1;
else if fadein == 1
	fadealpha -= 0.1;
if (instance_exists(obj_player))
{
	with obj_player1
	{
		if (other.fadein == 1 && (obj_player1.state == states.door || obj_player1.state == states.victory) && (sprite_index == spr_victory || place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate)))
		{
			state = states.comingoutdoor;
			image_index = 0;
			if global.coop == 1
			{
				obj_player2.state = states.comingoutdoor;
				obj_player2.image_index = 0;
			}
		}
		if (other.fadein == 1 && obj_player1.state == states.door && (obj_player1.sprite_index == spr_downpizzabox || obj_player1.sprite_index == spr_uppizzabox))
		{
			state = states.crouchjump;
			uncrouch = 20;
			if global.coop == 1
				obj_player2.state = states.crouchjump;
		}
	}
	if (instance_exists(obj_player2))
	{
		with obj_player2
		{
			if (other.fadein == 1 && (obj_player2.state == states.door || obj_player2.state == states.victory) && (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate)))
			{
				state = states.comingoutdoor;
				uncrouch = 20;
				image_index = 0;
				if global.coop == 1
				{
					obj_player1.state = states.comingoutdoor;
					obj_player1.image_index = 0;
				}
			}
			if (other.fadein == 1 && obj_player2.state == states.door && (obj_player2.sprite_index == spr_downpizzabox || obj_player2.sprite_index == spr_uppizzabox))
			{
				state = states.crouchjump;
				if global.coop == 1
					obj_player1.state = states.crouchjump;
			}
		}
	}
	with obj_player2
	{
		if (instance_exists(obj_coopplayerfollow))
			state = states.gotoplayer;
	}
}
if fadein == 1 && fadealpha < 0
	instance_destroy();
