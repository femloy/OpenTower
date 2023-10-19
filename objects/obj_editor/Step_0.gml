scr_editor_get_input();
scr_editor_camera_update();
scr_editor_update_buttons();
switch (state)
{
	case 0:
		scr_editor_state_objects();
		break;
}
if (key_ctrl + key_z2)
	scr_undo_command();
if (key_ctrl + key_y2)
	scr_redo_command();
