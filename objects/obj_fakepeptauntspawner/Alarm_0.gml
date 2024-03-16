alarm[0] = 5;
var angle = 0;
switch dir
{
	case 0:
		angle = point_direction(0, 0, -1, 0);
		break;
	case 1:
		angle = point_direction(0, 0, -1, 1);
		break;
	case 2:
		angle = point_direction(0, 0, 0, 1);
		break;
	case 3:
		angle = point_direction(0, 0, 1, 1);
		break;
	case 4:
		angle = point_direction(0, 0, 1, 0);
		break;
	case 5:
		angle = point_direction(0, 0, 1, -1);
		break;
	case 6:
		angle = point_direction(0, 0, 0, -1);
		break;
	case 7:
		angle = point_direction(0, 0, -1, -1);
		break;
	case 8:
		alarm[0] = -1;
		alarm[1] = 140;
		exit;
		break;
}
var dis = 50;
var spd = 5;
with (instance_create(x + lengthdir_x(dis, angle), y + lengthdir_y(dis, angle), obj_fakepepprojectile))
{
	hsp = lengthdir_x(spd, angle);
	vsp = lengthdir_y(spd, angle);
	hithsp = hsp;
	hitvsp = vsp;
	spawnerID = other.id;
	if (place_meeting(x, y, obj_solid))
	{
		x = other.x;
		y = other.y;
	}
}
dir++;
if singleshot
{
	alarm[0] = -1;
	alarm[1] = 140;
}
