if !active
	exit;
hovered = place_meeting(x, y, obj_editorcursor)
image_index = 0
if hovered
{
	var _angle = point_direction(x, y, obj_editorcursor.x, obj_editorcursor.y)
	_angle = floor(_angle / 45)
	image_index = (_angle + 1)
	if obj_editor.key_place
		on_left_click(image_index - 1)
}
