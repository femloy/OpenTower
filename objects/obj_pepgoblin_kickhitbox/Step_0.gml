if (instance_exists(baddieID))
{
	image_xscale = baddieID.image_xscale;
	x = baddieID.x + (baddieID.image_xscale * 50);
	y = baddieID.y;
	if (baddieID.object_index == obj_pepbat)
	{
		x = baddieID.x;
		y = baddieID.y;
		sprite_index = spr_pepbat_kick;
		mask_index = spr_pepbat_kick;
	}
}
