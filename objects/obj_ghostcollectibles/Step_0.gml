for (var i = 0; i < ds_list_size(collectiblelist); i++)
{
	var b = ds_list_find_value(collectiblelist, i);
	b.image_index += b.image_speed;
	if (b.image_index >= b.image_number)
		b.image_index = frac(b.image_index);
}
