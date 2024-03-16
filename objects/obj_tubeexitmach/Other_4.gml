switch object_index
{
	case obj_tubeexitdownexit:
		tube_angle = 270;
		break;
	case obj_tubeexitSjump:
		tube_angle = 90;
		break;
	case obj_tubeenter:
		tube_angle = point_direction(x, y, x - hsp, y - vsp);
		break;
	case obj_tubeexitmach:
		tube_angle = 0;
		break;
}
x += (32 * image_xscale);
y += (32 * image_yscale);
sprite_index = tube_spr;
