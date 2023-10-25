if (fadein)
{
	fadealpha = Approach(fadealpha, 1, 0.03);
	if (fadealpha >= 1)
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
	if (!pos_player)
	{
		if (!instance_exists(obj_player1))
			instance_activate_object(obj_player1);
		else
		{
			pos_player = true;
			obj_player1.x = obj_player1.backtohubstartx;
			obj_player1.y = obj_player1.backtohubstarty - (SCREEN_HEIGHT * 2);
			obj_player1.state = states.backtohub;
			obj_player1.sprite_index = obj_player1.spr_slipbanan1;
			obj_player1.image_index = 10;
		}
	}
	fadealpha = Approach(fadealpha, 0, 0.03);
	if (fadealpha <= 0)
		instance_destroy();
}
