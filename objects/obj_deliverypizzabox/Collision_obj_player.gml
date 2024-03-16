if other.ispeppino && !global.swapmode
{
	instance_destroy();
	var follower = instance_create(x, y, obj_deliveryfollower);
	instance_destroy(obj_clock, false);
	with (instance_create_unique(x, y, obj_clock))
	{
		objectID = follower.id;
		timedgate = false;
	}
}
else
{
	var t = other.id;
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	notification_push(notifs.baddie_kill, [room, id, object_index]);
	ds_list_add(global.baddieroom, id);
	global.combotime = 60;
	instance_create(x, y, obj_bangeffect);
	instance_create(x, y, obj_genericpoofeffect);
	with (instance_create(x, y, obj_sausageman_dead))
	{
		image_xscale = -t.xscale;
		sprite_index = spr_gnomepizza_hurt;
		hsp = t.xscale * 10;
	}
	instance_destroy(id, false);
}
