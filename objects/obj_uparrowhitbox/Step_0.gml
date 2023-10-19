if (!instance_exists(ID))
{
	instance_destroy();
	exit;
}
x = ID.x;
y = ID.y;
sprite_index = ID.sprite_index;
image_xscale = ID.image_xscale;
image_yscale = ID.image_yscale;
mask_index = ID.mask_index;
