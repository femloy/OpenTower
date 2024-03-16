if other.ispeppino && !global.swapmode
{
	with obj_player
	{
		if (state == states.knightpep || state == states.knightpepslopes)
		{
			global.combotime = 60;
			instance_destroy(other);
		}
	}
	if other.state != states.ghost
	{
		sprite_index = spr_grandpa_punch;
		image_index = 0;
		if !global.swapmode
		{
			other.hurted = false;
			other.flash = false;
		}
		scr_hurtplayer(other);
	}
	else
	{
		global.combotime = 60;
		instance_destroy();
	}
}
else if (other.instakillmove == true || other.state == states.handstandjump || other.state == states.mach2)
{
	var t = other.id;
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	notification_push(notifs.baddie_kill, [room, id, object_index]);
	global.combotime = 60;
	instance_create(x, y, obj_bangeffect);
	instance_create(x, y, obj_genericpoofeffect);
	with (instance_create(x, y, obj_sausageman_dead))
	{
		image_xscale = -t.xscale;
		sprite_index = spr_grandpa_dead;
		hsp = t.xscale * 10;
	}
	instance_destroy(id, false);
}
