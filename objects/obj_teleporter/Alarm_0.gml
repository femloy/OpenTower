with obj_teleporter
{
	if trigger == other.trigger && start == 0
	{
		other.player.x = x;
		other.player.y = y - 20;
	}
}
alarm[1] = 10;
