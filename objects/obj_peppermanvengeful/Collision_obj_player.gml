if (!other.ispeppino && (other.instakillmove == true || other.state == states.handstandjump || other.state == states.mach2))
{
	var t = other.id;
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	notification_push(notifs.baddie_kill, [room, id, object_index]);
	ds_list_add(global.baddieroom, id);
	instance_create(x, y, obj_bangeffect);
	instance_create(x, y, obj_genericpoofeffect);
	with (instance_create(x, y, obj_sausageman_dead))
	{
		image_xscale = -t.xscale;
		sprite_index = spr_pepperman_hurtplayer;
		hsp = t.xscale * 10;
	}
	with (instance_create(x, y, obj_sausageman_dead))
	{
		image_xscale = -t.xscale;
		sprite_index = spr_peppermanglasses;
		hsp = t.xscale * 7;
		depth -= 1;
	}
	instance_destroy();
}
