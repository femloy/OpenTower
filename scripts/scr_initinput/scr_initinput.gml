function scr_initinput(open_savedata = true)
{
	if open_savedata
		ini_open("saveData.ini");
	
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
	
	global.gamepad_deadzone = ini_read_real("ControllerConfig", "deadzone", 0.4);
	global.gamepad_deadzone_vertical = ini_read_real("ControllerConfig", "deadzone_vert", 0.65);
	global.gamepad_deadzone_horizontal = ini_read_real("ControllerConfig", "deadzone_horiz", 0.5);
	global.gamepad_deadzone_press = ini_read_real("ControllerConfig", "deadzonepress", 0.5);
	global.gamepad_deadzone_superjump = ini_read_real("ControllerConfig", "deadzonesuperjump", 0.56);
    global.gamepad_deadzone_crouch = ini_read_real("ControllerConfig", "deadzonecrouch", 0.46);
	global.gamepad_superjump = ini_read_real("ControllerConfig", "superjump", 1);
	global.gamepad_groundpound = ini_read_real("ControllerConfig", "groundpound", 1);
	
	if open_savedata
		ini_close();
}
