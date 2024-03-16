if other.state == 0
{
	if (ds_list_find_index(global.saveroom, id) == -1)
		ds_list_add(global.saveroom, id);
	if alarm[0] == -1
		alarm[0] = 1;
	other.state++;
}
