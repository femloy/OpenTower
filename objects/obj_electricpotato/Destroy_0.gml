if (ds_list_find_index(global.baddieroom, id) == -1)
{
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = other.spr_dead;
	instance_create(x, y, obj_bangeffect);
	ds_list_add(global.baddieroom, id);
	with (obj_player1)
		supercharge += 1;
	global.combo += 1;
	global.enemykilled += 1;
	global.combotime = 60;
	if (instance_exists(obj_hardmode))
		global.heatmeter_count++;
	var combototal = 10 + floor(global.combo * 0.5);
	global.collect += combototal;
	global.comboscore += combototal;
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	repeat (3)
	{
		with (create_debris(x, y, spr_slapstar))
		{
			hsp = random_range(-5, 5);
			vsp = random_range(-10, 10);
		}
	}
	instance_create(x, y, obj_bangeffect);
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	if (object_index == obj_miniufo)
		instance_create(x, y, obj_playerexplosion);
	ds_list_add(global.baddieroom, id);
	if (escape)
		ds_list_add(global.escaperoom, id);
}
