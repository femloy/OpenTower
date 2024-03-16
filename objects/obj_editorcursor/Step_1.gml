var in = -2
with obj_editor
	in = input_method
if in < 0
{
	x = device_mouse_x_to_gui(0)
	y = device_mouse_y_to_gui(0)
}
else
{
	var s = 6
	x += (obj_editor.laxis_horizontal * s)
	y += (obj_editor.laxis_vertical * s)
	x = clamp(x, 0, CAMERA_WIDTH)
	y = clamp(y, 0, CAMERA_HEIGHT)
}
hovered_object = -4
var num = instance_place_list(x, y, obj_button, global.instancelist, false)
var _depth = 10000
var obj = noone
for (var i = 0; i < num; i++)
{
	var b = ds_list_find_value(global.instancelist, i)
	with b
	{
		if depth < _depth
		{
			_depth = depth
			obj = id
		}
	}
}
with obj
{
	other.hovered_object = id
	exit;
}
var pos = editor_get_world_pos();
with (instance_place(pos[0], pos[1], obj_component))
{
	other.hovered_object = id;
	exit;
}
with (instance_place(pos[0], pos[1], obj_editorobject))
{
	other.hovered_object = id;
	exit;
}
