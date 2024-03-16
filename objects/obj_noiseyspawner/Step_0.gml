var b = false;
with obj_bosscontroller
{
	if state == states.arenaintro
		b = false;
}
with obj_noisey
	b = false;
with obj_noiseboss
{
	if (state == states.arenaintro || state == states.stun || wastedhits >= 6)
		b = false;
}
if (instance_exists(rockID))
	b = false;
if b
{
	if spawnbuffer > 0
		spawnbuffer--;
	else
	{
		spawnbuffer = spawnmax;
		if obj_player1.ispeppino && !global.swapmode
		{
			with (instance_create(disx1, -64, obj_noisey))
			{
				important = true;
				x_to = other.disx2;
				y_to = irandom_range(other.disy1, other.disy2);
				state = states.float;
				bounce = true;
				stunned = 10;
			}
		}
		else
		{
			with (instance_create(disx1, 0, obj_doiserock))
			{
				other.rockID = id;
				create_particle(x, y, particle.genericpoofeffect);
			}
		}
	}
}
