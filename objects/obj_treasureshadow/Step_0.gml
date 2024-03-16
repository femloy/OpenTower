x = playerid.x;
y = playerid.y;
if playerid.grounded
	visible = true;
else
	visible = false;
image_xscale = playerid.xscale;
if !playerid.visible
	visible = false;
