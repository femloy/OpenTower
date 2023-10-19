with (other)
{
	if (key_up2)
	{
		if (state == states.normal)
			state = states.ratmount;
		else if (state == states.ratmount)
			state = states.normal;
	}
}
