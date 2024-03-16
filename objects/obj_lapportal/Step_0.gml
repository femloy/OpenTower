if ((global.panic || instance_exists(obj_wartimer)) && sprite_index != spr_pizzaportal_outline)
{
	image_alpha = 1;
	if sprite_index == spr_pizzaportal
	{
		playerid = -4;
		with obj_player
		{
			if (other.playerid == noone && place_meeting(x, y, other))
			{
				fmod_event_one_shot_3d("event:/sfx/misc/secretenter", x, y);
				with obj_camera
					lock = true;
				state = states.actor;
				visible = false;
				other.sprite_index = spr_pizzaportalend;
				if !ispeppino
					other.sprite_index = spr_pizzaportalendN;
				other.image_index = 0;
				other.playerid = id;
				fmod_event_one_shot_3d("event:/sfx/misc/lapenter", x, y);
				if (ds_list_find_index(global.saveroom, other.id) == -1)
				{
					ds_list_add(global.saveroom, other.id);
					global.collect += 3000;
					global.combotime = 60;
					with (instance_create(x, y, obj_smallnumber))
						number = string(3000);
				}
			}
		}
	}
	else if (sprite_index == spr_pizzaportalend || sprite_index == spr_pizzaportalendN)
	{
		with playerid
		{
			hsp = 0;
			vsp = 0;
			visible = false;
		}
		if floor(image_index) == image_number - 1
		{
			image_index = image_number - 1;
			image_speed = 0;
			if (!instance_exists(obj_fadeout))
			{
				with obj_player
				{
					targetDoor = "LAP";
					targetRoom = other.targetRoom;
				}
				for (var i = 0; i < ds_list_size(global.escaperoom); i++)
				{
					var b = ds_list_find_value(global.escaperoom, i);
					var q = ds_list_find_index(global.baddieroom, b);
					var t = false;
					if q == -1
					{
						q = ds_list_find_index(global.saveroom, b);
						t = true;
					}
					if q != -1
					{
						if !t
							ds_list_delete(global.baddieroom, q);
						else
							ds_list_delete(global.saveroom, q);
					}
				}
				global.laps++;
				global.lap = true;
				instance_create(0, 0, obj_fadeout);
			}
		}
	}
}
else
	image_alpha = 0.5;
