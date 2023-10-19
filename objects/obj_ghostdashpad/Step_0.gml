if (obj_player.ghostdash == 0 && cooldown == 0)
	visible = true;
if (cooldown > 0)
	cooldown--;
if (obj_player.state != states.ghost && (obj_player1.state != states.chainsaw || obj_player1.tauntstoredstate != states.ghost))
	image_alpha = 0.35;
else
	image_alpha = 1;
