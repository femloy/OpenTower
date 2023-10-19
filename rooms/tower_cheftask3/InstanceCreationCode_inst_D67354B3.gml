sprite_index = spr_achievement_prank;
achievement = "pranks3";
index = 2;
secretplus = 3;
if (!quick_ini_read_real("", "achievements", achievement, false))
	instance_destroy();
