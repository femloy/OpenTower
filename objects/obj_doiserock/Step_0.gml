hsp = (dir * 2.5);
if grounded && vsp > 0
{
	fmod_event_one_shot_3d("event:/sfx/playerN/doiserock", x, y);
	vsp = -(7 - clamp(bounce, 0, 4));
	bounce++;
	anglespd = 8;
	if dir == 0
		dir = choose(-1, 1);
	angle += -dir * 20;
	create_particle(x, y - 21, particle.landcloud);
}
if place_meeting(x + sign(hsp), y, obj_solid)
	dir *= -1;
if dir != 0
{
	anglespd = Approach(anglespd, 1, 0.2);
	angle += (anglespd * -dir);
	image_xscale = dir;
	if cooldown > 0
		cooldown--;
	else
		instance_destroy();
}
scr_collide();
