if state == states.normal && other.grounded
{
	depth = -500;
	ds_list_add(global.saveroom, id);
	playerid = other.id;
	x = other.x;
	y = other.y - 60;
	state = states.gottreasure;
	cutscenebuffer = 40;
	effectid = instance_create(x, y, obj_treasureeffect);
	movespeed = 2;
	with other
	{
		fmod_event_one_shot_3d("event:/sfx/misc/secretfound", x, y);
		state = states.gottreasure;
		hsp = 0;
		vsp = 0;
	}
}
