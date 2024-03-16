if (ds_list_find_index(global.saveroom, id) == -1 && start)
{
	ds_list_add(global.saveroom, id);
	with obj_horsey
	{
		if (state == states.normal && ds_list_find_index(global.saveroom, id) == -1 && ds_list_find_index(global.baddieroom, id) == -1)
			ds_list_add(global.baddieroom, id);
	}
}
global.horse = false;
