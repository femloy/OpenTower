function cutscene_move_player(_player, _xto, _hsp, _threshold)
{
	var player = _player;
	var x_to = _xto;
	var max_hsp = _hsp;
	var threshold = _threshold;
	
	var finish = false;
	with player
	{
		sprite_index = spr_move;
		image_speed = 0.6;
		if (x < (x_to - threshold))
		{
			xscale = 1;
			if hsp < max_hsp
				hsp += 0.5;
			else
				hsp = max_hsp;
		}
		else if (x > (x_to + threshold))
		{
			xscale = -1;
			if hsp > -max_hsp
				hsp -= 0.5;
			else
				hsp = -max_hsp;
		}
		else
		{
			hsp = 0;
			finish = true;
		}
		if (place_meeting(x + hsp, y, obj_solid))
			finish = true;
	}
	if finish
		cutscene_end_action();
	with player
	{
		if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0 && character != "V")
		{
			instance_create(x, y + 43, obj_cloudeffect);
			steppy = true;
		}
		if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
			steppy = false;
	}
}
