if room == rm_editor
	exit;
if (ds_list_find_index(global.saveroom, id) == -1)
{
	ds_list_add(global.saveroom, id);
	if object_index == obj_escapecollect
		ds_list_add(global.escaperoom, id);
}
if !gotowardsplayer
	scr_ghostcollectible();
