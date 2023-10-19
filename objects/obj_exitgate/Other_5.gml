if (drop && global.panic && dropstate != states.normal && ds_list_find_index(global.baddieroom, id) == -1)
	ds_list_add(global.baddieroom, id);
global.prank_cankillenemy = false;
