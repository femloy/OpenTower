if editor_state == editor_states.saving
{
	save_level_update(global.current_level.name);
	exit;
}
if editor_state == editor_states.loading
{
	load_level_update(global.current_level.name);
	exit;
}
if (keyboard_check_pressed(vk_f3))
{
	save_level();
	exit;
}
if (keyboard_check_pressed(vk_f4))
{
	load_level();
	exit;
}
editor_input_update();
if global.current_level == -4
	exit;
current_room = global.current_level.current_room;
commands_update();
editor_camera_update();
switch editor_state
{
	case editor_states.instance_edit:
		instance_edit_update();
		break;
}