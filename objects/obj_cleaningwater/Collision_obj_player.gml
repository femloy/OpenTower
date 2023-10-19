with (other)
{
	if (state == states.cheesepep || skateboarding == 1 || state == states.boxxedpep || state == states.cheesepepstick || state == states.cheesepepstickside || state == states.cheesepepstickup)
	{
		state = states.normal;
		boxxed = false;
		skateboarding = false;
	}
}
