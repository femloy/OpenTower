var _tank = id;
var _baddie = other.id;
with _baddie
{
	if (instance_exists(baddieID) && baddieID != other.id)
	{
		if baddieID.state == states.stun && baddieID.thrown == 1
		{
			with _tank
				instance_destroy();
		}
	}
}
