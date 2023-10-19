tex_arr = array_create(0);
for (var i = 0; i < array_length(group_arr); i++)
{
	var _tex_array = texturegroup_get_textures(group_arr[i])
	for (var j = 0; j < array_length(_tex_array); j++)
		array_push(tex_arr, _tex_array[j]);
}
if (offload_arr != -4)
{
	for (var i = 0; i < array_length(offload_arr); i++)
	{
		texture_flush(offload_arr[i]);
		trace("Flushing texture: ", offload_arr[i]);
	}
}
global.offload_tex = array_create(0);
array_copy(global.offload_tex, 0, tex_arr, 0, array_length(tex_arr));
alarm[1] = 1;
