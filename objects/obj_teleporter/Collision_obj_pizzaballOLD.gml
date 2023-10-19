if (start == 1)
{
	if (other.visible == 1)
	{
		repeat (8)
			create_particle(x + random_range(50, -50), y + random_range(50, -50), particle.teleporteffect, 0);
		alarm[2] = 25;
		other.visible = false;
		other.vsp = 0;
		other.hsp = 0;
	}
}
