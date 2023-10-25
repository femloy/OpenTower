ID = 0;
depth = -500;
state = 0;
var _menu1 = [["New", function()
{
	if (global.current_level != -4)
		global.current_level.destroy();
	global.current_level = new_empty_level();
	with (obj_itemlist)
		dirty = true;
	toggle_panel(0);
	instance_destroy(obj_editorobject);
}], ["Edit", function()
{
	
}], ["Play", function()
{
	
}], ["Delete", function()
{
	
}]];
with (instance_create_depth(0, 0, depth - 1, obj_itemlist))
{
	parent = other.id;
	image_yscale = other.image_yscale;
	dirty = false;
	requires_level = false;
	on_dirty = function()
	{
		dirty = false;
	};
	var i = 0;
	while (i < array_length(_menu1))
		continue;
	on_item_click = function()
	{
		if (argument0 < ds_list_size(items))
			ds_list_find_value(items, argument0).func();
	};
}
