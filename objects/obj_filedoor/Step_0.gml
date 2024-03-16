if (distance_to_object(obj_player1) < 50)
{
	var str = "";
	if obj_player1.state == states.bombdelete
		str = "DELETE ";
	with obj_tv
	{
		showtext = true;
		alarm[0] = 2;
		message = concat(str, "FILE ", other.file);
	}
}
