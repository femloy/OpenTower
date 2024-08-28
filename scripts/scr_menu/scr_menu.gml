enum menutype
{
	toggle,
	multiple,
	press,
	slide
}

// functions
function menu_goto(menu_id)
{
	menu = 0;
	for (var i = 0; i < array_length(menus); i++)
	{
		var b = menus[i];
		if b.menu_id == menu_id
		{
			menu = i;
			break;
		}
	}
	optionselected = 0;
}
function create_menu_fixed(_menuid, _anchor, _xpad, _ypad, _backmenu = menus.options)
{
	return 
	{
		menu_id: _menuid,
		type: menutype.toggle,
		anchor: _anchor,
		xpad: _xpad,
		ypad: _ypad,
		backmenu: _backmenu,
		options: []
	};
}
function add_option_press(_menu, _optionid, _name, _func)
{
	var b = 
	{
		option_id: _optionid,
		type: menutype.press,
		func: _func,
		name: _name,
		localization: true
	};
	array_push(_menu.options, b);
	return b;
}
function add_option_toggle(_menu, _optionid, _name, _onchanged = noone)
{
	var b = 
	{
		option_id: _optionid,
		type: menutype.toggle,
		value: false,
		name: _name,
		on_changed: _onchanged
	};
	array_push(_menu.options, b);
	return b;
}
function add_option_multiple(_menu, _optionid, _name, _values, _onchanged = noone)
{
	var b = 
	{
		option_id: _optionid,
		type: menutype.multiple,
		values: _values,
		value: 0,
		name: _name,
		on_changed: _onchanged
	};
	array_push(_menu.options, b);
	return b;
}
function create_option_value(_name, _value, _localization = true)
{
	return 
	{
		name: _name,
		value: _value,
		localization: _localization
	};
}
function add_option_slide(_menu, _optionid, _name, _onmove = noone, _onchanged = noone, _sound = noone)
{
	var b = 
	{
		option_id: _optionid,
		type: menutype.slide,
		value: 100,
		moved: false,
		name: _name,
		on_changed: _onchanged,
		on_move: _onmove,
		slidecount: 0,
		moving: false,
		sound: -4
	};
	if _sound != noone
		b.sound = fmod_event_create_instance(_sound);
	array_push(_menu.options, b);
	return b;
}
function menu_draw_text(xx, yy, str, color, alpha)
{
	var _break = false;
	var sub = false;
	var newstr = string_replace_all(str, "\\n", "\n");
	if string_length(newstr) != string_length(str)
	{
		_break = true;
		sub = true;
		str = newstr;
		tdp_draw_set_font(lang_get_font("smallfont"));
	}
	tdp_draw_text_color(xx, yy + (_break ? 2 : 0), str, color, color, color, color, alpha);
	if sub
		tdp_draw_set_font(lang_get_font("bigfont"));
	return _break;
}
function menu_lang_value(entry)
{
	var text = lang_get_value(entry);
	switch entry
	{
		case "option_controller_superjump":
		case "option_controller_groundpound":
			text = string_replace_all(text, "%", lang_get_value("joystick_steam")); // joystick_switch?
			break;
	}
	return text;
}
