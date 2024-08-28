sprite_index = spr_achievement_prank;
achievement = "pranks1";
title_override = "pranks";
index = 0;
secretplus = 5;
if !quick_ini_read_real("", "achievements", achievement, false)
	instance_destroy();
