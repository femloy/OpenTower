if (!instance_exists(obj_titlecard))
{
	alarm[1] = 8 + irandom(5);
	fmod_event_one_shot_3d("event:/sfx/hub/gusbrickfightball", x, y);
	with (create_debris(x, y, spr_slapstar))
		vsp = -irandom_range(5, 10);
	with (create_debris(x, y, spr_baddiegibs))
		vsp = -irandom_range(5, 10);
}
