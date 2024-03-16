if cooldown == 0
{
	notification_push(notifs.cow_kick, [room]);
	if (ds_list_find_index(global.saveroom, id) == -1)
	{
		notification_push(notifs.cow_kick_count, [global.leveltosave]);
		ds_list_add(global.saveroom, id);
	}
	other.x = x - (image_xscale * 35);
	other.y = y;
	fmod_event_one_shot_3d("event:/sfx/misc/cowkick", other.x, other.y);
	fmod_event_one_shot_3d("event:/sfx/misc/cow", x, y);
	sprite_index = spr_cowkick;
	image_index = 0;
	with other
	{
		other.cooldown = 100;
		sprite_index = spr_rockethitwall;
		vsp = -11;
		xscale = -other.image_xscale;
		movespeed = 10;
		image_index = 0;
		state = states.slipbanan;
		instance_create(x, y, obj_bangeffect);
	}
}
