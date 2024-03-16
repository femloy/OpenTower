if image_alpha == 1
	image_alpha = 0.5;
else
	image_alpha = 1;
cooldown = 0;
attackbuffer = 0;
if flickertime > 0
{
	if touchedground
		flickertime--;
	alarm[6] = 5;
}
if flickertime == 0
{
	alarm[6] = -1;
	image_alpha = 1;
}
