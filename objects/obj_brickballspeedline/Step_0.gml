if (!instance_exists(playerid))
{
	instance_destroy();
	exit;
}
x = playerid.x;
y = playerid.y;
image_xscale = playerid.image_xscale;
