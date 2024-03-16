function scr_deactivate_escape()
{
	with obj_baddie
	{
		hitboxcreate = false;
		boundbox = false;
		event_perform(ev_other, ev_room_start);
	}
	with obj_hiddenobject
	{
		if (!ds_list_empty(deactivatedlist))
		{
			for (var i = 0; i < ds_list_size(deactivatedlist); i++)
			{
				var _id = ds_list_find_value(deactivatedlist, i);
				if (object_get_parent(_id) == obj_baddie)
					_id.boundbox = false;
				instance_deactivate_object(_id);
			}
		}
	}
	with obj_arenaspawn
	{
		if (state == states.spawnenemy || state == states.arena)
		{
			if (!ds_list_empty(baddielist))
			{
				for (i = 0; i < ds_list_size(baddielist); i++)
				{
					var b = ds_list_find_value(baddielist, i);
					if (b[0] != wave && instance_exists(b[1]))
					{
						b[1].boundbox = false;
						instance_deactivate_object(b[1]);
					}
				}
			}
		}
		else if (!ds_list_empty(baddielist))
		{
			for (i = 0; i < ds_list_size(baddielist); i++)
			{
				b = array_get(ds_list_find_value(baddielist, i), 1);
				if (instance_exists(b))
				{
					b.boundbox = false;
					instance_deactivate_object(b);
				}
			}
		}
	}
}
