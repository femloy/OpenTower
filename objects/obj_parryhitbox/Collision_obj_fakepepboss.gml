var state = other.state;
var attackspeed = other.attackspeed;
if (state == states.freefall || (state == states.mach2 && attackspeed >= 18) || state == states.Sjump || (state == states.throwing && attackspeed > 4))
{
	if (!collisioned)
		event_user(0);
}
