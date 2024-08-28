function scr_initinput(open_savedata = true)
{
	tdp_input_init();
	
	global.spr_gamepadbuttons = spr_gamepadbuttons_style1;
	global.spr_joystick = spr_joystick_style1;
	
	// switch code here for switching style?
	
	if open_savedata
		ini_open("saveData.ini");
	
	tdp_input_add(new tdp_input_key("menu_reset_binds", [new tdp_input_action(tdp_input.keyboard, vk_f1)]));
	tdp_input_add(new tdp_input_key("menu_reset_bindsC", [new tdp_input_action(tdp_input.gamepad, gp_select)]));
	tdp_input_ini_read("menu_up", [tdp_action(tdp_input.keyboard, vk_up)]);
	tdp_input_ini_read("menu_down", [tdp_action(tdp_input.keyboard, vk_down)]);
	tdp_input_ini_read("menu_left", [tdp_action(tdp_input.keyboard, vk_left)]);
	tdp_input_ini_read("menu_right", [tdp_action(tdp_input.keyboard, vk_right)]);
	tdp_input_ini_read("menu_start", [tdp_action(tdp_input.keyboard, vk_escape)]);
	tdp_input_ini_read("menu_select", [tdp_action(tdp_input.keyboard, ord("Z")), tdp_action(tdp_input.keyboard, vk_space)]);
	tdp_input_ini_read("menu_back", [tdp_action(tdp_input.keyboard, ord("X")), tdp_action(tdp_input.keyboard, vk_escape)]);
	tdp_input_ini_read("menu_delete", [tdp_action(tdp_input.keyboard, ord("C"))]);
	tdp_input_ini_read("menu_quit", [tdp_action(tdp_input.keyboard, ord("X"))]);
	
	var _select = gp_face1;
	var _back = gp_face2;
	tdp_input_ini_read("menu_upC", [tdp_action(tdp_input.joystick, gp_axislv, -1), tdp_action(tdp_input.gamepad, gp_padu)]);
	tdp_input_ini_read("menu_downC", [tdp_action(tdp_input.joystick, gp_axislv, 1), tdp_action(tdp_input.gamepad, gp_padd)]);
	tdp_input_ini_read("menu_leftC", [tdp_action(tdp_input.joystick, gp_axislh, -1), tdp_action(tdp_input.gamepad, gp_padl)]);
	tdp_input_ini_read("menu_rightC", [tdp_action(tdp_input.joystick, gp_axislh, 1), tdp_action(tdp_input.gamepad, gp_padr)]);
	tdp_input_ini_read("menu_startC", [tdp_action(tdp_input.gamepad, gp_start)]);
	tdp_input_ini_read("menu_selectC", [tdp_action(tdp_input.gamepad, _select)]);
	tdp_input_ini_read("menu_backC", [tdp_action(tdp_input.gamepad, _back)]);
	tdp_input_ini_read("menu_deleteC", [tdp_action(tdp_input.gamepad, gp_face4)]);
	tdp_input_ini_read("menu_quitC", [tdp_action(tdp_input.gamepad, gp_face3)]);
	tdp_input_ini_read("player_up", [tdp_action(tdp_input.keyboard, vk_up)]);
	tdp_input_ini_read("player_right", [tdp_action(tdp_input.keyboard, vk_right)]);
	tdp_input_ini_read("player_left", [tdp_action(tdp_input.keyboard, vk_left)]);
	tdp_input_ini_read("player_down", [tdp_action(tdp_input.keyboard, vk_down)]);
	tdp_input_ini_read("player_jump", [tdp_action(tdp_input.keyboard, ord("Z"))]);
	tdp_input_ini_read("player_slap", [tdp_action(tdp_input.keyboard, ord("X"))]);
	tdp_input_ini_read("player_taunt", [tdp_action(tdp_input.keyboard, ord("C"))]);
	tdp_input_ini_read("player_shoot", [tdp_action(tdp_input.keyboard, ord("A"))]);
	tdp_input_ini_read("player_attack", [tdp_action(tdp_input.keyboard, vk_shift)]);
	tdp_input_ini_read("player_groundpound", []);
	tdp_input_ini_read("player_superjump", []);
	tdp_input_ini_read("player_upC", [tdp_action(tdp_input.joystick, gp_axislv, -1), tdp_action(tdp_input.gamepad, gp_padu)]);
	tdp_input_ini_read("player_downC", [tdp_action(tdp_input.joystick, gp_axislv, 1), tdp_action(tdp_input.gamepad, gp_padd)]);
	tdp_input_ini_read("player_leftC", [tdp_action(tdp_input.joystick, gp_axislh, -1), tdp_action(tdp_input.gamepad, gp_padl)]);
	tdp_input_ini_read("player_rightC", [tdp_action(tdp_input.joystick, gp_axislh, 1), tdp_action(tdp_input.gamepad, gp_padr)]);
	tdp_input_ini_read("player_jumpC", [tdp_action(tdp_input.gamepad, gp_face1)]);
	tdp_input_ini_read("player_slapC", [tdp_action(tdp_input.gamepad, gp_face3)]);
	tdp_input_ini_read("player_tauntC", [tdp_action(tdp_input.gamepad, gp_face4)]);
	tdp_input_ini_read("player_shootC", [tdp_action(tdp_input.gamepad, gp_face2)]);
	tdp_input_ini_read("player_attackC", [tdp_action(tdp_input.gamepad, gp_shoulderrb), tdp_action(tdp_input.gamepad, gp_shoulderr)]);
	tdp_input_ini_read("player_groundpoundC", []);
	tdp_input_ini_read("player_superjumpC", []);
	
	global.key_up = ini_read_string("ControlsKeys", "up", vk_up);
	global.key_right = ini_read_string("ControlsKeys", "right", vk_right);
	global.key_left = ini_read_string("ControlsKeys", "left", vk_left);
	global.key_down = ini_read_string("ControlsKeys", "down", vk_down);
	global.key_jump = ini_read_string("ControlsKeys", "jump", ord("Z"));
	global.key_slap = ini_read_string("ControlsKeys", "slap", ord("X"));
	global.key_taunt = ini_read_string("ControlsKeys", "taunt", ord("C"));
	global.key_shoot = ini_read_string("ControlsKeys", "shoot", ord("A"));
	global.key_attack = ini_read_string("ControlsKeys", "attack", vk_shift);
	global.key_start = ini_read_string("ControlsKeys", "start", vk_escape);
	global.key_chainsaw = ini_read_string("ControlsKeys", "chainsaw", ord("V"));
	
	global.key_upC = ini_read_string("ControllerButton", "up", gp_padu);
	global.key_rightC = ini_read_string("ControllerButton", "right", gp_padr);
	global.key_leftC = ini_read_string("ControllerButton", "left", gp_padl);
	global.key_downC = ini_read_string("ControllerButton", "down", gp_padd);
	global.key_jumpC = ini_read_string("ControllerButton", "jump", gp_face1);
	global.key_slapC = ini_read_string("ControllerButton", "slap", gp_face3);
	global.key_tauntC = ini_read_string("ControllerButton", "taunt", gp_face4);
	global.key_shootC = ini_read_string("ControllerButton", "shoot", gp_face2);
	global.key_attackC = ini_read_string("ControllerButton", "attack", gp_shoulderrb);
	global.key_startC = ini_read_string("ControllerButton", "start", gp_start);
	global.key_chainsawC = ini_read_string("ControllerButton", "chainsaw", gp_shoulderl);
	global.key_superjumpC = ini_read_string("ControllerButton", "superjump", noone);
	global.key_groundpoundC = ini_read_string("ControllerButton", "groundpound", noone);
	
	var dz = 0.4;
	var dzv = 0.1;
	var dzh = 0.1;
	var dzp = 0.15;
	var dzs = 0.85;
	var dzc = 0.65;
	global.input_controller_deadzone = ini_read_real("InputConfig", "deadzone", dz);
	global.input_controller_deadzone_vertical = ini_read_real("InputConfig", "deadzone_vert", dzv);
	global.input_controller_deadzone_horizontal = ini_read_real("InputConfig", "deadzone_horiz", dzh);
	global.input_controller_deadzone_press = ini_read_real("InputConfig", "deadzonepress", dzp);
	global.gamepad_deadzone_superjump = ini_read_real("InputConfig", "deadzonesuperjump", dzs);
	global.gamepad_deadzone_crouch = ini_read_real("InputConfig", "deadzonecrouch", dzc);
	global.gamepad_superjump = ini_read_real("InputConfig", "superjump", 1);
	global.gamepad_groundpound = ini_read_real("InputConfig", "groundpound", 1);
	global.keyboard_superjump = ini_read_real("InputConfig", "kb_superjump", 1);
	global.keyboard_groundpound = ini_read_real("InputConfig", "kb_groundpound", 1);
	
	if open_savedata
		ini_close();
}
