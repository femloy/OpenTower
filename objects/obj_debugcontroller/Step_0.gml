if (DEBUG)
{
	if (keyboard_check_pressed(vk_f5))
	{
		active = !active;
		keyboard_string = "";
	}
	if (active)
	{
		var _search = false;
		if (keyboard_check(vk_anykey))
		{
			input_text += keyboard_string;
			for (var i = 0; i < string_length(keyboard_string); i++)
			{
				var b = string_char_at(keyboard_string, i + 1);
				var d = string_upper(b);
				if (d == "")
					d = string_lettersdigits(b);
				keyboard_key_release(ord(d));
			}
			keyboard_string = "";
			_search = true;
		}
		if (keyboard_check(vk_backspace))
		{
			input_text = string_delete(input_text, string_length(input_text), 1);
			keyboard_key_release(vk_backspace);
			_search = true;
		}
		if (keyboard_check_pressed(vk_enter))
		{
			DoCommand(input_text);
			input_text = "";
			keyboard_string = "";
			_search = true;
			active = false;
		}
		if (_search)
		{
			ds_list_clear(search_commands);
			search_w = 0;
			for (var i = 0; i < ds_list_size(command_list); i++)
			{
				var b = ds_list_find_value(command_list, i);
				var s = b.command_id;
				var d = _string_split(input_text, " ");
				var t = d[1];
				if (string_copy(s, 1, string_length(t)) == t)
				{
					var txt = concat(b.command_id, " ", b.format, " - ", b.description);
					ds_list_add(search_commands, txt);
					var w = string_width(txt);
					if (w > search_w)
						search_w = w;
				}
			}
		}
	}
}
