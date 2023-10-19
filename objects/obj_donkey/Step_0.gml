if (cooldown > 0)
	cooldown--;
if (sprite_index == spr_cowkick)
{
	if (floor(image_index) == (image_number - 1))
		sprite_index = spr_cowidle;
}
else if (blink)
{
	image_index = 1;
	blink = false;
}
else
	image_index = 0;
