with (obj_player1)
{
	if (hsp != 0 && grounded && (floor(image_index) % 10) == 0)
		create_debris(x, y + 43, spr_planetgoo);
}
