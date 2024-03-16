if fadein
{
	fadealpha = Approach(fadealpha, 1, 0.03);
	if fadealpha >= 1
	{
		if (!instance_exists(obj_player1))
			instance_activate_object(obj_player1);
		else
		{
			fadein = false;
			pos_player = false;
			obj_player1.targetRoom = obj_player1.backtohubroom;
			obj_player2.targetRoom = obj_player1.backtohubroom;
			room_goto(obj_player1.backtohubroom);
		}
	}
}
else
{
	fadealpha = Approach(fadealpha, 0, 0.03);
	if fadealpha <= 0
		instance_destroy();
}
