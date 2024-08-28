scr_get_languages();

// texture pages
tex_list = -4;
var group_arr = ["hubgroup", "playergroup", "noisegroup", "introgroup", "smallgroup", "hudgroup"];
tex_list = array_create(0);
tex_pos = 0;
for (var i = 0; i < array_length(group_arr); i++)
{
	var _tex_array = texturegroup_get_textures(group_arr[i]);
	for (var j = 0; j < array_length(_tex_array); j++)
		array_push(tex_list, _tex_array[j]);
}
tex_max = array_length(tex_list);

// external graphics
ext_tex_pos = 0;
lang_max = ds_queue_size(global.lang_to_load);
lang_tex_max = 0;
var arr = [];
for (var file = file_find_first("lang/graphics/", 0); file != ""; file = file_find_next())
	lang_tex_max++;
lang_tex_max -= lang_max;
lang_tex = lang_tex_max;
file_find_close();
lang_init = false;

alarm[0] = 70;
