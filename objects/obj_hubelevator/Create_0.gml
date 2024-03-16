state = states.normal;
hub_array[0] = [hub_reception, "RECEPTION"];
hub_array[1] = [hub_pizzatowerlobby, "PIZZA TOWER LOBBY"];
hub_array[2] = [hub_farmland, "FARMLAND"];
hub_array[3] = [hub_pizzalandexit, "PIZZALAND EXIT"];
hub_array[4] = [hub_industrialcomplex, "INDUSTRIAL COMPLEX"];
isgustavo = false;
playerid = -4;
selected = 0;
switch room
{
	case hub_room1:
		selected = 0;
		break;
	case hub_room2:
		selected = 1;
		break;
}
