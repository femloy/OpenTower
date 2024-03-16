event_inherited()
if (!instance_exists(inst))
	exit;

if obj_editor.instance_state == inst_states.idle
{
	x = (inst.bbox_right + 16)
	y = inst.bbox_top
	while place_meeting(x, y, obj_buttoncomponent)
		y += ((bbox_bottom - bbox_top) + 4)
	with obj_editor
	{
		var pos = editor_get_world_pos()
		var xx = pos[0]
		var yy = pos[1]
		if (key_place && (!(editor_is_cursor_on_ui(obj_editorcursor.x, obj_editorcursor.y))) && place_meeting(xx, yy, other))
			other.on_left_click()
	}
}
