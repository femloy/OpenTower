function scr_get_gamepadicon(button)
{
	switch button
	{
		case gp_face3:
			return 0;
		case gp_face1:
			return 1;
		case gp_face2:
			return 2;
		case gp_face4:
			return 3;
		case gp_padu:
			return 4;
		case gp_padd:
			return 5;
		case gp_shoulderlb:
			return 6;
		case gp_shoulderr:
			return 7;
		case gp_shoulderl:
			return 8;
		case gp_shoulderrb:
			return 9;
		case gp_stickl:
			return 10;
		case gp_stickr:
			return 11;
		case gp_padl:
			return 16;
		case gp_padr:
			return 17;
	}
	return noone;
}
