if cooldown > 0
{
	cooldown--;
	active = false;
}
else if !active
{
	active = true;
	create_particle(x, y, particle.genericpoofeffect, 0);
}
visible = active;
