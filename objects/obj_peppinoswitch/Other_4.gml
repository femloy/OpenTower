if obj_player1.ispeppino
{
	if !obj_player1.isgustavo
		sprite_index = spr_gustavosign;
	else
	{
		with obj_gustavoswitch
			sprite_index = spr_pepsign;
	}
}
else if !obj_player1.noisecrusher
	sprite_index = spr_noisesign;
else
{
	with obj_gustavoswitch
		sprite_index = spr_noisesign;
}
