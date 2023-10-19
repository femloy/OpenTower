threshold = maxthreshold - floor(global.temperature / 100);
threshold = clamp(threshold, 0, maxthreshold);
if (threshold == 0)
{
	x = xstart - 99999;
	y = ystart - 99999;
	instance_destroy();
}
else
{
	x = xstart;
	y = ystart;
}
