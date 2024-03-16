if buffer > 0
	buffer--;
else if !expand
{
	expand = true;
	expandbuffer = 120;
}
if expand
{
	if expandbuffer > 0
	{
		image_xscale = Approach(image_xscale, dir * 10, 3);
		expandbuffer--;
	}
	else
	{
		image_xscale = Approach(image_xscale, 0, 5);
		if image_xscale == 0
			instance_destroy();
	}
}
