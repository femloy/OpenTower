if !active
	exit;

var accel = 0.4
switch state
{
	case comp_state.docked:
		switch dock
		{
			case comp_dock.right:
				x = lerp(x, CAMERA_WIDTH, accel)
				break
			case comp_dock.left:
				x = lerp(x, (-sprite_width), accel)
				break
			case comp_dock.top:
				y = lerp(y, (-sprite_height), accel)
				break
			case comp_dock.bottom:
				y = lerp(y, CAMERA_HEIGHT, accel)
				break
		}
		break;
	
	case comp_state.undocked:
		switch dock
		{
			case comp_dock.right:
			case comp_dock.left:
				x = lerp(x, xstart, accel)
				break
			case comp_dock.top:
			case comp_dock.bottom:
				y = lerp(y, ystart, accel)
				break
		}
		break
}
