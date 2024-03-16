var obj = obj_farmerpeasantoprojectile;
switch object_index
{
	case obj_farmer2follow:
		obj = obj_farmer2projectile;
		break;
	case obj_farmer3follow:
		obj = obj_farmer3projectile;
		break;
}
visible = !instance_exists(obj);
