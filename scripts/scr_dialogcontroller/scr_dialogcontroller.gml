function scr_get_tutorial_key(char)
{
	var spr = -4;
	var ix = 0;
	var txt = -4;
	switch char
	{
		case vk_left:
			spr = global.spr_gamepadbuttons;
			ix = 16;
			break;
		case vk_right:
			spr = global.spr_gamepadbuttons;
			ix = 17;
			break;
		case vk_up:
			spr = global.spr_gamepadbuttons;
			ix = 4;
			break;
		case vk_down:
			spr = global.spr_gamepadbuttons;
			ix = 5;
			break;
		case vk_shift:
		case vk_lshift:
			spr = spr_tutorialkeyspecial;
			ix = 0;
			break;
		case vk_control:
		case vk_lcontrol:
			spr = spr_tutorialkeyspecial;
			ix = 1;
			break;
		case vk_space:
			spr = spr_tutorialkeyspecial;
			ix = 2;
			break;
		default:
			spr = spr_tutorialkey;
			ix = 0;
			txt = chr(char);
			break;
	}
	return [spr, ix, txt];
}
function scr_string_width(str)
{
	var pos = 0;
	var w = 0;
	var originalstr = str;
	var str_arr = array_create(0);
	while pos < string_length(originalstr)
	{
		if string_copy(originalstr, pos, 2) == "\n"
		{
			array_push(str_arr, string_copy(originalstr, 1, pos));
			string_delete(originalstr, 1, pos);
			pos = 0;
			if originalstr == ""
				break;
			continue;
		}
		pos++;
	}
	if array_length(str_arr) == 0
		w = string_width(str);
	for (var i = 0; i < array_length(str_arr); i++)
	{
		var b = str_arr[i];
		if string_width(b) > w
			w = string_width(b);
	}
	return w;
}
function scr_separate_text(str, font, width)
{
	if font != noone
		draw_set_font(font);
	
	var separation = lang_get_value("separation_map");
	separation = string_split(separation, ",");
	
	var _start_pos = 0;
	while scr_string_width(str) > width - string_width("a")
	{
		var _pos = _start_pos;
		var _sep_pos = _pos;
		
		for (var len = string_length(str); _pos < len; _pos++)
		{
			if scr_is_separation(string_char_at(str, _pos), separation)
			{
				var _prev_sep_pos = _sep_pos;
				_sep_pos = _pos;
				
				if scr_string_width(string_copy(str, _start_pos, _pos - _start_pos)) > width - string_width("a")
				{
					_sep_pos = _prev_sep_pos;
					_start_pos = _sep_pos;
					_pos = _start_pos;
					break;
				}
			}
		}
		
		if string_char_at(str, _sep_pos) == " "
		{
			str = string_delete(str, _sep_pos, 1);
			str = string_insert("\n", str, _sep_pos);
		}
		else
			str = string_insert("\n", str, _sep_pos + 1);
	}
	return str;
}
function scr_is_separation(char, separation)
{
	for (var i = 0; i < array_length(separation); i++)
	{
		if char == separation[i]
			return true;
	}
	return false;
}
function scr_calculate_text(str)
{
	draw_set_font(font2);
	var pos = 0;
	var str2 = "";
	while (pos <= string_length(str))
	{
		pos++;
		str2 = string_insert(string_char_at(str, pos), str2, string_length(str2) + 1);
		str2 = scr_separate_text(str2);
	}
	return str2;
}
function scr_calculate_height(str)
{
	var str2 = scr_calculate_text(str);
	return string_height(str2);
}
