switch (state)
{
	case states.idle:
		cliff_index = 1;
		var tx = SCREEN_WIDTH - 73;
		gerome_x = Approach(gerome_x, tx, 2);
		if (gerome_x == tx)
		{
			alarm[0] = 1;
			state = states.jump;
			gerome_spr = spr_geromelever;
			gerome_index = 0;
		}
		break;
	case states.jump:
		cliff_index = 0;
		peppino_y = Approach(peppino_y, 0, 1);
		peppino_x = peppino_xstart + irandom_range(-1, 1);
		if (peppino_y < ((SCREEN_HEIGHT / 2) - 120))
		{
			if (!instance_exists(obj_fadeout))
			{
				with (obj_player)
				{
					targetRoom = other.targetRoom;
					targetDoor = other.targetDoor;
					if (check_player_coop())
						state = states.door;
				}
				instance_create(0, 0, obj_fadeout);
			}
		}
		break;
}
gerome_index += 0.35;
peppino_index += 0.35;
