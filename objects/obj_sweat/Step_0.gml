if (!instance_exists(followid) || followid.sprite_index != followid.scaredspr)
	instance_destroy();
image_speed = 0.35;
if (!instance_exists(followid))
{
	x = followid.x - (image_xscale * 50);
	y = followid.y - 50;
	image_xscale = followid.image_xscale;
}
