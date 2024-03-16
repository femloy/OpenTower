x = playerid.x;
y = playerid.y;
image_xscale = playerid.xscale;
if (abs(playerid.hsp) <= 0 || playerid.state != states.mach3 || playerid.state == states.slipbanan || abs(playerid.movespeed) <= 12 || (playerid.collision_flags & colflag.secret) > 0 || playerid.cutscene || playerid.state == states.comingoutdoor || playerid.state == states.door || room == timesuproom)
	instance_destroy();
if room == timesuproom
	instance_destroy();
