targetRoom = tower_tutorial1
if (!obj_player1.ispeppino)
	targetRoom = tower_tutorial1N
level = "tutorial"
sprite_index = spr_gate_tutorial
bgsprite = spr_gate_tutorialBG
title_index = 1
titlecard_index = 1
title_music = "event:/music/w1/medievaltitle"
if global.swapmode
	instance_destroy()
