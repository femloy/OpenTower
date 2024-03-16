if cooldown == 0
{
	instance_create(x, y, obj_bangeffect);
	cooldown = 30;
	hit = true;
	fmod_event_one_shot_3d("event:/sfx/misc/beerhit", x, y);
	vsp = random_range(-7, -10);
	hsp = random_range(5, 10) * other.xscale;
	spinspeed = random_range(5, 10) * other.xscale;
}
