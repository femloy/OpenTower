if (!instance_exists(baddieID) || !baddieID.thrown || baddieID.state != states.stun)
{
	instance_destroy();
	exit;
}
x = baddieID.x;
y = baddieID.y;
image_xscale = -baddieID.image_xscale;
