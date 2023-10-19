if (ds_list_find_index(global.saveroom, id) == -1)
{
	with (instance_create(x, y, obj_sausageman_dead))
	{
		image_xscale = other.image_xscale;
		sprite_index = other.spr_dead;
	}
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	if (fmod_event_instance_is_playing(sniffsnd))
		fmod_event_instance_stop(sniffsnd, true);
	fmod_event_one_shot_3d(deadsnd, x, y);
	var x1 = (x - sprite_xoffset) + (sprite_width / 2);
	var y1 = (y - sprite_yoffset) + (sprite_height / 2);
	global.combo += 1;
	global.enemykilled += 1;
	global.combotime = 60;
	repeat (3)
	{
		with (create_debris(x1, y1, spr_slapstar))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
		}
	}
	var combototal = 10 + floor(global.combo * 0.5);
	global.collect += combototal;
	global.comboscore += combototal;
	instance_create(x1, y1, obj_bangeffect);
	if (object_index == obj_rattumble || object_index == obj_rattumble_big)
		notification_push(notifs.rattumble_dead, [room]);
	else
		notification_push(notifs.ratblock_dead, [room]);
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	with (obj_player1)
		supercharge += 1;
	GamepadSetVibration(0, 0.8, 0.8, 0.65);
	ds_list_add(global.saveroom, id);
}
destroy_sounds([sniffsnd]);
