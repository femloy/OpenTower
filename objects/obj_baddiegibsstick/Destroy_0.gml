if (storedx != -4 && storedy != -4)
{
	var i = 0;
	if (!ds_list_empty(global.baddietomb))
	{
		repeat (ds_list_size(global.baddietomb))
		{
			var arr = ds_list_find_value(global.baddietomb, i);
			var tombRoom = arr[0];
			var X = arr[1];
			var Y = arr[2];
			if (tombRoom == room && X == storedx && Y == storedy)
			{
				ds_list_delete(global.baddietomb, i);
				break;
			}
			i++;
		}
	}
}
