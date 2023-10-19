sprite_index = spr_achievement_prank;
achievement = "pranks4";
index = 3;
secretplus = 2;
if (!quick_ini_read_real("", "achievements", achievement, false))
	instance_destroy();
