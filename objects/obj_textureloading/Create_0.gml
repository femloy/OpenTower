scr_get_languages();
tex_list = -4;
var group_arr = ["hubgroup", "playergroup", "introgroup", "smallgroup", "hudgroup"];
tex_list = array_create(0);
tex_pos = 0;
for (var i = 0; i < array_length(group_arr); i++)
{
	var _tex_array = texturegroup_get_textures(group_arr[i]);
	for (var j = 0; j < array_length(_tex_array); j++)
		array_push(tex_list, _tex_array[j]);
}
tex_max = array_length(tex_list);
alarm[0] = 70;
