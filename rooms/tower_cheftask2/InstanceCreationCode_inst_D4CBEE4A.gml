sprite_index = spr_achievement_prank;
achievement = "pranks2";
title_override = "pranks";
index = 1;
secretplus = 4;
if !quick_ini_read_real("", "achievements", achievement, false)
	instance_destroy();
