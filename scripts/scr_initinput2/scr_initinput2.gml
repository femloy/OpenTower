function scr_initinput2()
{
	ini_open("saveData.ini");
	
	global.key_upN = ini_read_string("ControlsKeys2", "up", ord("W"));
	global.key_rightN = ini_read_string("ControlsKeys2", "right", ord("D"));
	global.key_leftN = ini_read_string("ControlsKeys2", "left", ord("A"));
	global.key_downN = ini_read_string("ControlsKeys2", "down", ord("S"));
	global.key_jumpN = ini_read_string("ControlsKeys2", "jump", ord("L"));
	global.key_slapN = ini_read_string("ControlsKeys2", "slap", ord("K"));
	global.key_tauntN = ini_read_string("ControlsKeys2", "taunt", ord("O"));
	global.key_shootN = ini_read_string("ControlsKeys2", "shoot", ord("I"));
	global.key_attackN = ini_read_string("ControlsKeys2", "attack", ord("J"));
	global.key_startN = ini_read_string("ControlsKeys2", "start", ord("P"));
	global.key_chainsawN = ini_read_string("ControlsKeys", "chainsaw", ord("M"));
	
	global.key_upCN = ini_read_string("ControllerButton", "up", gp_padu);
	global.key_rightCN = ini_read_string("ControllerButton", "right", gp_padr);
	global.key_leftCN = ini_read_string("ControllerButton", "left", gp_padl);
	global.key_downCN = ini_read_string("ControllerButton", "down", gp_padd);
	global.key_jumpCN = ini_read_string("ControllerButton", "jump", gp_face1);
	global.key_slapCN = ini_read_string("ControllerButton", "slap", gp_face3);
	global.key_tauntCN = ini_read_string("ControllerButton", "taunt", gp_face4);
	global.key_shootCN = ini_read_string("ControllerButton", "shoot", gp_face2);
	global.key_attackCN = ini_read_string("ControllerButton", "attack", gp_shoulderr);
	global.key_startCN = ini_read_string("ControllerButton", "start", gp_start);
	global.key_chainsawCN = ini_read_string("ControlsKeys", "chainsaw", gp_shoulderl);
	
	ini_close();
}
