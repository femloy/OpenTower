with obj_player1
{
	if shotgunAnim == 1
	{
		if state != states.normal && state != states.crouch && state != states.shotgunfreefall && state != states.freefallland && state != states.jump && state != states.handstandjump
			other.visible = true;
		else
			other.visible = false;
	}
	other.x = x - (20 * xscale);
	other.y = y;
	other.image_xscale = -xscale;
}
if room == rank_room
	visible = false;
