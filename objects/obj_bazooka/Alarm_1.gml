if sprite_index != spr_piraneapple_projectile
{
	create_particle(x, y, particle.cloudeffect, 0);
	alarm[1] = 6;
}
else
{
	with (create_blur_afterimage(x, y, sprite_index, image_index, image_xscale))
	{
		image_yscale = other.image_yscale;
		image_angle = other.image_angle;
	}
	alarm[1] = 3;
}
