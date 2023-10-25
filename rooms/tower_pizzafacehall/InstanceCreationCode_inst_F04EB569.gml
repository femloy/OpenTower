targetRoom = tower_finalhallway;
level = "exit";
sprite_index = spr_gate_exit;
bgsprite = spr_gate_exitBG;
title_index = 5;
title_sprite = spr_titlecards_title2;
titlecard_index = 15;
title_music = -4;

var _found = false;
ini_open_from_string(obj_savesystem.ini_str);
if (ini_read_string("Game", "finalrank", "none") != "none")
	_found = true;
ini_close();
if (!_found)
	instance_destroy();
