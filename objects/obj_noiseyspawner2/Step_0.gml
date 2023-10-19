var b = true;
with (obj_bosscontroller)
{
	if (state == states.arenaintro)
		b = false;
}
with (obj_noisey)
	b = false;
with (obj_noiseboss)
{
	if ((state == states.arenaintro || state == states.stun) || phase == 1)
		b = false;
}
if (b)
{
	if (spawnbuffer > 0)
		spawnbuffer--;
	else
	{
		spawnbuffer = spawnmax;
		with (instance_create(x, y, obj_noisey))
		{
			instance_create(x, y, obj_genericpoofeffect);
			important = true;
			state = states.stun;
			bounce = true;
			stunned = 10;
			image_xscale = other.image_xscale;
		}
		if (x == xstart)
			x = 832;
		else
			x = xstart;
		image_xscale *= -1;
	}
}
