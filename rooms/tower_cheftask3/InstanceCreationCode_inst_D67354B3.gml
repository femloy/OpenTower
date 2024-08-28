sprite_index = spr_achievement_prank;
achievement = "pranks3";
title_override = "pranks";
index = 2;
secretplus = 3;
if !quick_ini_read_real("", "achievements", achievement, false)
	instance_destroy();
