function scr_destroy_destructibles(xoffset, yoffset)
{
	if (!place_meeting(x + xoffset, y + yoffset, obj_destructibles))
		exit;
	
	var _num = instance_place_list(x + xoffset, y + yoffset, obj_destructibles, global.instancelist, false);
	var _destroy = false;
	
	if _num > 0
	{
		for (var i = 0; i < ds_list_size(global.instancelist); i++)
		{
			var inst = ds_list_find_value(global.instancelist, i);
			if (inst.object_index != obj_hungrypillar || object_index != obj_swapplayergrabbable)
				instance_destroy(inst);
			else
				_destroy = true;
		}
		ds_list_clear(global.instancelist);
	}
	if _destroy
		instance_destroy();
}
