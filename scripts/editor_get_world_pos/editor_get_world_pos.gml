function editor_get_world_pos()
{
	var xx = floor((obj_editorcursor.x * obj_editor.zoom) + camera_get_view_x(view_camera[0]));
	var yy = floor((obj_editorcursor.y * obj_editor.zoom) + camera_get_view_y(view_camera[0]));
	return [xx, yy];
}
