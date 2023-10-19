if (ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id);
	if (object_index == obj_escapecollectbig)
		ds_list_add(global.escaperoom, id);
}
if (visible)
	scr_ghostcollectible();
