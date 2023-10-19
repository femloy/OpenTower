targetRoom = floor2_roompepperman;
target_x = 560;
target_y = 402;
if (ds_list_find_index(global.saveroom, "peppah"))
{
	instance_destroy();
	with (instance_create(x, y, obj_doorblocked))
		sprite_index = spr_pepperdoor_closed;
}
sprite_index = spr_pepperdoor;
