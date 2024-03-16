if !active
	exit;

hovered = obj_editorcursor.hovered_object == id
image_index = 0
if hovered
{
	image_index = 1
	if obj_editor.key_place
	{
		image_index = 2
		on_left_click()
	}
	else if obj_editor.key_delete
	{
		image_index = 2
		on_right_click()
	}
}
