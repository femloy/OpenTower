with (instance_create(x, y, obj_sausageman_dead))
	sprite_index = spr_policecar_dead;
with obj_policebooth
	released = false;
ds_queue_destroy(followqueue);
