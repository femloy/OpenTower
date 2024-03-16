switch state
{
	case states.titlescreen:
		if (!instance_exists(obj_fadeout))
		{
			if playerid.key_up2
				selected++;
			if playerid.key_down2
				selected--;
			selected = clamp(selected, 0, array_length(hub_array) - 1);
			if playerid.key_jump2
			{
				if hub_array[selected][0] != room
				{
					with obj_player
					{
						targetRoom = other.hub_array[other.selected][0];
						targetDoor = "A";
						if targetRoom == hub_farmland
							targetDoor = "F";
						if (check_player_coop())
						{
							state = states.normal;
							if other.isgustavo
								state = states.ratmount;
							movespeed = 0;
						}
					}
					instance_create(x, y, obj_fadeout);
				}
				else
				{
					state = states.normal;
					with obj_player
						state = states.normal;
				}
			}
		}
		break;
}
