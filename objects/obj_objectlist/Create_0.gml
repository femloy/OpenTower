event_inherited();
object_list = -4;
surface = -4;
scroll_y = 0;
scroll_ymax = 0;
hovered_object = -1;
OnSelect = function()
{
	if (hovered_object >= 0 && object_list != -4)
	{
		obj_editor.object = ds_list_find_value(object_list, hovered_object);
		obj_editor.state = 0;
		if (parent.OnDeselect != -4)
			parent.OnDeselect();
		selected = false;
	}
};
