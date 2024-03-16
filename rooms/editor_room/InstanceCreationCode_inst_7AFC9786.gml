ID = obj_noisecredit
depth = -500
state = states.normal
var _menu1 = [
	["New", function() {
		if (global.current_level != noone)
			global.current_level.destroy()
		global.current_level = new_empty_level()
		with (obj_itemlist)
			dirty = true
		toggle_panel(obj_noisecredit)
		instance_destroy(obj_editorobject)
	}],
	["Edit", function() {}],
	["Play", function() {}],
	["Delete", function() {}]
];
with (instance_create_depth(0, 0, (depth - 1), obj_itemlist))
{
	parent = other.id
	image_yscale = other.image_yscale
	dirty = false
	requires_level = 0
	on_dirty = function()
	{
		dirty = false
	}

	for (var i = 0; i < array_length(_menu1); i++)
	{
		ds_list_add(items, 
		{
			name: _menu1[i][0],
			func: _menu1[i][1]
		})
	}
	on_item_click = function(argument0)
	{
		if (argument0 < ds_list_size(items))
			ds_list_find_value(items, argument0).func()
	}
}
