if (instance_exists(obj_taxi))
{
	if (obj_taxi.sprite_index != spr_taxiidle)
		instance_destroy();
}
else
	instance_destroy();
