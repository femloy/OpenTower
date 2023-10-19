x = obj_pepperman.x + (obj_pepperman.image_xscale * 35);
y = obj_pepperman.y + 20;
image_xscale = obj_pepperman.image_xscale;
if (obj_pepperman.sprite_index != spr_pepperman_charge)
	instance_destroy();
