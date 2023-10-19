if (!collide)
{
	if (other.state == states.handstandjump || other.state == states.lungeattack)
	{
		other.state = states.bombdelete;
		collide = true;
	}
}
