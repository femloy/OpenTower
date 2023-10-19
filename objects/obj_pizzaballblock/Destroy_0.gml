if (ds_list_find_index(global.saveroom, id) == -1)
{
	for (var i = 0; i < sprite_get_number(spr_pizzaballblock_debris); i++)
	{
		with (create_debris(x, y, spr_pizzaballblock_debris))
			image_index = i;
	}
	ds_list_add(global.saveroom, id);
}
