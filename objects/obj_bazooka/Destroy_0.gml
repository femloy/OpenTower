if (sprite_index != spr_piraneapple_projectile)
{
	with (instance_create(x, y, obj_explosioneffect))
	{
		sprite_index = spr_bombexplosion;
		image_speed = 0.35;
	}
	if (bbox_in_camera(view_camera[0], 78))
	{
		GamepadSetVibration(0, 1, 1, 0.9);
		GamepadSetVibration(1, 1, 1, 0.9);
		fmod_event_one_shot_3d("event:/sfx/misc/explosion", x, y);
	}
	notification_push(notifs.bazooka_explode, [room]);
	with (baddieID)
	{
		if (bombreset > 20)
			bombreset = 20;
	}
	destroy_sounds([snd]);
}
else
{
	global.combo++;
	global.combotime = 60;
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = spr_piraneapple_dead;
}
