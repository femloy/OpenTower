if player == 1
{
	if got && obj_player1.state != states.gottreasure
		instance_destroy();
}
if player == 2
{
	if got && obj_player2.state != states.gottreasure
		instance_destroy();
}
if player == 0
	y = Wave(ystart - 5, ystart + 5, 2, 2);
if (player == 0 && place_meeting(x, y, obj_player))
{
	var num = instance_place_list(x, y, obj_player, global.instancelist, false);
	for(var i = 0; i < num; i++)
	{
		var _player = ds_list_find_value(global.instancelist, i);
		with _player
		{
			if state != states.gotoplayer
			{
				treasure_x = x;
				treasure_y = y;
				treasure_room = room;
				ds_list_add(global.saveroom, other.id);
				global.treasure = true;
				global.combotime = 60;
				hsp = 0;
				vsp = 0;
				if !other.got
				{
					other.alarm[0] = 150;
					state = states.gottreasure;
					fmod_event_one_shot("event:/sfx/misc/foundtreasure");
				}
				other.got = true;
				other.x = x - 18;
				other.y = y - 35;
				other.effectid = instance_create(other.x + 18, other.y, obj_treasureeffect);
				other.vsp = 0;
				other.depth = -20;
				obj_tv.showtext = true;
				obj_tv.message = "YOU GOT A TOWER SECRET TREASURE!!!";
				obj_tv.alarm[0] = 200;
				other.player = (object_index == obj_player1) ? 1 : 2;
				ds_list_clear(global.instancelist);
				break;
			}
		}
	}
	ds_list_clear(global.instancelist);
}
