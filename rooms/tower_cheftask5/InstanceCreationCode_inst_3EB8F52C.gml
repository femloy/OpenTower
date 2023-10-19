sprite_index = spr_achievement_prank;
achievement = "pranks5";
index = 4;
secretplus = 1;
if (!quick_ini_read_real("", "achievements", achievement, false))
	instance_destroy();
