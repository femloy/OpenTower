repeat irandom_range(1, 3)
	create_heatpuff(x + 64 + irandom_range(-24, 24), y + 40);
with obj_player1
{
	if sprite_index == spr_playerN_bombend && image_index < 24
	{
		repeat (1 + random(2))
		{
			with (create_heatpuff(x + irandom_range(-24, 24), y))
				depth = -14;
		}
	}
}
alarm[0] = 10 + irandom_range(-2, 5);
