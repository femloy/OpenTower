function load_level_update(argument0) //load_level_update
{
	var path = (working_directory + concat("/levels/", argument0, "/"))
	if save_step == -1
	{
		save_step++
		load_array = []
		for (var file = file_find_first((path + "rooms/*.json"), 0); file != ""; file = file_find_next())
		{
			trace("Loading file: ", file)
			array_push(load_array, ((path + "rooms/") + file))
		}
		if (array_length(load_array) <= 0)
			trace("Couldn't find any rooms")
		file_find_close()
	}
	else if (save_step < array_length(load_array))
	{
		var buffer = buffer_load(load_array[save_step++])
		var json_string = buffer_read(buffer, buffer_string)
		buffer_delete(buffer)
		var _room = json_parse(json_string)
		var new_room = new EditorRoom(_room.x, _room.y)
		new_room.width = _room.width
		new_room.height = _room.height
		for (var i = 0; i < array_length(_room.backgrounds); i++)
		{
			var b = _room.backgrounds[i]
			var bg = new RoomLayer()
			bg.layer_type = layertype.background
			bg.sprite_index = asset_get_index(b.sprite_index)
			bg.depth = b.depth
			array_push(new_room.backgrounds, bg)
		}
		for (i = 0; i < array_length(_room.instances); i++)
		{
			b = _room.instances[i]
			with (instance_create_depth(b.x, b.y, 0, obj_editorobject))
			{
				object = asset_get_index(b.object_index)
				ID = b.ID
				var key = ds_map_find_first(other.object_map)
				var size = ds_map_size(other.object_map)
				for (var j = 0; j < size; j++)
				{
					for (var l = 0; l < ds_list_size(category); l++)
					{
						var object_template = ds_list_find_value(category, l)
						if object_template.ID == ID
						{
							object_apply_values(object_template)
							j = size + 1
							break
						}
					}
					key = ds_map_find_next(other.object_map, key)
				}
				if (!(is_undefined(ds_map_find_value(obj_editor.properties_map, ID))))
				{
					var list = ds_map_find_value(obj_editor.properties_map, ID)
					for (j = 0; j < array_length(list); j++)
					{
						var property = list[j]
						variable_instance_set(id, property, variable_struct_get(b, property))
					}
				}
				array_push(new_room.instances, id)
				instance_deactivate_object(id)
			}
		}
		ds_list_add(global.current_level.rooms, new_room)
	}
	else
	{
		editor_state = saved_editor_state
		change_room(ds_list_find_value(global.current_level.rooms, 0))
		with obj_itemlist
			dirty = true
	}
}
