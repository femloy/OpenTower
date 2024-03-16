if state == states.normal
{
	hsp = 0;
	state = states.idle;
	alarm[0] = 80 + irandom(100);
}
else
{
	image_xscale *= -1;
	state = states.normal;
	alarm[0] = 60 + irandom(120);
}
