ds_map_destroy(editor_states);
var key = ds_map_find_first(object_map);
for (var i = 0; i < ds_map_size(object_map); i++)
{
	ds_list_destroy(ds_map_find_value(object_map, key));
	key = ds_map_find_next(object_map, key);
}
ds_map_destroy(object_map);
ds_list_destroy(rooms);
ds_list_destroy(backgrounds_list);
