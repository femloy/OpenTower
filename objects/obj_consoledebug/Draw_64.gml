if state > 0
{
	draw_set_font(-1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	var height = string_height("ABC")
	var yy = 0
	var command_max_width = 0
	for (var i = 0; i < array_length(commands); i++)
	{
		var w = string_width(commands[i].name)
		if command_max_width < w
			command_max_width = w
	}
	for (i = selected; i < array_length(commands); i++)
	{
		var tc = c_white
		var bc = c_black
		if i == selected
		{
			tc = c_black
			bc = c_white
		}
		var txt = commands[i].name
		draw_rectangle_color(0, yy, command_max_width, (yy + height), bc, bc, bc, bc, false)
		draw_text_color(0, yy, txt, tc, tc, tc, tc, 1)
		yy += height
	}
	if state > 1
	{
		var cmd_args = commands[selected].args
		var max_widths = array_create(0)
		for (var i = 0; i < array_length(args) + 1; i++)
		{
			if (array_length(cmd_args) == i)
				break;
			
			var sel = arg_select;
			if (i < array_length(args))
				sel = args[i];
			
			var arg_array = cmd_args[i];
			yy = 0;
			
			for (var j = 0; j < array_length(arg_array); j++)
			{
				w = string_width(string(arg_array[j]));
				if max_width < w
					max_width = w;
			}
			
			if (array_length(max_widths) == 0)
				var xx = command_max_width;
			else
				xx = command_max_width + max_widths[array_length(max_widths) - 1];
			
			array_push(max_widths, max_width);
			for (j = sel; j < array_length(arg_array); j++)
			{
				tc = c_white;
				bc = c_black;
				if j == sel
				{
					tc = c_black;
					bc = c_white;
				}
				txt = string(arg_array[j]);
				draw_rectangle_color(xx, yy, xx + max_width, yy + height, bc, bc, bc, bc, false);
				draw_text_color(xx, yy, txt, tc, tc, tc, tc, 1);
				yy += height;
			}
		}
	}
}
