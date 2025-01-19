if !active
	exit;

var accel = 0.4
switch state
{
	case editor_panel_states.docked:
		switch dock
		{
			case editor_direction.right:
				x = lerp(x, CAMERA_WIDTH, accel)
				break
			case editor_direction.left:
				x = lerp(x, (-sprite_width), accel)
				break
			case editor_direction.top:
				y = lerp(y, (-sprite_height), accel)
				break
			case editor_direction.bottom:
				y = lerp(y, CAMERA_HEIGHT, accel)
				break
		}
		break;
	
	case editor_panel_states.undocked:
		switch dock
		{
			case editor_direction.right:
			case editor_direction.left:
				x = lerp(x, xstart, accel)
				break
			case editor_direction.top:
			case editor_direction.bottom:
				y = lerp(y, ystart, accel)
				break
		}
		break
}
