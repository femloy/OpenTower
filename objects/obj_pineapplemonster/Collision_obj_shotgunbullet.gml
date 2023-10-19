instance_destroy();
repeat (3)
{
	with (create_debris(x, y, spr_slapstar))
	{
		hsp = random_range(-5, 5);
		vsp = random_range(-10, 10);
	}
}
fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
instance_create(x, y, obj_bangeffect);
with (obj_camera)
{
	shake_mag = 3;
	shake_mag_acc = 3 / room_speed;
}
if (ds_list_find_index(global.baddieroom, id) == -1)
{
	ds_list_add(global.baddieroom, id);
	ds_list_add(global.escaperoom, id);
	global.combo++;
	global.enemykilled++;
}
global.combotime = 60;
with (instance_create(x, y, obj_sausageman_dead))
	sprite_index = spr_monsterpineapple_dead;
