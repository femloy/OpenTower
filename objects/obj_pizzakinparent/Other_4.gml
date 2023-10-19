event_inherited();
switch (object_index)
{
	case obj_pizzakincheese:
		if (!global.cheesefollow)
			instance_destroy();
		break;
	case obj_pizzakintomato:
		if (!global.tomatofollow)
			instance_destroy();
		break;
	case obj_pizzakinpineapple:
		if (!global.pineapplefollow)
			instance_destroy();
		break;
	case obj_pizzakinshroom:
		if (!global.shroomfollow)
			instance_destroy();
		break;
	case obj_pizzakinsausage:
		if (!global.sausagefollow)
			instance_destroy();
		break;
}
