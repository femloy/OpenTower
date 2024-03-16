repeat 4
	create_debris(x, y, spr_ammoboxdebris);
with (instance_create(x, y, obj_parryeffect))
	sprite_index = spr_morthookgrabeffect;
