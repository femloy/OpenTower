function warbg_start()
{
	if event_type == ev_draw && event_number == 0
	{
		var time = shader_get_uniform(shd_war, "time");
		var size = shader_get_uniform(shd_war, "size");
		var strength = shader_get_uniform(shd_war, "strength");
		shader_set(shd_war);
		shader_set_uniform_f(time, current_time / 1000);
		shader_set_uniform_f(size, 512, 512, Wave(0, 0.8, 8, 0));
		shader_set_uniform_f(strength, Wave(0, 0.2, 5, 0));
	}
}
function warbg_end()
{
	if event_type == ev_draw && event_number == 0
		shader_reset();
}
function pizzahead_bg_start()
{
	if event_type == ev_draw && event_number == 0
	{
		var time = shader_get_uniform(shd_rainbow, "u_time");
		var _speed = shader_get_uniform(shd_rainbow, "u_speed");
		shader_set(shd_rainbow);
		shader_set_uniform_f(time, current_time / 1000);
		shader_set_uniform_f(_speed, 1);
	}
}
function pizzahead_bg_end()
{
	if event_type == ev_draw && event_number == 0
		shader_reset();
}
function pizzahead_bg_init()
{
	// unused empty function
}
function warbg_generic(begin_script, end_script, layer_map = noone)
{
	var arr = ["Foreground_1", "Foreground_2", "Foreground_3", "Foreground_Ground1"];
	var lays = layer_get_all();
	for (var i = 0; i < array_length(lays); i++)
	{
		var _id = lays[i];
		if (layer_background_get_id(_id) >= 0)
		{
			var _found = false;
			for (var j = 0; j < array_length(arr); j++)
			{
				if (layer_get_name(_id) == arr[j])
					_found = true;
			}
			if (layer_map != -4 && is_undefined(ds_map_find_value(layer_map, layer_get_name(_id))))
				_found = false;
			if !_found
			{
				trace("Adding script to Background: ", layer_get_name(_id));
				layer_script_begin(_id, begin_script);
				layer_script_end(_id, end_script);
			}
			else
				trace("Excluding scripts to Background: ", layer_get_name(_id));
		}
	}
}
function warbg_init()
{
	if room != rank_room
		warbg_generic(warbg_start, warbg_end);
}
function warbg_stop()
{
	warbg_generic(-4, warbg_end);
}
