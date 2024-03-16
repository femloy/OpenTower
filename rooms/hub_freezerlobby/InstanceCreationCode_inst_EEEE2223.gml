if (global.levelcomplete && !global.freezercutscene)
{
	global.levelcomplete = false;
	with (obj_player1)
	{
		other.backx = backtohubstartx;
		other.backy = backtohubstarty;
	}
	currentroom = room;
	dragonactor = inst_593BA4BB;
	scene_info = [[cutscene_medieval_start], [cutscene_waitfor_sprite, obj_player1], [function()
	{
		with (obj_actor)
		{
			if (id != other.dragonactor)
			{
				sprite_index = spr_idle;
				visible = true;
			}
		}
		cutscene_end_action();
	}], [cutscene_set_player_visible, false], [cutscene_player_idleanim], [cutscene_player_float, true], [cutscene_player_pos_lerp, 832, 288, 0.07], [cutscene_wait, 40], [function()
	{
		with (dragonactor)
		{
			image_speed = 0.35;
			sprite_index = spr_cheesedragon_goingup;
			repeat (3)
				create_debris(x, y, spr_icedebris);
		}
		cutscene_end_action();
	}], [function()
	{
		with (dragonactor)
		{
			y -= 5;
			if (y < -100)
			{
				with (other)
					cutscene_end_action();
			}
		}
	}], [cutscene_change_room, hub_grandpizzardtower], [cutscene_set_player_visible, false], [cutscene_set_player_pos, 1407, 415], [cutscene_wait, 20], [function()
	{
		dragonactor = instance_create(1407, -125, obj_actor);
		dragonactor.sprite_index = spr_cheesedragon_idle;
		dragonactor.image_speed = 0.35;
		cutscene_end_action();
	}], [function()
	{
		with (dragonactor)
		{
			y += 5;
			if (place_meeting(x, y + 128, obj_solid))
			{
				sprite_index = spr_cheesedragon_stomp;
				image_index = 0;
				with (other)
					cutscene_end_action();
			}
		}
	}], [function()
	{
		with (dragonactor)
		{
			y += 5;
			if (place_meeting(x, y + 5, obj_solid))
			{
				while (!place_meeting(x, y + 1, obj_solid))
					y++;
				with (other)
					cutscene_end_action();
			}
		}
	}], [cutscene_soundeffect, sfx_groundpound], [cutscene_camera_shake, 5, 3 / room_speed], [function()
	{
		with (dragonactor)
		{
			if (floor(image_index) == image_number - 1)
			{
				sprite_index = spr_cheesedragon_idle;
				with (other)
					cutscene_end_action();
			}
		}
	}], [cutscene_wait, 50], [function()
	{
		with (obj_freezerblock)
			instance_destroy();
		cutscene_end_action();
	}], [cutscene_wait, 50], [cutscene_change_room, hub_plains], [cutscene_set_player_visible, false], [cutscene_set_player_pos, 190, 600], [cutscene_soundeffect, sfx_groundpound], [cutscene_camera_shake, 5, 3 / room_speed], [cutscene_wait, 50], [function()
	{
		with (obj_freezerblock)
			instance_destroy();
		cutscene_end_action();
	}], [cutscene_wait, 50], [cutscene_change_room, currentroom], [cutscene_set_player_pos, backx, backy], [cutscene_set_player_visible, true], [cutscene_player_float, false], [function()
	{
		instance_destroy(obj_actor);
		with (obj_player)
		{
			if (object_index != obj_player2 || global.coop)
			{
				state = states.normal;
				x = backtohubstartx;
				y = backtohubstarty;
			}
		}
		global.levelcomplete = false;
		global.freezercutscene = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "freezer", true);
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
