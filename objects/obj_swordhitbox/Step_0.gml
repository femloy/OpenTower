image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;
if playerid.sprite_index != spr_knightpep_attack && playerid.state != states.parry && playerid.state != states.finishingblow
	instance_destroy();
