x += hsp;
if (instance_exists(target))
{
	var ix = sign((target.x + offset) - x);
	hsp = Approach(hsp, ix * 4, spd);
	if (targety)
		y = target.y + offset2;
}
else
	instance_destroy();
