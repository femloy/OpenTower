if (collision)
	event_inherited();
else
{
	x += hsp;
	y += vsp;
	if (vsp < 20)
		vsp += grav;
	if (vsp > 0)
		collision = true;
}
