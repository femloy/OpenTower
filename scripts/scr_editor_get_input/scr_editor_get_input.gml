function scr_editor_get_input()
{
	key_mbleft = mouse_check_button(mb_left);
	key_mbleft2 = mouse_check_button_pressed(mb_left);
	key_mbright = mouse_check_button(mb_right);
	key_mbright2 = mouse_check_button_pressed(mb_right);
	key_mbmiddle = mouse_check_button(mb_middle);
	key_up = keyboard_check(ord("W"));
	key_down = keyboard_check(ord("S"));
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_ctrl = keyboard_check(vk_control);
	key_z = keyboard_check(ord("Z"));
	key_y = keyboard_check(ord("Y"));
	key_z2 = keyboard_check_pressed(ord("Z"));
	key_y2 = keyboard_check_pressed(ord("Y"));
}
