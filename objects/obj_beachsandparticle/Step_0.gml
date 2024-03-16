with obj_player1
{
	if (hsp != 0 && grounded && !place_meeting(x, y + 1, obj_nosand) && !place_meeting(x, y + 1, obj_current) && !place_meeting(x, y + 1, obj_water) && (floor(image_index) % 10) == 0)
		create_debris(x, y + 43, spr_beachsandparticle);
}
