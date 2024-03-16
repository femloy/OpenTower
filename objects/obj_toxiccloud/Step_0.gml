x += hsp;
y += vsp;
if (!disappear && scr_solid(x, y))
	instance_destroy();
if disappear
{
	image_xscale = Approach(image_xscale, 0, 0.04);
	image_yscale = Approach(image_yscale, 0, 0.04);
	hsp = Approach(hsp, 0, 0.1);
	vsp = Approach(vsp, 0, 0.1);
	if image_xscale == 0
		instance_destroy();
}
