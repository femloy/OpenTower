function string_split(input, split)
{
	input += " ";
	var _current_str = "";
	var _list = array_create(0);
	for (var i = 1; i < string_length(input) + 1; i++)
	{
		var _char = string_char_at(input, i);
		if _char != split
			_current_str += _char;
		else
		{
			array_push(_list, _current_str);
			_current_str = "";
		}
	}
	return _list;
}
function function_overload(arg_array, func)
{
	var _size = array_length(arg_array);
	switch _size
	{
		case 0:
			func();
			break;
		case 1:
			func(arg_array[0]);
			break;
		case 2:
			func(arg_array[0], arg_array[1]);
			break;
		case 3:
			func(arg_array[0], arg_array[1], arg_array[2]);
			break;
		case 4:
			func(arg_array[0], arg_array[1], arg_array[2], arg_array[3]);
			break;
		case 5:
			func(arg_array[0], arg_array[1], arg_array[2], arg_array[3], arg_array[4]);
			break;
		case 6:
			func(arg_array[0], arg_array[1], arg_array[2], arg_array[3], arg_array[4], arg_array[5]);
			break;
		case 7:
			func(arg_array[0], arg_array[1], arg_array[2], arg_array[3], arg_array[4], arg_array[5], arg_array[6]);
			break;
	}
}
function DebugCommand(_id, _desc, _format, _func) constructor
{
	command_id = _id;
	description = _desc;
	format = _format;
	func = _func;
	
	Invoke = function(args)
	{
		if args != undefined
			function_overload(args, func);
		else
			func();
	};
}
function TextList_Add(type, text)
{
	with obj_debugcontroller
	{
		if DEBUG
			ds_list_add(text_list, [type, text]);
	}
}
