function scr_get_gamepadicon(button)
{
	switch button
	{
		case gp_face3:
			return 0;
			break;
		case gp_face1:
			return 1;
			break;
		case gp_face2:
			return 2;
			break;
		case gp_face4:
			return 3;
			break;
		case gp_padu:
			return 4;
			break;
		case gp_padd:
			return 5;
			break;
		case gp_shoulderlb:
			return 6;
			break;
		case gp_shoulderr:
			return 7;
			break;
		case gp_shoulderl:
			return 8;
			break;
		case gp_shoulderrb:
			return 9;
			break;
		case gp_stickl:
			return 10;
			break;
		case gp_stickr:
			return 11;
			break;
		case gp_padl:
			return 16;
			break;
		case gp_padr:
			return 17;
			break;
	}
	return noone;
}
