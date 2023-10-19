if (state == states.stun && thrown && other.state != states.tumble && other.state != states.stun)
{
	with (other)
	{
		state = states.stun;
		vsp = -5;
		stunstate = 0;
		stunned = 100;
	}
}
