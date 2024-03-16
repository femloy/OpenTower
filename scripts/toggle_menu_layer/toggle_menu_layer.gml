function toggle_menu_layer(_menu_layer)
{
	with obj_uiparent
	{
		if menu_layer == _menu_layer
			active = true;
		else
			active = false;
	}
}
