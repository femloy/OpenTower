if (ds_list_find_index(global.saveroom, id) == -1)
{
	instance_create(x, y, obj_bangeffect);
	with (instance_create(x, y, obj_pizzaslice))
		hsp = 2;
	with (instance_create(x, y, obj_pizzaslice))
		hsp = -2;
	repeat (6)
	{
		with (instance_create(x, y, obj_debris))
		{
			vsp = -5;
			sprite_index = spr_tvdebris;
		}
	}
	ds_list_add(global.saveroom, id);
}
