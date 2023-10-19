if (playerid != -4)
{
	with (playerid)
	{
		hsp = 0;
		vsp = 0;
	}
	x = playerid.x;
	y = playerid.y - 35;
	if (playerid.state != states.gottreasure)
		instance_destroy();
}
if (!got)
{
	var num = instance_place_list(x, y, obj_player, global.instancelist, false);
	for(var i = 0; i < num; i++)
	{
		var _player = ds_list_find_value(global.instancelist, i);
		with (_player)
		{
			if (state != states.gotoplayer)
			{
				if (grounded)
				{
					hsp = 0;
					vsp = 0;
					state = states.gottreasure;
					with (other)
					{
						got = true;
						if (got_func != -4)
							got_func();
						alarm[0] = 150;
						sprite_index = spr_got;
						playerid = other.id;
					}
				}
				ds_list_clear(global.instancelist);
				break;
			}
		}
	}
	ds_list_clear(global.instancelist);
}
