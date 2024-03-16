if (!instance_exists(baddieID))
{
	instance_destroy();
	exit;
}
x = baddieID.x;
y = baddieID.y;
image_xscale = baddieID.image_xscale;
if col_buffer > 0
	col_buffer--;
else if col_buffer == 0
{
	col_buffer = -1;
	collisioned = false;
}
if baddieID.state != states.millionpunch && baddieID.state != states.chainsaw
	instance_destroy();
