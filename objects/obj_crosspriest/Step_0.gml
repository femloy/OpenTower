mask_index = spr_priest_idle;
if sprite_index == spr_crosspriest_pray
{
	with obj_player1
	{
		if holycross <= 0
			other.sprite_index = spr_crosspriest_idle;
	}
}
