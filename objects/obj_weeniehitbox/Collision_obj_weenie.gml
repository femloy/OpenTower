if (other.id != baddieID && other.state != states.tumble && other.state != states.stun)
{
	with (other)
	{
		stunstate = 1;
		stuntimer = stunmax;
		stunned = 0;
		state = states.tumble;
		vsp = -6;
		stunstate = 1;
	}
}
