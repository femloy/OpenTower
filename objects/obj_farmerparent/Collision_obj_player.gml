instance_destroy();
global.hasfarmer[pos] = true;
other.farmerpos = pos;
switch object_index
{
	case obj_farmerpeasanto:
		instance_create_unique(x, y, obj_farmer1follow);
		break;
	case obj_farmer2:
		instance_create_unique(x, y, obj_farmer2follow);
		break;
	case obj_farmer3:
		instance_create_unique(x, y, obj_farmer3follow);
		break;
}
