if (global.kidspartycutscene == noone)
	global.kidspartycutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "kidsparty", false);
if (!global.kidspartycutscene)
	instance_destroy();
if (global.ghostsoldiercutscene == noone)
	global.ghostsoldiercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "ghostsoldier", false);
if (global.ghostsoldiercutscene)
	poweredon = true;
vmovespeed = 0;
hmovespeed = 4;
hscale = -1;
active = false;
if (poweredon && obj_player1.x < (room_width / 2))
	active = true;
