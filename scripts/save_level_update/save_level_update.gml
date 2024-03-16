function save_level_update(levelname)
{
	var path = concat("levels/", levelname, "/");
	if save_step == -1
	{
		var struct = {};
		save_step++;
	}
	else if (save_step < ds_list_size(global.current_level.rooms))
	{
		var _room = ds_list_find_value(global.current_level.rooms, save_step);
		struct = 
		{
			width: _room.width,
			height: _room.height,
			x: _room.x,
			y: _room.y,
			instances: array_create(0),
			backgrounds: array_create(0),
			tiles: array_create(0)
		};
		for (var i = 0; i < array_length(_room.backgrounds); i++)
		{
			var b = _room.backgrounds[i];
			var bg = 
			{
				sprite_index: sprite_get_name(b.sprite_index),
				depth: b.depth
			}

			array_push(struct.backgrounds, bg);
		}
		for (i = 0; i < array_length(_room.instances); i++)
		{
			b = _room.instances[i];
			if _room != global.current_level.current_room
				instance_activate_object(b);
			with b
			{
				var object_struct = 
				{
					x: b.x,
					y: b.y,
					object_index: object_get_name(b.object),
					ID: b.ID
				};
				if (!is_undefined(ds_map_find_value(obj_editor.properties_map, ID)))
				{
					for (var j = 0; j < array_length(list); j++)
					{
						var property = list[j];
						variable_struct_set(object_struct, property, variable_instance_get(id, property));
					}
				}
				array_push(struct.instances, object_struct);
			}
			if _room != global.current_level.current_room
				instance_deactivate_object(b);
		}
		var json = json_stringify(struct);
		var buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
		buffer_write(buffer, buffer_string, json);
		buffer_save(buffer, concat(path, "rooms/", _room.name, ".json"));
		buffer_delete(buffer);
		save_step++;
	}
	else
		editor_state = saved_editor_state;
}
