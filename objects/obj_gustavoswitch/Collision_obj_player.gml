if (global.switchbuffer == 0 && global.panic == escape)
{
	with (other)
	{
		hsp = 0;
		vsp = 0;
		visible = false;
		state = states.actor;
	}
	fmod_event_one_shot("event:/sfx/misc/pepgusswitch");
	create_particle(x, y, particle.genericpoofeffect);
	sprite_index = spr_gustavoswitch1;
	global.switchbuffer = 200;
	playerid = other.id;
	with (obj_peppinoswitch)
	{
		playerid = other.playerid;
		sprite_index = spr_peppinoswitch2;
		image_index = 0;
	}
	with (instance_create(0, 0, obj_charswitch_intro))
		spr = spr_backtopeppino;
}
