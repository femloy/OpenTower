image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;
if ((playerid.image_index > 3 || playerid.state != states.slap) && playerid.state != states.handstandjump && playerid.state != states.hookshot)
	instance_destroy();
