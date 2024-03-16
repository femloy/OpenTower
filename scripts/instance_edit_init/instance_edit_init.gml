function instance_edit_init()
{
	object_map = ds_map_create()
	object_order_map = ds_map_create()
	component_map = ds_map_create()
	var objects = global.editor_data.objects
	for (var i = 0; i < array_length(objects); i++)
	{
		var category = objects[i]
		ds_map_set(object_map, category.name, ds_list_create())
		ds_map_set(object_order_map, category.name, category.order)
		for (var j = 0; j < array_length(category.objects); j++)
		{
			var obj = category.objects[j]
			var b = new EditorObject(obj.ID, obj.name, obj.sprite_index, obj.object_index)
			if variable_struct_exists(obj, "mask_index")
				b.mask_index = obj.mask_index
			ds_list_add(ds_map_find_value(object_map, category.name), b)
			if variable_struct_exists(obj, "components")
			{
				ds_map_set(component_map, obj.ID, obj.components)
				trace(obj.components)
			}
		}
	}
	selected_object = ds_list_find_value(ds_map_find_value(object_map, "General"), 0)
	selected_instance = -4
	instance_state = 0 // not an enum
}

