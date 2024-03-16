if (!place_meeting(x, y, obj_solid))
	scr_collide();
else
{
	y += vsp;
	if vsp < 20
		vsp += grav;
}
if grounded && vsp > 0
{
	if bounce == 0
		vsp = -5;
	bounce += 1;
	if bounce < 2
		create_particle(x, y + 30, particle.landcloud);
}
if flashbuffer > 0
	flashbuffer--;
else
	flash = false;
