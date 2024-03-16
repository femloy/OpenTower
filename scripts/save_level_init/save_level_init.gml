function save_level_init()
{
	properties_map = ds_map_create()
	for (var i = 0; i < array_length(global.editor_data.objects); i++)
	{
		var category = global.editor_data.objects[i]
		for (var j = 0; j < array_length(category.objects); j++)
		{
			var obj = category.objects[j]
			if variable_struct_exists(obj, "properties")
				ds_map_set(properties_map, obj.ID, obj.properties)
		}
	}
	save_step = -1
	file_async_list = ds_list_create()
}

function save_level_clean()
{
	ds_list_destroy(file_async_list)
	ds_map_destroy(properties_map)
}
