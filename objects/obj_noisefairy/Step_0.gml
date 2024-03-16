var tx = playerid.x;
var ty = playerid.y - 60;
var acc = 0.2;

switch state
{
	case 0:
		state++;
		xoffset = x - tx;
		yoffset = y - ty;
		break;
	
	case 1:
		depth = -99;
		x = tx + xoffset;
		y = ty + yoffset;
		xoffset = Approach(xoffset, 0, 24);
		yoffset = Approach(yoffset, 0, 24);
		if xoffset == 0 && yoffset == 0
		{
			alarm[1] = 2;
			state++;
		}
		break;
	
	case 2:
		x = lerp(x, tx, 0.2);
		y = lerp(y, ty, 0.2);
		if obj_player1.grounded && obj_player1.vsp > 0
			state++;
		break;
	
	case 3:
		x += 8;
		y -= 12;
		if !bbox_in_camera(view_camera[0], 10)
			instance_destroy();
		break;
}
