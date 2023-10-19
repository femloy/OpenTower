if (image_alpha == 1)
	image_alpha = 0.5;
else
	image_alpha = 1;
if (staggerbuffer > 0)
	alarm[9] = 5;
else
{
	alarm[9] = -1;
	image_alpha = 1;
}
