sprite_index = spr_gusbrickscared;
if (distance_to_object(obj_player1) <= 100)
{
	if ((obj_player1.x >= x && obj_player.xscale == -1) || (obj_player1.x <= x && obj_player.xscale == 1))
	{
		if obj_player1.xscale == 1
			sprite_index = spr_gusbricknotscaredL;
		else
			sprite_index = spr_gusbricknotscared;
	}
}
